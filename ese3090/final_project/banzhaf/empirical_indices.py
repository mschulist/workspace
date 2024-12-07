import numpy as np
import polars as pl
from typing import List
from itertools import product

from tqdm import tqdm

ELECTORAL_VOTES_CSV = "data/electoral_college.csv"
ELECTION_RESULTS_CSV = "data/1976-2020-president.csv"
WINNER_CSV = "data/1976-2020-pres-winner.csv"
OLDEST_YEAR = 2000

presidents_csv = pl.read_csv(ELECTION_RESULTS_CSV, null_values=["NA"])
electoral_votes_csv = pl.read_csv(ELECTORAL_VOTES_CSV)
winner_csv = pl.read_csv(WINNER_CSV)


class StateCoalition:
    """
    past_election_results is an array of shape (num_past_elections) where value 1 means
    that the coalition voted for the winning president and 0 mean that the
    coalition voted for the losing president.
    """

    def __init__(
        self,
        states: List[str],
        num_states: int,
        electoral_votes: int,
    ):
        self.states = states
        self.num_states = num_states
        self.electoral_votes = electoral_votes
        past_results = self.get_past_election_results()
        if past_results is False:
            raise ValueError("Multiple candidates in the past elections")
        self.past_results = past_results

    @classmethod
    def create_state_coalition(cls, states: List[str]):
        electoral_votes = electoral_votes_csv.with_columns(
            pl.col("Full_State").str.to_lowercase().alias("state"),
        ).rename({"Electoral_College_Votes": "electoral_votes"})

        states = [state.lower() for state in states]

        electoral_votes = electoral_votes.filter(pl.col("state").is_in(states))
        total_votes = electoral_votes.select(pl.sum("electoral_votes")).to_numpy()[0][0]

        return cls(states, len(states), total_votes)

    def get_past_election_results(self) -> np.ndarray | bool:
        presidents = (
            presidents_csv.filter(pl.col("year") >= OLDEST_YEAR)
            .group_by(["year", "state"])
            .agg(pl.col("candidate").sort_by("candidatevotes", descending=True).first())
            .with_columns(
                pl.col("candidate").str.to_lowercase().alias("candidate"),
                pl.col("state").str.to_lowercase().alias("state"),
            )
        )

        past_election_results = []

        for year in range(OLDEST_YEAR, 2021, 4):
            coalition_votes = presidents.filter(pl.col("year") == year).filter(
                pl.col("state").is_in(self.states)
            )

            candidates = coalition_votes.select(pl.n_unique("candidate")).to_numpy()
            if candidates[0][0] != 1:
                candidates = coalition_votes.select(pl.col("candidate")).to_numpy()
                print(
                    f"Year {year} has multiple candidates: {candidates} for {self.states}"
                )
                return False

            coalition_candidate = coalition_votes.select(pl.col("candidate")).to_numpy()
            election_winner = (
                winner_csv.filter(pl.col("year") == year)
                .select(pl.col("name").str.to_lowercase())
                .to_numpy()
            )
            if coalition_candidate[0][0] == election_winner[0][0]:
                past_election_results.append(1)
            else:
                past_election_results.append(0)
        p = np.array(past_election_results)
        return p


class StateCoalitions:
    def __init__(self, state_coalitions: List[StateCoalition]):
        self.state_coalitions = state_coalitions
        self.num_coalitions = len(state_coalitions)
        self.past_results_matrix = self.get_past_results_matrix()
        self.weights = self.compute_electoral_weights()

    def compute_electoral_weights(self):
        """
        Given the state coaltions, compute the number of electoral votes each group
        of states has.

        Returns:
            np array of shape (num_coalitions) where each element is the number of
            electoral votes that the coalition has.
        """
        weights = np.zeros(self.num_coalitions)
        for i, coalition in enumerate(self.state_coalitions):
            weights[i] = coalition.electoral_votes
        return weights

    def get_past_results_matrix(self):
        """
        past results matrix has the shape (num_coalitions, num_past_elections) where
        the value 1 means that the coalition voted for the winning president and 0
        means that the coalition voted for the losing president.
        """
        past_results_matrix = []
        for coalition in self.state_coalitions:
            past_results_matrix.append(coalition.past_results)
        past_results = np.array(past_results_matrix)
        return past_results

    def get_past_results(self, coalition_combination: np.ndarray):
        """
        Given a combination of coalitions (super coalition, ie: a collection of a collection of states),
        return the past election results for the coalition combination.

        The combination is a binary array of length num_coalitions where 1 means that we
        include the coalition in the combination and 0 means that we exclude the
        coalition from the combination.

        For example, if we have two coalitions, the combination [1, 0] means that we
        want to know the number of times that the first coalition voted for the winning
        president and the second coalition voted for the losing president.
        """
        # in how many of the past elections was the boolean mask exactly equal to the super coalition that all voted 1

        selected_coalitions = (coalition_combination == 1).astype(int)

        num_times_won = 0

        for i in range(self.past_results_matrix.shape[1]):
            if np.array_equal(selected_coalitions, self.past_results_matrix[:, i]):
                num_times_won += 1

        return num_times_won

    def get_probabilites(self):
        """
        Get the probability of each coalition combination winning the election

        We return the probabilites along with the matrix that determines the coalition combination
        that corresponds to each probability.
        """
        all_possible_combinations = np.array(
            list(product([0, 1], repeat=self.num_coalitions))
        )
        print(all_possible_combinations.shape)
        probs = np.zeros(all_possible_combinations.shape[0])
        for i in tqdm(range(all_possible_combinations.shape[0])):
            x_i = self.get_past_results(all_possible_combinations[i])
            x_i_prime = self.get_past_results(all_possible_combinations[i] ^ 1)
            num_past_elections = self.past_results_matrix.shape[1]
            probs[i] = self._compute_prob(
                x_i, x_i_prime, num_past_elections, self.num_coalitions
            )
        return probs, all_possible_combinations

    def _compute_prob(self, x_i: int, x_i_prime: int, n: int, m: int):
        """
        Uses the formula for the posterior distribution from the paper.

        x_i: number of times the coalition voted for the winning president
        x_i_prime: number of times the coalition voted for the losing president

        n: number of past elections
        m: number of coalitions (voters)
        """
        return 1 / 2 * (x_i + x_i_prime + 1) / (n + 2 ** (m - 1))

    def get_winning_coalitions(self, all_possible_combinations: np.ndarray):
        """
        Given a matrix of shape (2**num_voters, num_voters) where
        each row is a coalition, return a matrix of shape (unknown, num_voters)
        where each row is a winning coalition.

        We do not know how many of the possible coalitions are winning coalitions, but
        that is our goal here!

        We return an array of indices of the winning coalitions.
        """
        winning_coalitions = []
        for i in range(all_possible_combinations.shape[0]):
            if np.dot(self.weights, all_possible_combinations[i]) > 270:
                winning_coalitions.append(i)

        w_c = np.array(winning_coalitions)
        return w_c

    def get_prob_of_winning_coalitions(
        self, probs: np.ndarray, winning_coalitions: np.ndarray
    ):
        """
        Given the probabilities of each coalition winning and the indices of the winning coalitions,
        return the probability of winning the election.
        """
        return probs[winning_coalitions].sum()

    def get_coalitions_where_voter_is_pivotal(
        self,
        all_coalitions: np.ndarray,
        voter_index: int,
    ):
        """
        Given the winning coalitions, return the coalitions where the voter is pivotal.
        """
        coalitions_where_voter_is_pivotal = []
        for i in range(all_coalitions.shape[0]):
            coalition = all_coalitions[i]

            # skip if the voter is not in the coalition
            if coalition[voter_index] == 0:
                continue

            # check to see if they would have lost anyways
            if np.dot(self.weights, coalition) <= 270:
                continue

            # Create a copy of coalition with voter removed
            coalition_without_voter = np.copy(coalition)
            coalition_without_voter[voter_index] = 0
            if np.dot(self.weights, coalition_without_voter) <= 270:
                coalitions_where_voter_is_pivotal.append(i)

        return np.array(coalitions_where_voter_is_pivotal)


if __name__ == "__main__":
    state_groups = pl.read_csv("data/state_groups2.csv")
    state_groups = state_groups.with_columns(
        pl.col("state").str.to_lowercase().alias("state")
    )
    states_in_grouped = state_groups.group_by("group").all().to_numpy()

    state_coalitions_list = []
    state_indices_map = {}
    for i, states in enumerate(states_in_grouped):
        states_list = list(states[1])
        state_coalitions_list.append(StateCoalition.create_state_coalition(states_list))
        for state in states_list:
            if i + 1 in state_indices_map:
                state_indices_map[i + 1].append(state)
            else:
                state_indices_map[i + 1] = [state]

    state_coalitions = StateCoalitions(state_coalitions_list)
    probs, coalitions = state_coalitions.get_probabilites()
    winning_coalitions = state_coalitions.get_winning_coalitions(coalitions)
    overall_prob = state_coalitions.get_prob_of_winning_coalitions(
        probs, winning_coalitions
    )
    print(overall_prob)

    probs_to_change = []
    for i in range(len(state_coalitions_list)):
        voter_pivotal = state_coalitions.get_coalitions_where_voter_is_pivotal(
            coalitions, i
        )
        voter_prob_to_change = probs[voter_pivotal].sum()
        print(f"Voter {i + 1} prob to change: {voter_prob_to_change / overall_prob}")
        probs_to_change.append(voter_prob_to_change / overall_prob)

    print(np.array(probs_to_change).sum())
    print(state_indices_map)

    print(probs)
    print(probs.sum())
    print(probs.shape)
