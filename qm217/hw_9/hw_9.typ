#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 8")

=

$
  psi(x) = A(e^(i k x) + e^(-i k x))
$

Well-defined $p$ means that $Delta p approx 0$. We need to solve for $Delta p$.

$
  hat(p) = - i planck.reduce dif / (dif x)
$

$
  expval(p) &= - i planck.reduce A^2 integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) dif / (dif x) (e^(i k x) + e^(-i k x))
  dif x \
  &= - i planck.reduce A^2 integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) (i k e^(i k x) - i k e^(-i k x)) dif x \
  &= planck.reduce A^2 k integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) (e^(i k x) - e^(-i k x)) dif x \
  &= planck.reduce A^2 k integral_(-infinity)^infinity [e^(2 i k x) - e^(-2 i k x)] dif x \
  &= planck.reduce A^2 k integral_(-infinity)^infinity [e^(2 i k x) - e^(-2 i k x)] dif x \
$

=

$
  Psi(x, t) = a_n psi_(n)(x) e^(- i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(- i (E_m / planck.reduce) t)
$

Here we have $a_n$ and $a_m$ which correspond the coefficients of the superposition of wave functions.

We want to show that the frequency of oscillation still only depends on the time. We can start by multiplying by the complex conjugate.

$
  [a_n psi_(n)(x) e^(-i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(- i (E_m / planck.reduce) t)][
    a_n psi_(n)(x) e^(i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(i (E_m / planck.reduce) t)
  ] \
  ==> a_n^2 psi_(n)^2 + a_m^2 psi_(m)^2 + a_n a_m psi_n^2 psi_n^2 e^(-i t / planck.reduce (
    E_m - E_n
  )) + a_n a_m psi_n^2 psi_n^2 e^(-i t / planck.reduce (E_n - E_m)) \
  ==> a_n^2 psi_(n)^2 + a_m^2 psi_(m)^2 + a_n a_m psi_n^2 psi_n^2 (
    e^(-i t / planck.reduce (E_m - E_n)) + e^(-i t / planck.reduce (E_n - E_m))
  ) \
  ==> a_n^2 psi_(n)^2 + a_n a_m psi_n^2 psi_n^2 [
    cos(t / planck.reduce (E_m - E_n)) - i sin(t / planck.reduce (E_m - E_n)) + cos(t / planck.reduce (E_n - E_m)) - i sin(t / planck.reduce (E_n - E_m))
  ] \
  ==> a_n^2 psi_(n)^2 + 2 a_n a_m psi_n^2 psi_n^2 [cos(t / planck.reduce (E_n - E_m))]
$

We can see that the frequency is determined by $Delta E$, just like in the case where we added the wave functions in equal amounts.

=

$
  psi(x, 0) = C[psi_1(x) + psi_2(x)]
$

==

$
  1 &= C^2 integral_(-infinity)^infinity [psi_1^*(x) psi_1(x) + psi_2^*(x) psi_2(x)] dif x \
  1 &= C^2 [
    integral_(-infinity)^infinity psi_1^*(x) psi_1(x) dif x + integral_(-infinity)^infinity psi_2^*(x) psi_2(x) dif x
  ] \
  "orthonormal" ==> quad 1 &= 2 C^2 \
  C &= 1 / sqrt(2)
$

==

==

We know that the time component $phi.alt(t) = e^(-(i E n) / planck.reduce t)$. We can plug this into our wave function to get the time component.

$
  Psi(x, t) &= 1 / sqrt(2) [psi_1(x) e^(-(i E_1) / planck.reduce t) + psi_2(x) e^(-(i E_2) / planck.reduce t)]
$

==

We can use the energy operator on $Psi(x, t)$ to find the average energy $expval(E)$.

$
  hat(E) = diff / (diff t) planck.reduce i
$

$
  expval(E) &= i planck.reduce 1 / 2 integral_(-infinity)^infinity (
    psi^*_1(x) e^((i E_1) / planck.reduce t) + psi^*_2(x) e^((i E_2) / planck.reduce t)
  ) (
    - (i E_1) / planck.reduce psi_1(x) e^(- (i E_1) / planck.reduce t) - (i E_2) / planck.reduce psi_2(
      x
    ) e^(- (i E_2) / planck.reduce t)
  ) dif x \
  &= 1 / 2 (E_1 + E_2)
$

We can simplify like this because of orthonormality, where all of the other terms will either integrate to 0 or 1.

==

$
  expval(x) &= integral_(-infinity)^infinity x abs(Psi(x, t))^2 dif x \
  &= 1 / 2 integral_(-infinity)^infinity x (
    psi_1^*(x) e^(i E_1 / planck.reduce t) + psi_2^*(x) e^(i E_2 / planck.reduce t)
  ) (psi_1(x) e^(- i E_1 / planck.reduce t) + psi_2(x) e^(- i E_2 / planck.reduce t)) dif x \
  &= 1 / 2 integral_(-infinity)^infinity x(
    psi_1^* psi_1 + psi_2^* psi_2 + psi_1^* psi_2 e^(-i t / planck.reduce (
      E_2 - E_1
    )) + psi_2^* psi_1 e^(-i t / planck.reduce (E_1 - E_2))
  ) dif x \
  &= 1 / 2 integral_(-infinity)^infinity x (
    psi_1^* psi_1 + psi_2 psi_2^*
  ) + cos(2 t / planck.reduce (E_1 - E_2)) integral_(-infinity)^infinity x(psi_1^* psi_2 + psi_2^* psi_1) dif x
$

=

$
  U_0 = 5 / 4 E
$

$
  psi_"inc" = e^(i k x)
$

We know that $E < U_0$, so we can use the equations that correspond to that relationship. We will call region $1$ the region to the left of the step and region $2$ "inside" the step.

$
  k &eq.triple sqrt((2 m e) / planck.reduce^2) \
  alpha &eq.triple sqrt((2m (U_0 - E)) / planck.reduce^2)
$

$
  psi_1(x) &= underbrace(e^(i k x), psi_"inc") + e^(- i k x)
$

We know that the coefficients must be the same as $A^2 / B^2 = 1$, where $A, B$ are the coefficients in front of the two exponential terms in $psi_1(x)$.

$
  psi_2(x) &= C e^(i alpha x)
$
