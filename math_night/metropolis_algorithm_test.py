import random
import matplotlib.pyplot as plt

island_order = []

for i in range(10):
    island_order.append(i*5)

# island_order = [30,6,10,5,7,3,8,2,9,4]

def flip(p):
    return True if random.random() < p else False

def sample(current_island, island_order):
    toss = random.randint(0, 1)
    index = island_order.index(current_island)
    if toss == 0:
        if index == 0:
            index = 10
        proposal_island = island_order[index-1]
    if toss == 1:
        if index == 9:
            index = -1
        proposal_island = island_order[index+1]
    if proposal_island > current_island:
        return proposal_island
    else:
        prob = proposal_island / current_island
        if flip(prob):
            return proposal_island
        else:
            return current_island


values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # number of days spent on island i
current_island = island_order[0]

for i in range(100000):
    current_island = sample(current_island, island_order)
    values[island_order.index(current_island)] += 1


print(values)

plt.bar(island_order, values)
plt.show()
