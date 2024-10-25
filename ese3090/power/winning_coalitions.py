import numpy as np
from tqdm import tqdm
from concurrent.futures import ThreadPoolExecutor, as_completed


class Coalitions:
    def __init__(self, weights: np.ndarray, quota: float):
        self.n_voters = weights.shape[0]
        self.weights = weights
        self.quota = quota
        self.winning_coalitions = self.make_all_winning_coalitions()
        self.power = self.get_power(self.winning_coalitions)
        self.relative_power = self.power / np.sum(self.power)

    def make_all_winning_coalitions(self):
        all_coalitions = np.array(
            [
                list(map(int, np.binary_repr(i, width=self.n_voters)))
                for i in tqdm(range(2**self.n_voters))
            ]
        )
        winners = all_coalitions @ self.weights >= self.quota
        return all_coalitions[winners]

    def get_power(self, winning_coalitions: np.ndarray):
        minus_one = np.where(winning_coalitions == 0, -1, winning_coalitions)
        sum = np.sum(minus_one, axis=0)
        return sum


class MonteCarloCoalitions:
    def __init__(self, target_power: np.ndarray, n_samples: int = 1000, n_threads: int = 12):
        self.target_power = target_power
        self.n_samples = int(n_samples)
        self.n_voters = target_power.shape[0]
        self.total_weights = 100
        self.n_threads = n_threads

    def simulate_weights(self):
        random_weights = np.zeros((self.n_samples, self.n_voters))
        for i in range(self.n_voters):
            random_weights[:, i] = np.random.normal(
                loc=self.target_power[i] * self.total_weights,
                scale=self.total_weights / 10,
                size=self.n_samples,
            )
        random_weights = (
            random_weights / random_weights.sum(axis=1, keepdims=True) * self.total_weights
        )
        return random_weights

    def evaluate_sample(self, weights):
        best_coalition = None
        best_power = float("inf")
        for quota in range(1, self.total_weights):
            coalitions = Coalitions(weights, quota)
            power_diff = np.linalg.norm(coalitions.relative_power - self.target_power)
            if power_diff < best_power:
                best_coalition = coalitions
                best_power = power_diff
        return best_coalition

    def find_best_coalition(self):
        random_weights = self.simulate_weights()
        best_coalition = None
        best_power = float("inf")

        with ThreadPoolExecutor(max_workers=self.n_threads) as executor:
            futures = [
                executor.submit(self.evaluate_sample, random_weights[i])
                for i in range(self.n_samples)
            ]

            for future in tqdm(as_completed(futures), total=self.n_samples):
                coalition = future.result()
                power_diff = np.linalg.norm(coalition.relative_power - self.target_power)
                if power_diff < best_power:
                    best_coalition = coalition
                    best_power = power_diff
        return best_coalition, best_power


if __name__ == "__main__":
    eec = np.array([4, 4, 4, 2, 2, 1])
    coalitions = Coalitions(eec, quota=12)
    print(coalitions.relative_power)

    eeec = np.array([10, 10, 10, 10, 5, 5, 3, 3, 2])
    coalitions = Coalitions(eeec, quota=40)
    print(coalitions.relative_power)

    # E, F, G, Ita, B, N, Ire, D, L

    populations = np.array([56, 68, 84, 59, 12, 18, 5.1, 5.9, 0.65])
    benchmark_power = populations / np.sum(populations)
    print(benchmark_power)

    monte_carlo = MonteCarloCoalitions(benchmark_power, n_samples=500, n_threads=None)
    best_coalition, best_power = monte_carlo.find_best_coalition()
    print(f"Best power diff compared to benchmark: {best_power}")
    print(f"Best relative power: {best_coalition.relative_power}")
    print(f"Best weights: {best_coalition.weights}")
    print(f"Best quota: {best_coalition.quota}")
