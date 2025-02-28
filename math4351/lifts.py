# /// script
# dependencies = [
#   "networkx",
#   "matplotlib"
# ]
# ///


import networkx as nx
import matplotlib.pyplot as plt


def get_inverse(x: int, p: int) -> int:
    """
    Return the modular inverse of x modulo p.
    (Assumes that p is prime and x is not divisible by p.)
    """
    for i in range(1, p):
        if (x * i) % p == 1:
            return i
    raise ValueError(f"No inverse for {x} modulo {p}")


class Polynomial:
    def __init__(self, coeffs: list[int]):
        """
        Create a polynomial with integer coefficients.
        For example, f(x) = 2x + x^2 is represented by [0, 2, 1].
        """
        self.coeffs = coeffs
        self.deriv_coeffs = self.diff()

    def diff(self) -> list[int]:
        """Return the list of coefficients for the derivative."""
        return [i * self.coeffs[i] for i in range(1, len(self.coeffs))]

    def __call__(self, x: int, deriv: bool = False) -> int:
        """
        Evaluate the polynomial (or its derivative) at x.

        Args:
            x: The input value.
            deriv: If True, evaluate the derivative.
        """
        coeffs = self.deriv_coeffs if deriv else self.coeffs
        result = 0
        for i, c in enumerate(coeffs):
            result += c * (x**i)
        return result

    def __str__(self):
        res = ""
        for i, c in enumerate(self.coeffs):
            res += f"{c}x^{i} + "

        return res[:-2]


def lift(poly: Polynomial, p: int, max_j: int = 5) -> nx.DiGraph:
    """
    Create a directed graph representing the lifting of solutions of a polynomial f modulo
    successive powers of a prime p via Hensel's lemma.

    Each node is a tuple (a, j) meaning that a is a solution modulo p^j. An edge from
    (a, j) to (b, j+1) indicates that b is a valid Hensel lift of a.

    Args:
        poly: Polynomial object representing f(x)
        p: prime number for lifting
        max_j: maximum exponent (i.e. we find solutions modulo p^(max_j))

    Returns:
        A networkx.DiGraph representing the solution tree.
    """
    G = nx.DiGraph()

    def helper(a: int, j: int):
        node = (a, j)
        # Stop if we've reached the maximum exponent.
        if j >= max_j:
            return

        next_level = j + 1
        mod_next = p**next_level  # modulus for the next level
        f_val = poly(a)
        f_deriv = poly(a, deriv=True)

        # Case 1: Unique lift when f'(a) is invertible mod p.
        if f_deriv % p != 0:
            # Since a is a solution mod p^j, write f(a) = p^j * k.
            k = f_val // (p**j)
            inv = get_inverse(f_deriv, p)
            t = (-k * inv) % p
            a_next = a + t * (p**j)
            next_node = (a_next, next_level)
            if poly(a_next) % mod_next == 0:
                G.add_edge(node, next_node)
                helper(a_next, next_level)
        else:
            # Case 2: f'(a) ≡ 0 (mod p): multiple lifts exist only if f(a) is divisible by p^(j+1)
            if poly(a) % mod_next == 0:
                for i in range(p):
                    a_next = a + i * (p**j)
                    next_node = (a_next, next_level)
                    if poly(a_next) % mod_next == 0:
                        G.add_edge(node, next_node)
                        helper(a_next, next_level)
            # If f(a) is not divisible by p^(j+1), then no lift exists.

    # Start at level 1: find solutions modulo p.
    mod_level1 = p
    for a in range(p):
        if poly(a) % mod_level1 == 0:
            node = (a, 1)
            G.add_node(node)
            helper(a, 1)

    return G


def plot_lift_graph(G: nx.DiGraph, p: int, max_j: int = 5, title: str = None):
    """
    Plot the Hensel lifting graph using a layered layout based on the level.

    Args:
        G: networkx.DiGraph representing the lift tree.
        p: the prime used for lifting.
        max_j: maximum level in the graph.
        title: title for the plot.
    """
    pos = {}
    # Arrange nodes by level: y-coordinate is the level, and x-coordinates are spread out.
    for level in range(1, max_j + 1):
        # Get all nodes at this level
        nodes_at_level = [node for node in G.nodes if node[1] == level]
        nodes_at_level = sorted(nodes_at_level, key=lambda x: x[0])
        n = len(nodes_at_level)
        for i, node in enumerate(nodes_at_level):
            pos[node] = (i - n / 2, level)

    plt.figure(figsize=(10, 6))
    nx.draw(
        G,
        pos,
        with_labels=True,
        node_color="lightblue",
        arrows=True,
        node_size=500,
        font_size=10,
    )
    print(title)
    plt.title(title)
    plt.savefig("hensel.png")
    plt.show()


if __name__ == "__main__":
    # For example, take f(x) = x^2 - 2 (represented by coefficients [-2, 0, 1])
    poly = Polynomial([223, 1, 1])
    prime = 3
    max_level = 7

    # Compute the lift graph
    G = lift(poly, prime, max_level)

    # Visualize the lift tree.
    plot_lift_graph(G, prime, max_level, title=f"Hensel Lifting of {poly} mod {prime}")
