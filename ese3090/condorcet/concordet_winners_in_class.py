import os
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np
from datetime import datetime
import pandas as pd
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor, as_completed


class Profile:
    def __init__(self, num_alternatives: int, n_voters: int):
        self.dtype = np.uint8
        self.num_alternatives = num_alternatives

        # Define the shape of the matrix
        shape = (n_voters, num_alternatives, num_alternatives)
        ballot = np.ones(shape, dtype=self.dtype)
        ballot *= np.triu(np.ones(shape, dtype=self.dtype), 0)

        # Generate random indices for shuffling rows
        indices = np.argsort(np.random.random(ballot.shape[:2]), axis=1)

        # Shuffle rows of each 2D sub-matrix
        ballot = np.take_along_axis(ballot, indices[:, :, np.newaxis], axis=1)
        ballot = np.take_along_axis(ballot, indices[:, np.newaxis, :], axis=2)

        # larger dtype because we can have values other than 0 and 1
        sum: np.ndarray = np.sum(ballot, axis=0, dtype=np.int32)

        sum_t = sum.T

        to_search = sum - sum_t

        # rows contains a vector of 1/0 values,
        # where 1 means that the row contains only positive values
        rows: np.ndarray = np.all(to_search >= 0, axis=1)
        self.single_winner = bool(rows.sum())

    def condorcet_winner(self):
        """
        Gets whether there is a condorcet winner or not
        """
        return self.single_winner


def run_simulation(num_alternatives: int, n_voters: int, n_sims: int):
    winners = []
    for _ in range(n_sims):
        profile = Profile(num_alternatives, n_voters)
        winners.append(profile.condorcet_winner())
    return 1 - np.mean(winners)


def simulate_voter_alternative_combination(num_alternatives, n_voters, n_sims):
    p_no_winner = run_simulation(num_alternatives, n_voters, n_sims)
    return {
        "n_alternatives": num_alternatives,
        "n_voters": n_voters,
        "p_no_winner": p_no_winner,
    }


if __name__ == "__main__":
    winners_all = []
    N_SIMS = 1000

    num_alternatives = range(1, 25)
    n_voters = range(1, 200)

    voter_alternative_combinations = [(a, b) for a in num_alternatives for b in n_voters]

    if os.path.exists("condorcet_winners.csv"):
        winners = pd.read_csv("condorcet_winners.csv")
    else:
        with ThreadPoolExecutor() as executor:
            futures = [
                executor.submit(simulate_voter_alternative_combination, a, b, N_SIMS)
                for a, b in voter_alternative_combinations
            ]

            for future in tqdm(as_completed(futures), total=len(futures)):
                winners_all.append(future.result())

        winners_df = pd.DataFrame(winners_all)
        winners_df.to_csv(f"condorcet_winners.csv")

    fig = plt.figure(figsize=(5, 6))

    # syntax for 3-D projection
    ax = plt.axes(projection="3d")

    colors = ["red" if n % 2 == 0 else "blue" for n in winners["n_voters"]]

    ax.scatter3D(winners["n_voters"], winners["n_alternatives"], winners["p_no_winner"], c=colors)

    red_patch = mpatches.Patch(color="red", label="Even number of alternatives")
    blue_patch = mpatches.Patch(color="blue", label="Odd number of alternatives")

    ax.legend(handles=[red_patch, blue_patch])

    ax.set_xlabel("Number of voters")
    ax.set_ylabel("Number of alternatives")
    ax.set_zlabel("Probability of no winner")
    ax.set_box_aspect(None, zoom=0.9)

    plt.title(
        "Number of voters, number of alternatives,\nand probability of no winner in Condorcet voting system"
    )

    plt.savefig(f"condorcet_winners.png")
