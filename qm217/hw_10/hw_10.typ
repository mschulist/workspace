#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 10")

#set math.equation(numbering: "(1)")

=

$
  U_0 = 3 / 4 E
$

$
  psi_"inc" = e^(i k x)
$

==

$
  k eq.triple sqrt((2 m E) / planck.reduce^2)
$

We know that $E > U_0$, so we can set up the relevant equations. We will call region $1$ the region to the left of the step $(x < 0)$ and region $2$ to the right $(x > 0)$.

$
  psi_1(x) = e^(i k x) + B e^(- i k x)
$

$
  k' eq.triple sqrt((2m (E - U_0)) / planck.reduce^2)
$

$
  psi_2(x) = C e^(i k' x)
$

We can impose the required continuity conditions at $x = 0$.

// $
//   1 + B = C
// $

// $
//   A - B = k' / k C
// $

$
  B / 1 &= (k - k') / (k + k') \
  B &= (sqrt((2 m E) / planck.reduce^2) - sqrt((2 m (E - U_0)) / planck.reduce^2)) / (sqrt((2 m E) / planck.reduce^2) + sqrt((2 m (E - U_0)) / planck.reduce^2)) \
  &= (sqrt(E) - sqrt(E - U_0)) / (sqrt(E) + sqrt(E - U_0)) \
  &= (sqrt(E) - sqrt(E / 4)) / (sqrt(E) + sqrt(E / 4)) \
  &= 1 / 3
$

We know that $C = 1 + B$:

$
  C &= 1 + B \
  C &= 1 + 1 / 3 \
  C &= 4 / 3
$

Therefore the wave function in the 2 regions is:

$
  psi_1(x) &= e^(i k x) + 1 / 3 e^(-i k x) \
  psi_2(x) &= 4 / 3 e^(i k' x)
$

==

$
  R &= (B dot B) / (A dot A) \
  &= 1 / 9
$

Equation (6-7):

$
  R &= (sqrt(E) - sqrt(E - U_0))^2 / (sqrt(E) + sqrt(E - U_0))^2 \
  &= (sqrt(E) - sqrt(E / 4))^2 / (sqrt(E) + sqrt(E / 4))^2 \
  &= (E + E / 4 - E) / (E + E / 4 + E) \
  &= (E / 4) / (9E / 4) \
  &= 1 / 9
$

=

$
  B = - (K + i k) / (K - i k) A
$

==

We can rewrite this in terms of the $delta(E)$, which is the phase shift of the energy.

$
  B &= - e^(i delta(E)) / e^(-i delta(E)) A \
  &= -e^(2 i delta(E)) A
$

For $x < 0$

$
  psi(x) &= A e^(i k x) - A e^(i delta(E)) e^(-i k x) \
  &= A e^(i delta(E)) (e^(i k x) e^(-i delta(E)) - e^(i k x) e^(i delta(E))) \
  &= 2 i A e^(i delta(E)) sin(k x - delta(E))
$

Now that we know the wave function, we can take the absolute valued squared to find the probability density.

$
  abs(psi(x))^2 &= psi^*(x)psi(x) \
  &= (-2i A e^(-i delta(E))sin(k x - delta(E))) (2 i A e^(i delta(E)) sin(k x - delta(E)) \
  &= 4 abs(A)^2 sin^2(k x - delta(E))
$

==

As $k -> 0$, the energy must also be approaching $0$. Therefore, $C$ (amplitude inside of the step) must also approach $0$ as the probability of finding the particle in the step will be VERY small (ie: if the energy is zero, then the amount of tunneling is zero). We also know that $delta(E)$ must approach $0$ because $arctan(0) = 0$.

$
  C &= lim_(k -> 0) A - (K + i k) / (K - i k) A \
  &= A - A \
  &= 0
$

As $K -> 0$, $delta(E) = arctan(infinity)$ will approach $pi / 2$. Therefore, we get the maximum phase shift when $K -> 0$.

$
  C &= lim_(K -> 0) A - (K + i k) / (K - i k) A \
  &= 2A
$

When $K -> 0, U_0 -> E$ so we are approaching the case when $E > U_0$. So we penetrate deeper into the forbidden region (it is at its highest when $U_0 -> E$).


=

$
  E = U_0 + (pi^2 planck.reduce^2) / (2 m L^2)
$

// $
//   4 (U_0 + (pi^2 planck.reduce^2) / (2 m L^2)) / U_0 [(U_0 + (pi^2 planck.reduce^2) / (2 m L^2)) / U_0 - 1] /
// $


$
  k &eq.triple sqrt((2m E) / planck.reduce^2) \
$

$
  k' &eq.triple sqrt((2m (E - U_0)) / planck.reduce^2) \
  &= sqrt((2m (pi^2 planck.reduce^2) / (2 m L^2)) / (planck.reduce^2)) \
  &= pi / L
$

We have the following continuity requirements:

$
  A + B &= C + D \
  F e^(i k L) &= C e^(i k L) + D e^(-i k' L) \
  k(A - B) &= k'(C - D) \
  F k e^(i k L) &= C k e^(i k L) - D k' e^(-i k' L)
$ <original-cont>

We know that $k' dot L = pi$.

$
  F e^(i k L) &= C e^(i pi) + D e^(-i pi) \
  F e^(i k L) &= -C -D
$ <cont2>

$
  F k e^(i k L) &= k'(C e^(i k' L) - D e^(i k' L)) \
  &= k' (D - C)
$ <cont3>

We can divide @cont2 and @cont3:

$
  k' / k &= (C + D) / (C - D)
$ <first-kprimek>

From @original-cont, we can find the ratio of $k' / k$:

$
  k' / k &= (A - B) / (C - D)\
  ==> "first cont eq." quad &= (C + D) / (C - D)
$ <second-kprimek>

Therefore, we know that $A - B = C + D$, but we know that $C + D = A + B$:

$
  A - B = C + D = A + B
$ <final-eq>

The only way for @final-eq to be true is if $B = 0$, so we have shown that $B$ must equal $0$ in this case.



// $
//   B &= C + D - A \
//   B &= -F e^(i k L) - A
// $

// We can use the third continuity equation.

// $
//   A - B &= k' / k (C - D) \
//   B &= A - k' / k (C - D)
// $

=

$
  U_0 = -3E
$

==

Classically, the particle would increase in kinetic energy (momentum) because the potential energy decreases and $E = T + U$ at all positions and times.

The kinetic energy would increase from $E$ to $4E$ "instantly."

==


Region 1 is the region to the left of the step $(x < 0)$ and region 2 is the region to the right of the step $(x > 0)$.

$
  psi_1(x) = e^(i k x) + B e^(- i k x)
$

$
  psi_2(x) &= C e^(i k' x)
$

$
  k eq.triple sqrt((2 m E) / planck.reduce^2)
$

$
  k' eq.triple sqrt((8 m E) / planck.reduce^2)
$

Continuity:

$
  1 + B &= C
$

$
  k - B k &= C k' \
  k (1 - B) &= C k' \
  k / k' &= C / (1 - B) \
  1 / 2 &= C / (1 - B) \
  2C &= 1 - B \
  C &= (1 - B) / 2
$

$
  1 + B &= 1 / 2 - B / 2 \
  (3 B) / 2 &= - 1 / 2 \
  B &= -1 / 3
$

$
  C = 2 / 3
$

$
  psi_1(x) = e^(i k x) - 1 / 3 e^(- i k x)
$

$
  psi_2(x) = 2 / 3 e^(i k' x)
$

==

We want to find the reflextion coefficient.

$
  R &= (B^* B) / (A^* A) \
  &= 1 / 9 \
  &= 0.overline(1)
$

This is the probability that an incoming particle is reflected.