import numpy as np
import itertools
import polars as pl

# Using product instead of permutations allows repeated values
combinations = list(itertools.product([1, 2, 3, 4, 5], repeat=3))

print(combinations)


def get_energy(combination: tuple):
    return np.sum([i**2 for i in combination])


energy_dict = {}

for comb in combinations:
    energy = get_energy(comb)
    if energy > 27:
        continue
    if energy_dict.get(energy):
        energy_dict[energy].append(comb)
    else:
        energy_dict[energy] = [comb]


with open("degenerate_states.csv", "w") as f:
    for energy, states in energy_dict.items():
        if len(states) == 1:
            continue
        print(f"Energy: {energy}")
        for state in states:
            print(f"State: {state}")
            f.write(f'"{state}",{energy}\n')

df = pl.read_csv("degenerate_states.csv", has_header=False)
df.columns = ["state", "energy"]

df = df.sort("energy")


df.write_csv("degenerate_states.csv")
