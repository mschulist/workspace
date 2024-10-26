import numpy as np
import itertools


class Profile:
    def __init__(self, profile: np.ndarray):
        self.profile = profile
        self.n_voters = profile.shape[0]
        self.n_candidates = profile.shape[1]

    def get_d_matrix(self):
        """
        Given a profile, return the d matrix.

        Profile is a numpy array of shape (n_voters, n_candidates), where
        each ballot has a ranking of the candidates.

        For example, a ballot [1, 0, 2] means that candidate 0 is in index 1,
        candidate 1 is in index 0, and candidate 2 is in index 2.
        """
        d_matrix = np.zeros((self.n_candidates, self.n_candidates))

        for comb in itertools.combinations(range(self.n_candidates), 2):
            for i in range(self.n_voters):
                a = comb[0]
                b = comb[1]
                if self.profile[i][a] < self.profile[i][b]:
                    d_matrix[a][b] += 1
                else:
                    d_matrix[b][a] += 1

        for i in range(self.n_candidates):
            for j in range(self.n_candidates):
                if i == j:
                    d_matrix[i][j] = 0
                elif d_matrix[i][j] > d_matrix[j][i]:
                    d_matrix[j][i] = 0

        return d_matrix

    def get_p_matrix(self, d_matrix: np.ndarray):
        """
        Given a d matrix, return the p matrix.

        The p matrix is the strength of the strongest path from i to j.

        For example, if the strongest path from i to j is 3, then p_matrix[i][j] = 3.
        """

        p_matrix = np.zeros((self.n_candidates, self.n_candidates))

        for cand1 in range(self.n_candidates):
            for cand2 in range(self.n_candidates):
                if cand1 != cand2:
                    strength = d_matrix[cand1][cand2]
                    if strength > d_matrix[cand2][cand1]:
                        p_matrix[cand1][cand2] = strength

        for cand1 in range(self.n_candidates):
            for cand2 in range(self.n_candidates):
                if cand1 != cand2:
                    for cand3 in range(self.n_candidates):
                        if cand3 not in (cand1, cand2):
                            curr_value = p_matrix[cand2][cand3]
                            new_value = min(
                                p_matrix[cand2][cand1],
                                p_matrix[cand1][cand3],
                            )
                            if new_value > curr_value:
                                p_matrix[cand2][cand3] = new_value
        return p_matrix

    def rank_p(self, p_matrix: np.ndarray):
        """
        Given a p matrix, return the ranking of the candidates.
        """
        ranking = np.zeros(self.n_candidates)
        for i in range(self.n_candidates):
            for j in range(self.n_candidates):
                if i != j:
                    if p_matrix[i][j] > p_matrix[j][i]:
                        ranking[i] += 1
        return ranking


if __name__ == "__main__":
    profile = np.array(
        [
            [0, 1, 2, 3],
            [0, 2, 3, 1],
            [2, 0, 1, 3],
            [3, 1, 2, 0],
            [3, 1, 2, 0],
        ]
    )
    profile = Profile(profile)
    d = profile.get_d_matrix()
    p = profile.get_p_matrix(d)
    print(p)
    ranking = profile.rank_p(p)
    print(ranking)
