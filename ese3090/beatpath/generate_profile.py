import numpy as np
import csv
from beatpath import *


def generate_profile(n_voters: int, n_candidates: int) -> list:
    return [np.random.permutation(n_candidates).tolist() for _ in range(n_voters)]


def save_profile_to_csv(profile: list, filename: str):
    with open(filename, mode="w", newline="") as file:
        writer = csv.writer(file)
        writer.writerows(profile)


if __name__ == "__main__":
    profile = generate_profile(n_voters=int(1e6), n_candidates=5)
    print(profile[0])
    save_profile_to_csv(profile, "data/profile2.csv")
