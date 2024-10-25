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
  Psi(x, t) &= sqrt(2 / 10^(-8)) sin((3 pi x) / 10^(-8)) e^(-i (5.14 times 10^(13)) t) \
  &= 4472 sin(6.28 times 10^7 x) e^(-i (5.14 times 10^(13)) t)
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

We know that the following SE must be satisfied:

$
  (dif^2) / (dif x^2) psi(x) &= -k^2psi(x)
$

where $k = sqrt((2 m E) / planck.reduce^2)$

The general solution to this differential equation is:

$
  psi(x) &= A sin(k x) + B cos(k x)
$

We can write the two boundary conditions for $x = plus.minus L / 2$:

$
  0 = psi(x = - L / 2) &= A sin(-k L / 2) + B cos(-k L / 2) \
  0 = psi(x = L / 2) &= A sin(k L / 2) + B cos(k L / 2)
$

Cosine is an even function, which means that $cos(x) = cos(-x)$.

We know that when $n = 1$, there should be zero nodes in $psi(x)$. Additionally, this function should be symmetric around $x = 0$ due to that fact that is has 0 nodes. In fact, when $n$ takes an odd value, there will be an even number of nodes, which implies that $psi(x)$ must be symmetric. Therefore, when $n$ is odd, $psi(x)$ must be entirely composed of $cos$.

When $n = 2$, there should be one node. Because there is one node, $psi(x)$ cannot be symmetric. Following the same reasoning as above (although reversed), when $n$ is even, $psi(x)$ must be entirely composed of $sin$.

We can first solve for when $n$ is odd. Let's first find what $k$ is.

$
  psi_(n = "odd")(L / 2) &= A cos(k L / 2) = 0 \
  ==> k &= (n pi) / L
$

This is because the argument to $cos$ becomes $(n pi) / 2$, and $cos((n pi) / 2) = 0$ $forall n in [1]$, where $[1]$ denotes the set of all even numbers.

We can now find $A$ by normalizing.

$
  1 &= integral_(-L / 2)^(L / 2) abs(A cos((n pi x) / L))^2 dif x \
  &= integral_(-L / 2)^(L / 2) A^2 cos^2((n pi x) / L) dif x \
  &= A^2 / 2 integral_(-L / 2)^(L / 2) [1 + cos((2 n pi x) / L)] dif x \
  &= A^2 / 2 lr([
    x + (L sin((2 n pi x) / L)) / (2 n pi x)
  ]|)_(x = -L / 2)^(L / 2) \
  &= A^2 / 2 [L + 0] \
  ==> A &= sqrt(2 / L)
$

Finally, we can use the values of $A$ and $k$ in our equation for $psi_(n = "odd")(x)$:

$
  psi_(n = "odd")(x) = sqrt(2 / L) cos((n pi x) / L)
$

For when $n$ is even, the function will look identical except the $cos$ will be replaced with $sin$. In the integral when we found $A$, the $cos$ term cancelled out. When $n$ is even, $cos(n pi x) - cos(- n pi x)$ will be 0, similar to how the sines cancelled out in the odd example.

Therefore, the equation for the $psi(x)$ when $n$ is even is:

$
  psi_(x = "even")(x) = sqrt(2 / L) sin((n pi x) / L)
$

=

$
  n = 5
$

To find where the particle is most likely to be, we can solve for when $|psi(x)|^2$ is largest.

$
  abs(psi(x))^2 &= abs(sqrt(2/L)sin((5 pi x) / L))^2 \
  &= 2 / L sin^2((5 pi x) / L)
$

We can plot this function to better understand what the probability density looks like for $0 < x < L$.

#let psi_sq = csv("prob_5.csv")
#let psi_sq_fl = ()
#for i in range(1000) {
  let element = psi_sq.at(i)
  psi_sq_fl.push((float(element.at(0)), float(element.at(1))))
}


#graph_plot(
  plot(
    data: psi_sq_fl,
    axes: (
      axis(
        min: 0,
        max: 5,
        step: 0.5,
        location: "bottom",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [$x$],
      ),
      axis(
        min: 0,
        max: 0.5,
        step: 0.125,
        location: "left",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [$abs(psi(x))^2$],
      ),
    ),
  ),
  (100%, 50%),
  markings: "",
  caption: [$abs(psi(x))^2$ for $L = 5$],
  stroke: red,
)

We can see that the probability is at a maximum when $x = n + 1/2$ for $n in ZZ$ in the case that $L = 5$.

More generally, we want $(5 pi x) / L = pi n + pi / 2$ for $n in ZZ$. This simplifies to $x = (pi n L) / (5 pi) + (pi L) / (10 pi) = (2 n L + L) / 10$. This formula gives us the position of the maximum probability density for any $n$.

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