from typing import List
import numpy as np
import pandas as pd
from concurrent.futures import ProcessPoolExecutor, as_completed
from tqdm import tqdm


class Profile:
    """
    Profile is a class representing a profile of votes. It contains a list of alternatives and a list of votes.
    """

    def __init__(self, num_alternatives: int, num_voters: int, simulate: bool = True):
        self.num_alternatives = num_alternatives
        self.alternatives = [f"A{i}" for i in range(num_alternatives)]
        self.num_voters = num_voters
        self.votes = []
        if simulate:
            self.simulate_votes()

    def simulate_votes(self):
        for _ in range(self.num_voters):
            self.votes.append(np.random.permutation(self.alternatives).tolist())

    def condorcet_winner(self):
        for a in self.alternatives:
            if all(self.beats(a, b) for b in self.alternatives if a != b):
                return a
        return None

    def beats(self, a: str, b: str):
        count_a_beats_b = sum(1 for vote in self.votes if self.prefers(a, b, vote))
        count_b_beats_a = sum(1 for vote in self.votes if self.prefers(b, a, vote))
        return count_a_beats_b >= count_b_beats_a

    def prefers(self, a: str, b: str, vote: List[str]):
        return vote.index(a) < vote.index(b)


def simulate_election(num_voters, num_candidates, num_simulations) -> float:
    winners = []
    for _ in range(num_simulations):
        profile = Profile(num_alternatives=num_candidates, num_voters=num_voters)
        winners.append(profile.condorcet_winner())
    return sum(1 for w in winners if w is None) / num_simulations  # Return probability


def run_simulation_task(n_voter, n_alt, num_simulations):
    p_no_winner = simulate_election(n_voter, n_alt, num_simulations)
    return n_voter, n_alt, p_no_winner


if __name__ == "__main__":
    N_SIMS = 5000
    n_voters = list(range(5, 1001))
    n_alternatives = list(range(5, 21))
    df = pd.DataFrame(columns=["n_voters", "n_alternatives", "p_no_winner"])

    # Use ProcessPoolExecutor for parallel execution
    with ProcessPoolExecutor() as executor:
        futures = [
            executor.submit(run_simulation_task, n_voter, n_alt, N_SIMS)
            for n_voter in n_voters
            for n_alt in n_alternatives
        ]

        # Process results as they complete and update the DataFrame
        for future in tqdm(as_completed(futures), total=len(futures)):
            n_voter, n_alt, p_no_winner = future.result()
            df = pd.concat(
                [
                    df,
                    pd.DataFrame(
                        [[n_voter, n_alt, p_no_winner]],
                        columns=["n_voters", "n_alternatives", "p_no_winner"],
                    ),
                ],
                ignore_index=True,
            )

    df.to_parquet("condorcet_winners_thread.csv", index=False)
