import numpy as np

n = 1000

P = np.zeros((n, n))

for i in range(1, n - 1):
    P[i][i-1] = 0.5
    P[i][i+1] = 0.5

P[0][1] = 1.0
P[n-1][n-2] = 0.5
print(P)

b = np.ones(n)

I = np.eye(n)
A = I - P
E = np.linalg.solve(A, b)

print("Expected steps to reach distance:", E[0])
