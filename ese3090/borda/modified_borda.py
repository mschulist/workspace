import numpy as np


class Profile:
    """
    Implements Borda profile with modified weights.
    """

    def __init__(self, n_voters: int, n_alternatives: int):
        self.n_voters = n_voters
        self.n_alternatives = n_alternatives
        self.preferences = np.zeros((n_voters, n_alternatives), dtype=int)
        self.weights = np.zeros(n_alternatives, dtype=int)  # Initialize as zeros and set later
        self._simulate_preferences()
        self._simulate_weights()

    def _simulate_preferences(self):
        """Simulate each voter's ranking as a random permutation of alternatives."""
        for i in range(self.n_voters):
            self.preferences[i] = np.random.permutation(self.n_alternatives)

    def _simulate_weights(self):
        """Assign modified weights to alternatives with a linear progression."""
        highest = np.random.randint(-100, 100)
        step = np.random.randint(1, 100)  # Ensure step is non-zero
        for i in range(self.n_alternatives):
            self.weights[i] = highest - i * np.random.randint(1, step)

    def determine_winner(self):
        """
        Calculate the winner based on two score systems:
        1. Modified scores: weighted by custom linear weights.
        2. Borda scores: standard Borda count.
        """
        modified_scores = np.zeros(self.n_alternatives)
        borda_scores = np.zeros(self.n_alternatives)

        # Calculate scores for each alternative
        for i in range(self.n_voters):
            for j in range(self.n_alternatives):
                voter = self.preferences[i][j]
                modified_scores[voter] += self.weights[j]
                borda_scores[voter] += self.n_alternatives - j

        print(f"Modified scores: {modified_scores}")
        print(f"Borda scores: {borda_scores}")

        # Return the winners for each scoring system
        return np.argmax(modified_scores), np.argmax(borda_scores)
