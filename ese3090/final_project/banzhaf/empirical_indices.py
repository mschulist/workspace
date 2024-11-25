import numpy as np
import polars as pl
from typing import List
from tqdm import tqdm
from itertools import product

ELECTORAL_VOTES_CSV = "data/electoral_college.csv"
ELECTION_RESULTS_CSV = "data/1976-2020-president.csv"
WINNER_CSV = "data/1976-2020-pres-winner.csv"
OLDEST_YEAR = 2012

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
        self.past_results = self.get_past_election_results()

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

    def get_past_results_matrix(self):
        """
        past results matrix has the shape (num_coalitions, num_past_elections) where
        the value 1 means that the coalition voted for the winning president and 0
        means that the coalition voted for the losing president.
        """
        past_results_matrix = []
        for coalition in self.state_coalitions:
            past_results_matrix.append(coalition.past_results)
        return np.array(past_results_matrix)

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
        probs = np.zeros(all_possible_combinations.shape[0])
        for i in range(all_possible_combinations.shape[0]):
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


if __name__ == "__main__":
    state_coalitions = [
        StateCoalition.create_state_coalition(
            ["california", "oregon", "washington", "hawaii"]
        ),
        StateCoalition.create_state_coalition(["texas", "missouri", "oklahoma"]),
        StateCoalition.create_state_coalition(
            ["new york", "new jersey", "connecticut"]
        ),
    ]

    state_coalitions = StateCoalitions(state_coalitions)

    print(state_coalitions.past_results_matrix)
    for i in range(2**state_coalitions.num_coalitions):
        print(
            state_coalitions.get_past_results(
                np.array(list(map(int, f"{i:0{state_coalitions.num_coalitions}b}")))
            )
        )

    probs, coalitions = state_coalitions.get_probabilites()
    print(probs)
    print(probs.sum())
