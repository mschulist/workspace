import numpy as np
import polars as pl
from typing import List
from dataclasses import dataclass
from tqdm import tqdm

ELECTORAL_VOTES_CSV = "data/electoral_college.csv"
ELECTION_RESULTS_CSV = "data/1976-2020-president.csv"
OLDEST_YEAR = 2016


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
        past_election_results: np.ndarray,
    ):
        self.states = states
        self.num_states = num_states
        self.electoral_votes = electoral_votes
        self.past_election_results = past_election_results

    @classmethod
    def create_state_coalition(cls, states: List[str]):
        electoral_votes = (
            pl.read_csv(ELECTORAL_VOTES_CSV)
            .with_columns(
                pl.col("Full_State").str.to_lowercase().alias("state"),
            )
            .rename({"Electoral_College_Votes": "electoral_votes"})
        )

        states = [state.lower() for state in states]

        electoral_votes = electoral_votes.filter(pl.col("state").is_in(states))
        total_votes = electoral_votes.select(pl.sum("electoral_votes")).to_numpy()[0][0]

        return cls(states, len(states), total_votes, np.array([]))

    # def verify_true_coalition(self):
    #     """
    #     Given the list of states and past election results, verify that everyone
    #     in the coalition always voted the same.
    #     """
    #     presidents = (
    #         pl.read_csv(ELECTION_RESULTS_CSV, null_values=["NA"])
    #         .filter(pl.col("year") >= OLDEST_YEAR)
    #         .group_by(["year", "state"])
    #         .agg(pl.col("candidate").sort_by("totalvotes").first())
    #         .with_columns(
    #             pl.col("candidate").str.to_lowercase().alias("candidate"),
    #             pl.col("state").str.to_lowercase().alias("state"),
    #         )
    #     )

    #     for year in range(OLDEST_YEAR, 2020, 4):
    #         coalition_votes = presidents.filter(pl.col("year") == year).filter(
    #             pl.col("state").is_in(self.states)
    #         )

    #         # weird way of checking if all the votes are the same for a given year
    #         candidates = coalition_votes.select(pl.n_unique("candidate")).to_numpy()
    #         if candidates[0][0] != 1:
    #             print(f"Year {year} has multiple candidates")
    #             return False

    #     return True

    def get_past_election_results(self):
        presidents = (
            pl.read_csv(ELECTION_RESULTS_CSV, null_values=["NA"])
            .filter(pl.col("year") >= OLDEST_YEAR)
            .group_by(["year", "state"])
            .agg(pl.col("candidate").sort_by("totalvotes").first())
            .with_columns(
                pl.col("candidate").str.to_lowercase().alias("candidate"),
                pl.col("state").str.to_lowercase().alias("state"),
            )
        )

        past_election_results = []

        for year in range(OLDEST_YEAR, 2020, 4):
            coalition_votes = presidents.filter(pl.col("year") == year).filter(
                pl.col("state").is_in(self.states)
            )

            candidates = coalition_votes.select(pl.n_unique("candidate")).to_numpy()
            if candidates[0][0] != 1:
                print(f"Year {year} has multiple candidates")
                return False

            coalition_candidate = coalition_votes.select(pl.col("candidate")).to_numpy()
            

        return np.ndarray(past_election_results)


class StateCoalitions:
    def __init__(self, state_coalitions: List[StateCoalition]):
        self.state_coalitions = state_coalitions
        self.num_coalitions = len(state_coalitions)


if __name__ == "__main__":
    state_coalitions = [
        StateCoalition.create_state_coalition(["california", "oregon", "washington"]),
        StateCoalition.create_state_coalition(["texas", "missouri", "oklahoma"]),
    ]

    state_coalitions = StateCoalitions(state_coalitions)
    print(state_coalitions.state_coalitions)
    print(state_coalitions.num_coalitions)

    for coalition in state_coalitions.state_coalitions:
        print(coalition.get_past_election_results())
