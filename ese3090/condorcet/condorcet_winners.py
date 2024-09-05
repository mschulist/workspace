from typing import List
import numpy as np


class Profile:
    """
    Profile is a class representing a profile of votes. It contains a list of alternatives and a list of votes.
    """

    def __init__(self, num_alternatives: int, num_voters: int, simulate: bool = True):
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
        return count_a_beats_b > count_b_beats_a

    def prefers(self, a: str, b: str, vote: List[str]):
        return vote.index(a) < vote.index(b)


if __name__ == "__main__":
    N_SIMS = 5000
    winners = []
    for _ in range(N_SIMS):
        profile = Profile(num_alternatives=3, num_voters=10)
        winners.append(profile.condorcet_winner())

    num_no_winners = sum(1 for w in winners if w is None)
    print(f"Probability of simulations with no Condorcet winner: {num_no_winners / N_SIMS}")
