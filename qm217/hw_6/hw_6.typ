#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 6")

=

$
  n = 3 quad L = 10 "nm"
$


We know that when $x < 0$ and $x > L$, $Psi(x, t) = 0$ due to the infinite potential well.

We will focus on the middle region where $0 < x < L$.

We know that the energy of the particle is given by:

$
  E_n &= (n^2 pi^2 planck.reduce^2) / (2 m_e L^2) \
  E_3 &= (3^2 pi^2 planck.reduce^2) / (2 m_e L^2) \
  &= 5.422 times 10^(-29) "Joules"
$

The total wave function is given by:

$
  Psi(x, t) = psi(x) phi.alt(t)
$

From class, we know that $psi(x) = sqrt(2/L)sin((n pi x) / L)$ as well as $phi.alt(t) = e^(- (i E t) / planck.reduce)$. We can combine these to get our total wave function:

$
  Psi(x, t) = sqrt(2/L)sin((n pi x) / L) e^(- (i E t) / planck.reduce)
$

We can plug in the energy and other constants:

$
  Psi(x, t) = sqrt(2 / 10^(-8)) sin((3 pi x) / 10^(-8)) e^(-i (5.14 times 10^(13)) t)
$

=

$
  n = 4 quad L = 5 "nm"
$

We can find the energy of the electron in both the ground state $(n = 1)$, and its current excited state $(n = 4)$.

$
  E_1 &= (1^2 pi^2 planck.reduce^2) / (2 m_e L^2) \
  // &= 2.41 times 10^(-23) "Joules" \
  E_4 &= (4^2 pi^2 planck.reduce^2) / (2 m_e L^2) \
  // &= 3.86 times 10^(-20) "Joules"
$

$
  E_("photon") &= E_4 - E_1 \
  &= (pi^2 planck.reduce^2) / (2 m_e L^2) (16 - 1)
  // &= 3.86 times 10^(-20) "Joules"
$

We can find the photon wavelength using the energy of the photon:

$
  E_("photon") &= (h c) / lambda \
  lambda &= (h c) / E_("photon") \
  &= (h c) / (15 pi^2 planck.reduce^2) 2m_e L^2 \
  &= 5.5 times 10^(-6) " m"
$

=

$
  P(L / 4 < X < (3L) / 4) &= integral_(L / 4)^(3L / 4) |psi(x)|^2 dif x \
  &= integral_(L / 4)^((3L) / 4) (2 / L) sin^2((pi x) / L) dif x \
  &= (2 / L) integral_(L / 4)^((3L) / 4) sin^2((pi x) / L) dif x \
  &= (1 / L) integral_(L / 4)^((3L) / 4) (1 - cos((2 pi x) / L)) dif x \
  &= 1 / L lr([x - sin((2 pi x) / L) / (2 pi)]|)_(x = L / 4)^((3L) / 4) \
  &= 1 / L [(3L) / 4 - L / 4 - (L sin(3 / 2 pi) + L sin(pi / 2)) / (2pi)] \
  &= 1 / L [L / 2 + L / pi] \
  &= 1 / 2 + 1 / pi
$

=

$
  U(x) = cases(
    0 "if" |x| < a / 2,
    infinity "if" |x| > a / 2
  )
$

=

=

$
  psi_(n)(x) = sqrt(2 / L) sin((n pi x) / L)
$

We need to show that $integral psi_(n)(x) psi^*_(m)(x) = 0$ if $n eq.not m$.

First we can find the complex conjugate of $psi_(n)(x)$:

$
  psi^*_(n)(x) = sqrt(2 / L) sin((n pi x) / L)
$

This is the same as $psi_(n)(x)$ because there is no imaginary component.

$
  integral_(0)^L psi_(n)(x) psi^*_(m)(x) dif x &= integral_(0)^L (2 / L) sin((n pi x) / L) sin((m pi x) / L) dif x \
  &= 1 / L integral_(0)^L [cos((n - m) (pi x) / L) - cos((n + m) (pi x) / L)] dif x \
  &= 1 / L lr([
    L / ((n - m) pi) sin((n - m) (pi x) / L) - L / ((n + m) pi) sin((n + m) (pi x) / L)
  ]|)_(x = 0)^L \
  &= 1 / ((n - m) pi) sin((n - m) pi) - 1 / ((n + m) pi) sin((n + m) pi) \
$

This function is $0$ when $n eq.not m$. This is because $sin((n - m) pi) = 0$ and $sin((n + m) pi) = 0$ when $n eq.not m$.