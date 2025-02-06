#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 3")

=

$
  V(x) &= cases(
    infinity &"if" |x| > a,
    V_0 cos((x pi) / (2a)) &"if" |x| <= a
  )
$

$
  H = H^0 + lambda H'
$

$
  E'_n = braket(n, H', n) = braket(n, V-0 cos ((x pi) / (2 a)), n)
$

$
  E'_1 = braket(1, V_0 cos((x pi) / (2 a)), 1)
$

We know that the wave function for the symmetric infinite well is

$
  psi_1(x) &= sqrt(1 / a) cos((pi x) / (2a))
$

We can take the existing probability density and multiply the pertubation to get the expectation value for the energy.

$
  abs(psi_1(x))^2 = 1 / a cos^2((pi x) / (2 a))
$

Now we multiply the pertubation energy and integrate.

$
  expval(E^'_1) &= V_0 / a integral_(-a)^a cos^3((pi x) / (2 a)) \
  &= (8 V_0) / (3 pi)
$


Now we can add this pertubation energy to the original energy:
$
  E = (pi^2 planck.reduce^2) / (8 m a^2) + (8 V_0) / (3pi)
$

= 10.3

$
  ket(2^((1))) = vec(c^((1))_(21), c^((1))_22, c^((1))_23)
$

We know that the following is true:
$
  (H_0 - E_2^((0))) ket(2^((1))) = (E'_2 - H') ket(2^((0)))
$

Looking at the LHS:

$
  mat(E_1^((0)) - E_2^((0)), 0, 0; 0, 0, 0; 0, 0, E_3^((0))_3 - E_2^((0))) vec(c^((1))_(21), c^((1))_22, c^((1))_23) = vec(..., 0, ...)
$

Now looking at the RHS:

$
  mat(E_2^((1)) - H'_11, H'_12, -H'_13; -H'_21, E_2^((1)) - H'_22, -H'_23; -H'_31, -H'_32, E_2^((1)) - H'_33) vec(0,1,0) = vec(-H'_12, E'_2 - H'_22, -H'_32)
$

Setting them equal:

$
  vec(..., 0, ...) = vec(-H'_12, E'_2 - H'_22, -H'_32)
$

So:

$
  0 &= E'_2 - H'_22 \
  H'_22 &= E'_2
$

= 10.11

$
  V(x) = 1 / 2 m omega^2 x^2
$

$
  H' = eta x^4
$

$
  E'_n = braket(n, eta x^4, n) = eta braket(n, x^4, n)
$ <energy>

We can use ladder operators to solve for the eigenvalues of the position operator.

$
  hat(x) &= sqrt(planck.reduce / (2 m omega)) \
  hat(x)^4 &= planck.reduce^2 / (4 m^2 omega^2) (a_+ + a_-)^4
$

We know that the ladder operators work like this:
$
  a_+ ket(n) &= sqrt(n+1) ket(n+1) \
  a_- ket(n) &= sqrt(n) ket(n-1)
$

Instead of looking at all 16 terms, we can see that most of them will go to zero because @energy says that we are taking the inner product of $n$ with $n$ states. We need to get back to the energy level that we started at in order to not have the orthonormality make the term got to zero. That means we need terms that have 2 up and 2 down operators (and are just permuted).

The following equation does not include all operators, just the ones that will not go to zero:

Under each term I will put the result of the operator acting on $ket(n)$ and then $bra(n)$ acting on the result of that matrix multiplication.
$
  underbrace(a_+ a_+ a_- a_-, n(n-1)) + underbrace(a_+ a_- a_+ a_-, n^2) + underbrace(a_- a_+ a_+ a_-, n(n+1)) + underbrace(a_+ a_- a_- a_+, n(n+1)) + underbrace(a_- a_- a_+ a_+, (n+1)(n+2)) + underbrace(a_- a_+ a_- a_+, (n+1)^2)
$

Therefore:

$
  braket(n, eta x^4, n) = (eta planck.reduce^2) / (4 m^2 omega^2)(n^2 + 2n(n+1) + (n+1)(n+2) + (n+1)^2)
$


