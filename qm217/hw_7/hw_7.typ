#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 7")

=

$
  psi(x) &= cases(
    2sqrt(a^3)x e^(- a x) "if" x > 0,
    0 "if" x < 0,
  )
$

==

$
  integral_0^infinity |psi(x)|^2 dif x &= integral_0^infinity abs(2sqrt(a^3)x e^(- a x))^2 dif x \
  &= integral_0^infinity 4 a^3 x^2 e^(-2 a x) dif x \
  &= 4 a^3 integral_0^infinity x^2 e^(-2 a x) dif x \
  &= 1 / (4 a^3)
$

==

We can set $dif / (dif x) |psi(x)|^2 = 0$ to find the maximum of the function. We know that as $x -> infinity$, $e^(-2 a x) -> 0$, so we do not need to worry about maximums at the bounds.

$
  dif / (dif x) |psi(x)|^2 &= dif / (dif x) 4 a^3 x^2 e^(-2 a x) \
  &= e^(-2 a x) (2x - 2a x^2)
$

$
  0 &= e^(-2 a x) (2x - 2a x^2) \
  0 &= 2x - 2a x^2 \
  2x &= 2a x^2 \
  x eq.not 0 ==> x &= 1 / a
$

Therefore, the maximum of the function is at $x = 1 / a$.

==

$
  integral_0^(1 / a) |psi(x)|^2 dif x &= integral_0^(1 / a) abs(2sqrt(a^3)x e^(- a x))^2 dif x \
  &= integral_0^(1 / a) 4 a^3 x^2 e^(-2 a x) dif x \
  &= 1 - 5 / e^2
$

=

// We will use the symmetric well as the solution is much nicer. We know that $n = 4$, so we can use the "odd" solution that uses $sin$.

// $
//   psi(x) &= cases(
//       A e^(K x) "if" x < -a,
//       A e^(-K a) / sin(k a) sin(k x) "if" -a <= x <= a,
//       A e^(-K x) "if" x > a,
//     )
// $

// To determine the normalization constant, we can numerically integrate the function and set it equal to 1. We will set $a = 1$.

// Running the following code will give us the normalization constant.

// ```python
// import numpy as np
// import scipy.integrate as integrate

// def psi(x):
//     a = 1
//     k = 1
//     K = k * np.tan(k * a)

//     if x < -a:
//         return np.exp(K * x)
//     elif -a <= x <= a:
//         return np.exp(-K * a) / np.cos(k * a) * np.cos(k * x)
//     else:
//         return np.exp(-K * x)

// A = 1 / integrate.quad(psi, -100, 100)
// ```

// After running the code, we find that $A approx 0.926788$.

We can plot the wave function. We know that it needs to have 3 nodes and be an odd function because $n = 4$.

To make this plot, I chose values for $k$ and $K$ until the plot looked _nice_, which is definitely not the _numerical_ way of doing things (but this is just a sketch).

```py
def psi(x):
    a = 1
    k = 2 * np.pi - 0.1
    K = 2.3

    if x < -a:
        return np.exp(K * x)
    elif -a <= x <= a:
        return np.sin(k * x)
    else:
        return -np.exp(-K * x)
```

#let psi_fl = csv_fl("hw_7/prob_2_psi.csv", 1000)

#plot_simple(
  psi_fl,
  xlim: (-2, 2),
  xlab: [$x$],
  xstep: 0.5,
  ylim: (-1.5, 1.5),
  ylab: [$psi(x)$],
  ystep: 3,
  title: [Sketch of $psi(x)$ when $n = 4$],
)

#let psi_sq_fl = csv_fl("hw_7/prob_2_psi_sq.csv", 1000)

#plot_simple(
  psi_sq_fl,
  xlim: (-2, 2),
  xlab: [$x$],
  xstep: 0.5,
  ylim: (0, 1),
  ylab: [$abs(psi(x))^2$],
  ystep: 1,
  title: [Sketch of $abs(psi(x))^2$ when $n = 4$],
)


To get $abs(psi(x))^2$, we just need to square each value in $psi(x)$ because it is a real function. We can see the small amount of "leakage" into the classically forbidden region.


=

$
  U (x) = cases(
    0 &"if" |x| > a,
    -U_0 &"if" |x| < a,
  )
$

==

$
  E_1 = -1 / 2 U_0
$

// *Plug this into the definitions of $k$ and $K$.*

We know that the first excited state will use an odd function as there will be one node in $psi(x)$.

Let's define the following quantities:

$
  k = sqrt((2m) / planck.reduce^2 (U_0 - abs(E))) \
  K = sqrt((2m|E|) / planck.reduce^2) \
$

We can plug in $E_1 = -1 / 2 U_0$ into these equations.

$
  k &= sqrt((2m) / planck.reduce^2 (1 / 2U_0)) \
  &= sqrt((m U_0) / planck.reduce^2) \
  K &= sqrt((2m(1 / 2 U_0)) / planck.reduce^2) \
  &= sqrt((m U_0) / planck.reduce^2)
$

We know that $K = -k cot(k a)$, which then shows that:

$
  sqrt((m U_0) / planck.reduce^2) &= -sqrt((m U_0) / planck.reduce^2) cot(sqrt((m U_0) / planck.reduce^2) a) \
  -1 &= cot(sqrt((m U_0) / planck.reduce^2) a) \
  "arccot"(-1) &= sqrt((m U_0) / planck.reduce^2) a \
  "arccot"^2(-1) planck.reduce^2 / (m a^2) &= U_0
$

In order for cotan to be $-1$, $k a = (3pi) / 4$. We are in first excited state, so we know that $k a = (3pi) / 4$ and not some integer multiple of this value.

$
  k = K = (3pi) / (4a)
$

==

// *Solve annoying integrals*

$
  1 &= integral_(-infinity)^infinity abs(psi(x))^2 dif x \
  &= A^2 [
    underbrace(integral_(-infinity)^(-a) e^(2 K x) dif x, "region I") + underbrace(integral_(-a)^a e^(-2 K a) / (sin^2(k a)) sin^2(k x) dif x, "region II") + underbrace(integral_a^infinity e^(-2 K x) dif x, "region III")
  ] \
$

For region I, we have the following:

$
  integral_(-infinity)^(-a) e^(2 K x) dif x &= lr(1 / (2K) e^(2 K x)|)_(x = -infinity)^(-a) \
  &= e^(-2 K a) / (2K)
$

For region 3, we have something very similar:

$
  integral_(a)^(infinity) e^(- 2 K x) dif x &= lr(- 1 / (2K) e^(- 2 K x)|)_(x = a)^(infinity) \
  &= e^(-2 K a) / (2K)
$

Region 2 is the following. We will ignore the coefficients for now...

$
  integral_(-a)^a sin^2(k x) dif x &= 1 / 2 integral_(-a)^a [1 - cos(2 k x)] dif x \
  &= lr(1 / 2 [x - sin(2 k x) / (2 k)]|)_(x = -a)^a \
  &= 1 / 2 [2 a - (sin(2 k a)) / k] \
  &= a - sin(2 k a) / (2 k)
$

Adding back in the coefficients for region II:

$
  e^(-2 K a) / (sin^2(k a))(a - sin(2 k a) / (2 k))
$

Now, we need to solve for $A$:

$
  1 &= A^2[e^(-2 K a) / (2K) + e^(-2 K a) / (2K) + e^(-2 K a) / (sin^2(k a))(a - sin(2 k a) / (2 k))] \
  &= A^2[e^(-2 K a)(1 / K + 1 / (sin^2(k a))(a - sin(2 k a) / (2 k)))] \
  ==> A &= [e^(-2 K a)(1 / K + 1 / (sin^2(k a))(a - sin(2 k a) / (2 k)))]^(-1 / 2) \
  &= e^(K a) [(1 / K + 1 / (sin^2(k a))(a - sin(2 k a) / (2 k)))]^(-1 / 2)
$

We can simplify this as we know $k = K = (3pi) / (4 a)$.

$
  A &= e^((3pi) / (4)) [(4a) / (3pi) + 1 / (sin^2(3pi / 4)) (a - (sin(3pi / 2)) / ((3pi) / (2a)))]^(-1 / 2) \
  &= e^((3pi) / (4)) [(4a) / (3pi) + 2(a + (2a) / (3pi))]^(-1 / 2) \
  &= (e^(3pi / 4)) / (sqrt((2a)/(3pi)(4 + 3pi)))
$

$
  psi(x) &= cases(
    e^((3pi)/4)((8a) / (3pi) + 2a)^(-1/2) e^((3pi)/(4a) x) &"if" x < -a,
    (-1) / (sqrt((4a) / (3pi) + a))sin((3pi)/(4a) x) &"if" -a <= x <= a,
    -e^((3pi)/4)((8a) / (3pi) + 2a)^(-1/2) e^(-(3pi)/(4a) x) &"if" x > a
  )
$

#let psi_2 = csv_fl("hw_7/prob_3_psi2.csv", 1000)

#plot_simple(
  psi_2,
  title: [Plot of $psi(x)$ as shown above],
  xlab: [$x$],
  xlim: (-2.5, 2.5),
  xstep: 0.5,
  ylab: [$psi(x)$],
  ylim: (-1, 1),
  ystep: 0.25,
)

==

// *Solve another annoying integral*

We can first solve for the probability of being on one side of the forbidden zones, and then double that to get the probability of being in either forbidden zone.

$
  A^2 integral_a^infinity e^(- 2 K x) dif x &= A^2 / (-2 K) lr([e^(-2 K x)]|)_(x = a)^infinity \
  &= A^2 / (2 K) e^(-2 K a) \
  "plug in for K" ==> quad &= (2A^2 a) / (3pi) e^(- 3 / 2 pi) \
  "plug in for A" ==> quad &= (e^(3 / 2 pi - 3 / 2 pi) dot cancel(2a)) / ((cancel(2a)(
    4 + 3pi
  )) / cancel((3pi)) dot cancel(3pi)) \
  &= (1) / (4 + 3pi) \
  &approx 0.07449
$

This is only half of the probability, so we can double it to find the probability that the particle is in the forbidden region.

$
  P("particle in forbidden region") &= (2) / (4 + 3pi) \
  &approx 0.149
$

This is suprisingly large, considering that classically it would impossible for the particle to be observed in this region.


=

$
  psi(x) = A x e^(-x^2 / L^2)
$

We can plug this function into the Schroedinger equation to find $U(x)$.

$
  dif / (dif x) psi(x) &= A e^(-x^2 / L^2) ((-2x^2) / L^2) + A e^(-x^2 / L^2) \
  &= psi(x) / x (1 - (2x^2) / L^2)
$

$
  dif^2 / (dif x^2) psi(x) &= dif^2 / (dif x^2) psi(x) / x (1 - (2x^2) / L^2) \
  &= psi(x) / x (1 - (4x) / L^2) + (1 - (2x^2) / L^2) ((-2 psi(x)) / L^2) \
  &= A e^(-x^2 / L^2) (- 6 / L^2 + (4x^2) / L^4)
$

We can (finally) plug this into the SE.

$
  - (2m) / planck.reduce^2 U(x)psi(x) &= psi(x) (- 6 / L^2 + (4x^2) / L^4) \
  U(x) &= planck.reduce^2 / (2m L^2) (4x^2 - 6)
$

This is a parabola that opens upwards.


$
  U(0) &= (-6 planck.reduce^2) / (2m L^2)
$

At $x = 0$, the potential energy is $(-3 planck.reduce^2) / (m L^2)$.

// $
//   dif^2 / (dif x^2) psi(x) &= -(2m) / planck.reduce^2 (E - U(x)) psi(x) \
//   (4 A x^3) / (L^4) e^(-x^2 / L^2) - (4 A x) / (L^2) e^(-x^2 / L^2) &= -(2m) / planck.reduce^2 (
//     E - U(x)
//   ) A x e^(-x^2 / L^2) \
//   ((A e^(- x^2 / L^2) (4x^3 - 6L^2 x)) / L^4) &= -(2m) / planck.reduce^2 (E - U(x)) A x e^(-x^2 / L^2) \
// $

// $
//   (- planck.reduce^2) / (2m) dif^2 / (dif x^2) psi(x) + U(x) psi(x) &= E psi(x) \
//   (- planck.reduce^2) / (2m) (4 A x^3) / (L^4) e^(-x^2 / L^2) - (4 A x) / (L^2) e^(-x^2 / L^2) + U(
//     x
//   )A x e^(-x^2 / L^2) &= E A x e^(-x^2 / L^2) \
//   (- planck.reduce^2) / (2m) ((A e^(- x^2 / L^2) (4x^3 - 6L^2 x)) / L^4) + U(
//     x
//   )A x e^(-x^2 / L^2) &= E A x e^(-x^2 / L^2) \
//   U(x) &= (E cancel(A x e^(-x^2 / L^2)) - (- planck.reduce^2) / (2m) cancel(A x e^(-x^2 / L^2)) (
//     ((4x^3 - 6L^2 x)) / L^4
//   )) / (cancel(A x e^(-x^2 / L^2))) \
//   U(x) &= E - (- planck.reduce^2) / (2m) ((4x^3) / L^4 - (6L^2 x) / L^4) \
// $
