#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 4")

= 10.10

$
  V(x) = 1 / 2 m omega^2 x^2
$

$
  H' = gamma x^3
$

==

First order energy corrections.

$
  E_n^((1)) = braket(n, H', n) = 0
$

Because we can never get back to the $n$ state with 3 ladder operators.

==

Second order energy corrections.

$
  E_n^((2)) = sum_(m eq.not n) (abs(braket(n^((0)), H', m^((0)))))^2 / (E_n^((0)) - E_m^((0)))
$

We know that $H' = gamma x^3$, so we can use ladder operators to solve.

$
  x^3 &= (planck.reduce / (2 m omega))^(3 / 2) (a^dagger + a)^3 \
  &= (planck.reduce / (2 m omega))^(3 / 2) [ underbrace(a^dagger a^dagger a^dagger, +3 comma sqrt((n+3)(n+2)(n+1))) + underbrace(a a a, -3 comma sqrt(n(n-1)(n-2))) + underbrace(a^dagger a^dagger a, +1 comma n sqrt(n+1)) + underbrace(a a^dagger a^dagger, +1 comma sqrt(n+1)(n+2)) \
    &quad + underbrace(a^dagger a a^dagger, +1 comma (n+1)^(3/2)) + underbrace(a^dagger a a, -1 comma n sqrt(n - 1)) + underbrace(a a^dagger a, -1 comma n^(3/2)) + underbrace(a a a^dagger, -1 comma sqrt(n) (n + 1))]
$

As we can see, we can only get to $n plus.minus {1,3}$ from where we started. Hence we only need to consider states where $m$ is 1 or 3 away from $n$ as otherwise the inner product will return 0.

$
  E_0^2 = abs(braket(0, H', 3))^2 / (E_0 - E_3) + abs(braket(0, H', 1))^2 / (E_0 - E_1)
$

$
  E_1^2 = abs(braket(1, H', 4))^2 / (E_1- E_4) + abs(braket(1, H', 0))^2 / (E_1 - E_0) + abs(braket(1, H', 2))^2 / (E_1 - E_2)
$

$
  E_2^2 = abs(braket(2, H', 1))^2 / (E_2 - E_1) + abs(braket(2, H', 3))^2 / (E_2 - E_3) + abs(braket(2, H', 5))^2 / (E_2 - E_5)
$

Now we can compute these inner products.

$
  E_n &= planck.reduce omega (1 / 2 + n) \
  E_n - E_m &= planck.reduce omega (n - m)
$

$
  abs(braket(0, H', 3))^2 / (E_0 - E_3) = (planck.reduce / (2 m omega))^(3) gamma^2 6 / (-3 planck.reduce omega)
$

$
  abs(braket(0, H', 1))^2 / (E_0 - E_1) = (planck.reduce / (2 m omega))^(3) gamma^2 9 / (-planck.reduce omega)
$

$
  abs(braket(1, H', 4))^2 / (E_1 - E_4) = (planck.reduce / (2 m omega))^(3) gamma^2 24 / (-3 planck.reduce omega)
$

$
  abs(braket(1, H', 0))^2 / (E_1 - E_0) = (planck.reduce / (2 m omega))^(3) gamma^2 9 / (planck.reduce omega)
$

$
  abs(braket(1, H', 2))^2 / (E_1 - E_2) = (planck.reduce / (2 m omega))^(3) gamma^2 72 / (-planck.reduce omega)
$

$
  abs(braket(2, H', 1))^2 / (E_2 - E_1) = (planck.reduce / (2 m omega))^(3) gamma^2 72 / (planck.reduce omega)
$

$
  abs(braket(2, H', 3))^2 / (E_2 - E_3) = (planck.reduce / (2 m omega))^(3) gamma^2 243 / (-planck.reduce omega)
$

$
  abs(braket(2, H', 5))^2 / (E_2 - E_5) = (planck.reduce / (2 m omega))^(3) gamma^2 60 / (-3 planck.reduce omega)
$

Plugging in we get:

$
  E_0^2 = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (-2 - 9) = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (-11)
$

$
  E_1^2 = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (9 - 24 / 3 - 72) = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (-71)
$

$
  E_2^2 = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (72 - 243 - 60 / 3) = (planck.reduce / (2 m omega))^(3) gamma^2 / (planck.reduce omega) (-191)
$

==

$
  ket(n^1) = sum_(m eq.not n) braket(m, H', n) / (E_n - E_m) ket(m^0)
$

$
  ket(0^1) &= braket(1, H', 0) / (E_1 - E_0) ket(1) + braket(3, H', 0) / (E_0 - E_3) ket(3) \
  &= (planck.reduce / (2 m omega))^(3 / 2) gamma^2 / (planck.reduce omega)[ 3 ket(1) - sqrt(6) / 3 ket(3)]
$

$
  ket(1^1) &= braket(0, H', 1) / (E_1 - E_0) + braket(2, H', 1) / (E_1 - E_2) + braket(4, H', 1) / (E_1 - E_4) \
  &= (planck.reduce / (2 m omega))^(3 / 2) gamma^2 / (planck.reduce omega) [3 ket(0) - 6sqrt(2) ket(2) - sqrt(24) / 3 ket(4)]
$

$
  ket(2^1) &= braket(1, H', 2) / (E_2 - E_1) + braket(3, H', 2) / (E_2 - E_3) + braket(5, H', 2) / (E_2 - E_5) \
  &= (planck.reduce / (2 m omega))^(3 / 2) gamma^2 / (planck.reduce omega)[6sqrt(2) ket(1) - 9sqrt(3) ket(3) - sqrt(60) / 3 ket(5)]
$

= 10.24

$
  H = V_0 mat(3, epsilon, 0, 0; epsilon, 3, 2 epsilon, 0; 0, 2 epsilon, 5, epsilon; 0, 0, epsilon, 7)
$

==

When $epsilon = 0$, then the eigenvalues are $3, 3, 5, 7$ with corresponding eigenvectors $vec(1,0,0,0), vec(0,1,0,0), vec(0,0,1,0), vec(0,0,0,1)$.

We find these by just reading them off of the diagonal.

==

We know that $ket(1), ket(2)$ are degenerate and $ket(3), ket(4)$ are not. Let's find the non-degenerate energy corrections first.

$
  H' = V_0 mat(0, epsilon, 0, 0; epsilon, 0, 2 epsilon, 0; 0, 2 epsilon, 0, epsilon; 0, 0, epsilon, 0)
$

We can see that $braket(3, H', 3) = braket(4, H', 4) = 0$ so we need to go to the second order to find a nonzero term.

$
  E_3^2 &= abs(braket(2, H', 3))^2 / (E_3 - E_2) + abs(braket(4, H', 3))^2 / (E_3 - E_4) \
  &= (4V_0^2 epsilon^2) / (2 V_0) + (V_0^2 epsilon^2) / (2 V_0) \
  &= 3 / 2 epsilon^2 V_0
$

$
  E_4^2 &= abs(braket(3, H', 4))^2 / (E_4 - E_3) \
  &= (V_0^2 epsilon^2) / (2V_0) \
  &= 1 / 2 V_0 epsilon^2
$

Now we can handle the degenerate cases by solving for the eigenvalues of the subspace containing the degenerate states.

$
  H'_d = V_0 mat(0, epsilon; epsilon, 0)
$

Now we diagonalize:

#set math.mat(delim: "|")
$
  mat(-lambda, V_0 epsilon; V_0 epsilon, -lambda) &= lambda^2 - (V_0 epsilon)^2 = 0 \
  ==> lambda &= plus.minus epsilon V_0
$

Hence the corrected energies for all 4 states are:

$
  E_4 &= V_0(5 + 3 / 2 epsilon^2) \
  E_3 &= V_0(7 + 1 / 2 epsilon^2) \
  E_2 &= V_0(3 + epsilon) \
  E_1 &= V_0(3 - epsilon)
$