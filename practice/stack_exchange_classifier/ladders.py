from dataclasses import dataclass
import random

MAX_ROLLS = 1000
NUM_SIMS = 5000


@dataclass
class Params:
    probs: tuple[float, float, float, float, float, float]
    # num_ladders: int
    # num_snakes: int
    # ladders and snakes dict: from square -> to square
    ladders: dict[int, int]
    snakes: dict[int, int]


def roll_die(params: Params):
    return random.choices(list(range(1, 7)), params.probs)[0]
    # return np.random.choice(list(range(1,7)), p=params.probs)


def check_roll(params: Params, current: int, roll: int):
    # check to see if we got over 100
    if current + roll > 100:
        return current

    # check to see if we went down any ladders or snakes
    if current + roll in params.ladders:
        return params.ladders[current + roll]
    if current + roll in params.snakes:
        return params.snakes[current + roll]

    return current + roll


def single_simulation(params: Params):
    current = 1
    num_rolls = 0

    while current != 100:
        roll = roll_die(params)

        current = check_roll(params, current, roll)
        num_rolls += 1

        if num_rolls > MAX_ROLLS:
            return None

    return num_rolls


def mean(arr):
    total = 0
    for i in range(len(arr)):
        total += arr[i]
    return total / len(arr)


def run_many_sims(params: Params, num_sims: int):
    num_rolls = []
    for _ in range(num_sims):
        rolls = single_simulation(params)
        if rolls is not None:
            num_rolls.append(rolls)

    return mean(num_rolls)


num_boards = int(input())

board_avgs = []

for i in range(num_boards):
    probs = [float(x) for x in input().split(",")]

    # not used
    input()

    ladders = {}
    ladders_str = input().split(" ")
    for lad in ladders_str:
        split = lad.split(",")
        ladders[int(split[0])] = int(split[1])

    snakes = {}
    snakes_str = input().split(" ")
    for sna in snakes_str:
        split = sna.split(",")
        snakes[int(split[0])] = int(split[1])

    params = Params(probs, ladders, snakes)

    board_avgs.append(run_many_sims(params, NUM_SIMS))

for avg in board_avgs:
    print(int(avg))
