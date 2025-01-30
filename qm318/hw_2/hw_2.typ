#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 2")

=

==

$
  a = 0.11 "nm" quad quad kappa = 2.3 times 10^3 N / m
$

$
  E_(n, l) = (n + 1 / 2)planck.reduce sqrt(kappa / mu) + (planck.reduce^2 l(l + 1)) / (2 mu a^2)
$

We can find the energies corresponding to the ground state $(n = 0, l = 0)$ and the states where one of the quantum numbers is nonzero.

$
  E_(0,0) &= 1 / 2 planck.reduce sqrt(kappa / mu) \
  E_(1,0) &= 3 / 2 planck.reduce sqrt(kappa / mu) \
  E_(0,1) &= 1 / 2 planck.reduce sqrt(kappa / mu) + planck.reduce^2 / (mu a^2)
$

Now we can find the amount of energy required to bring the $upright(N)_2$ molecule to have energy stored in vibrations or rotation.

$
  Delta E_"vib" &= E_(1,0) - E_(0,0) \
  &= planck.reduce sqrt(kappa / mu) \
  &= 4.69 times 10^(-20) " J"
$

$
  Delta E_"rot" &= E_(0,1) - E_(0,0) \
  &= planck.reduce^2 / (mu a^2) \
  &= 7.9 times 10^(-23) " J"
$

The amount of energy from the temperature can be found using Boltzman's constant.

$
  E_T &= K_B T \
  &= 4.14 times 10^(-21) " J"
$

As we can see, $Delta E_"rot" < E_T < Delta E_"vib"$ which means that the rotational energy storage is active and vibrational is not.

==

We know that the molar heat capacity is $20.8 "J " / ("mol K")$, and we can find the ratio of this heat capacity to the gas constant ($R$) which will give us the coefficient to hopefully be $5 / 2$.

$
  20.7 / 8.134 approx 2.5
$

So yes!

=

$
  kappa = 1860 N / m quad quad a = 0.113 "nm"
$

$
  E_"photon" &= planck.reduce sqrt(kappa / mu) plus.minus I planck.reduce^2 / (mu a^2) = (h c) / lambda
$

Solve for $lambda$:

$
  lambda &= (2 pi c) / (sqrt(kappa / mu) plus.minus I planck.reduce / (mu a^2))
$

Now we can plug in $I = -2, -1, 1, 2$ to get the possible wavelengths.

$
  lambda_(-2) &= 4.68 mu m \
  lambda_(-1) &= 4.67 mu m \
  lambda_1 &= 4.65 mu m \
  lambda_2 &= 4.64 mu m
$

=

$
  H = planck.reduce / 2 mat(omega_0 + omega_1, omega_2; omega_2, -omega_0-omega_1)
$

We want to calculate the following determinant to find the eigenvalues/vectors.

We leave out the $planck.reduce / 2$ until the last step.

#set math.mat(delim: "|")
$
  mat(omega_0 + omega_1 - E, omega_2; omega_2, -omega_0 - omega_1 - E) &= 0 \
  (omega_0 - E) (-omega_0 - omega_1 - E) - omega_2^2 &= \
  -omega_0^2 - omega_2 omega_1 - omega_0 E - omega_1 omega_0 - omega_1^2 - omega_1 E + omega_0 E + omega_1 E - E^2 - omega_2^2 &= \
  -omega_0^2 - 2 omega_0 omega_1 + E^2 - omega_2^2 - omega_1^2 &= \
  E^2 &= omega_0^2 + omega_1^2 + omega_2^2 + 2 omega_0 omega_1 \
  ==> E &= planck.reduce / 2 (plus.minus sqrt((omega_0 + omega_1)^2 + omega_2^2))
$

So our diagonal Hamiltonian is:

#set math.mat(delim: "(")
$
  planck.reduce / 2 mat(sqrt((omega_0 + omega_1)^2 + omega_2^2), 0; 0, -sqrt((omega_0 + omega_1)^2 + omega_2^2))
$
