#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 8")

=

$
  k &= 480 " " upright(N) / upright(m) \
  m &= 1.00784 " " upright("m") \
  &= 1.67 times 10^(-27) "kg"
$

We can find the angular frequency given the values of $m$ and $k$ above.

$
  omega &= sqrt(k / m)
$

$
  Delta E &= (3 / 2) planck.reduce omega - (0 + 1 / 2) planck.reduce omega \
  &= planck.reduce omega
$

$
  E_"photon" &= h c / lambda
$

We can set the energies equal to each other and solve for $lambda$.

$
  planck.reduce omega &= h c / lambda \
  lambda &= (h c) / (planck.reduce omega) \
  lambda &= (2 pi c) / omega
$

Substituting in values:

$
  lambda &= (2 pi c) / (sqrt(k / m)) \
  &= 3516 "nm"
$

=

The momentum operator in coordinate space is:

$
  hat(p) &= - i planck.reduce diff / (diff x)
$

We know that in the box, the wave function is:

$
  psi_(n)(x) &= sqrt(2 / L) sin((n pi x) / L)
$

We can find the uncertainty by finding $expval(p)$ and $expval(p^2)$.

$
  expval(p) &= - (2 i planck.reduce) / (L) integral_0^L sin((n pi x) / L) [dif / (dif x) sin((n pi x) / L)] dif x \
  &= -(2 i planck.reduce) / L dot (n pi x) / L integral_0^L sin((n pi x) / L) cos((n pi x) / L) dif x \
  &= 0
$

$
  expval(p^2) &= 2 / L integral_0^L sin((n pi x) / L) hat(p) hat(p) sin((n pi x) / L) dif x \
  &= 2 / L dot (pi n) / L dot (- i planck.reduce) integral_0^L sin((n pi x) / L) hat(p) cos((n pi x) / L) dif x \
  &= 2 / L dot (pi n) / L dot (- i planck.reduce) dot (pi n) / L dot (-i planck.reduce) integral_0^L sin((n pi x) / L) (
    -sin((n pi x) / L)
  ) dif x \
  &= (- 2 planck.reduce^2 pi^2 n^2) / (L^3) dot (L (-2 n pi + sin(2 n pi))) / (4 n pi) \
  ==> n in NN quad &= (- 2 planck.reduce^2 pi^2 n^2) / (L^3) dot (- 2 pi n L) / (4 pi n) \
  &= (planck.reduce^2 pi^2 n^2) / (L^2)
$

$
  Delta p &= sqrt(expval(p^2) - expval(p)^2) \
  &= sqrt(expval(p^2)) \
  &= sqrt((planck.reduce^2 pi^2 n^2) / (L^2)) \
  &= (planck.reduce pi n) / L
$

// $
//   <p> &= - (2 i planck.reduce) / (n pi) integral_(0)^L x sin((n pi x) / L) cos((n pi x) / L) dif x \
//   &= - (2 i planck.reduce) / (n pi) (L^2 (-2 n π cos(2 n pi) + sin(2 n pi))) / (8 n^2 pi^2) \
//   ==> n in NN quad &= - (2 i planck.reduce) / (n pi) (-2 pi n L^2) / (8 n^2 pi^2) \
//   &= (i L^2 planck.reduce^2) / (2 n^2 pi^2)
// $

=

We know that the wave function for the harmonic oscillator in the ground state takes the form:

$
  psi(x) &= C_0 e^(-alpha x^2) \
  alpha &eq.triple (m omega) / (2 planck.reduce)
$

We can solve for the expectation value of the position. We know that the position operator is just the position: $hat(x) = x$.

$
  C_0 integral_(-infinity)^infinity x e^(- 2 alpha x^2) dif x &= lr(C_0 / (4 alpha) e^(-2 alpha x^2)|)_(x = -infinity)^infinity \
  &= 0
$

So $expval(x) = 0$, which makes sense because in the ground state it is symmetric about $x = 0$.

=

$
  hat(L) &= -i planck.reduce diff / (diff phi.alt)
$

Well-defined means that the function must obey the following equation:

$
  hat(L) f(phi.alt) &= lambda f(phi.alt)
$

We can plug in $hat(L)$ and solve for a possible function:

$
  -i planck.reduce diff / (diff phi.alt) f(phi.alt) &= lambda f(phi.alt) \
  diff / (diff phi.alt) f(phi.alt) &= (i lambda) / (planck.reduce) f(phi.alt)
$

We can see that $f(phi.alt)$ must take the form of an exponential. We can define the following quantity:

$
  a eq.triple (i lambda) / (planck.reduce)
$

$
  diff / (diff phi.alt) f(phi.alt) &= a f(phi.alt)
$

We can see the following:

$
  f(phi.alt) &= e^(a phi.alt) \
  f(phi.alt) &= e^((i lambda) / planck.reduce phi.alt)
$

=

$
  psi(x) &= cases(
    2sqrt(a^3)x e^(- a x) &"if" x > 0,
    0 &"if" x < 0
  )
$

==

$
  E = 0
$

$
  -planck.reduce^2 / (2 m) dif^2 / (dif x^2) psi(x) + U(x)psi(x)&= E psi(x) \
  U(x) 2sqrt(a^3)x e^(- a x) &= planck.reduce^2 / (2 m) 2 a sqrt(a^3) e^(- a x) (a x - 2) \
  U(x) &= planck.reduce / (2 m) a / x (a x - 2) \
  &= (planck.reduce^2 a^2) / (2 m) - (planck.reduce^2 a) / (m x)
$

==

$
  U(x) = infinity quad x < 0
$

This must be true because it is impossible for the particle to be there as the wave function is zero for $x < 0$.

==

We want to find when $U(x) = 0$ which is when we get to the forbidden region.

$
  0 &= (planck.reduce^2 a^2) / (2m) - (planck.reduce^2 a) / (m x) \
  x &= 2 / a
$

We can now integrate $abs(psi(x))^2$ from $2 / a$ to $infinity$.

$
  4 a^3integral_(2 / a)^infinity x^2 e^(- 2 a x) dif x &= (4a^3) / (4a^3) [
    lr(-e^(-2 a x) (1 + 2 a x + 2 a^2 x^2)|)_(x = 2 / a)^infinity
  ] \
  &= e^(-4)(1 + 4 + 8) \
  &= 13e^(-4) \
  &approx 0.238
$

==

$
  expval(x) &= 4a^3 integral_0^infinity x x^2 e^(- 2 a x) dif x \
  &= 3 / (2 a)
$

$
  expval(x^2) &= 4a^3 integral_0^infinity x^2 x^2 e^(- 2 a x) dif x \
  &= 3 / a^2
$

$
  Delta x &= sqrt(3 / a^2 - 9 / (4a^2)) \
  &= sqrt(3 / (4a^2)) \
  &= sqrt(3) / (2 a)
$

==

$
  hat(p) = - i planck.reduce dif / (dif x)
$

$
  expval(p) &= -i planck.reduce integral_0^infinity 2sqrt(a^3)x e^(- a x) dif / (dif x) [2sqrt(a^3)x e^(- a x)] dif x \
  &= integral_0^infinity 2sqrt(a^3)x e^(- a x)(2 sqrt(a^3) e^(-a x) - 2sqrt(a^5) x e^(-a x)) dif x \
  &= 0
$

$
  expval(p^2) &= -planck.reduce^2 integral_0^infinity [
    (2sqrt(a^3)x e^(-a x)) (-4sqrt(a^5) e^(-a x) + 2 sqrt(a^7) x e^(-a x))
  ] dif x \
  &= planck.reduce^2 a^2
$

$
  Delta p &= sqrt(planck.reduce^2 a^2) \
  &= planck.reduce a
$

==

$
  Delta p Delta x &>= planck.reduce / 2 \
  planck.reduce cancel(a) dot sqrt(3) / (2 cancel(a)) = planck.reduce sqrt(3) / 2 &>= planck.reduce / 2
$

So yes it is satisfied!