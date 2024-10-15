#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 5")


=

$
  psi(x) = N e^(- alpha / 2 |x|) e^(i k_0 x)
$

==

$
  1 &= integral_(-infinity)^infinity |psi(x)|^2 d x \
  &= integral_(-infinity)^infinity psi^*(x) psi(x) d x \
  &= N^2 integral_(-infinity)^infinity e^(-alpha |x|) d x \
  &= 2 N^2 integral_0^infinity e^(-alpha x) d x \
  1 &= 2 N^2 / alpha \
  ==> N &= sqrt(alpha / 2)
$

==

$
  A(k) &= 1 / (2pi) integral_(-infinity)^infinity psi(x) e^(-i k x) d x \
  &= 1 / (2pi) integral_(-infinity)^infinity N e^(- alpha / 2 |x|) e^(i k_0 x) e^(-i k x) d x \
  &= N / (2pi) integral_(-infinity)^infinity e^(- alpha / 2 |x|) e^(i x(k_0 - k)) d x \
  &= N / (2pi) integral_(-infinity)^infinity e^(-alpha / 2 |x| + i x(k_0 - k)) d x \
  &= N / (2pi)[
    integral_0^infinity e^(x(-alpha / 2 + i (k_0 - k))) d x + integral_(-infinity)^0 e^(x(alpha / 2 + i (k_0 - k))) d x
  ] \
  &= N / (2pi) [
    lr(e^(x(-alpha / 2 + i (k_0 - k))) / (-alpha / 2 + i (k_0 - k)) bar)_(x = 0)^infinity +
    lr(e^(x(alpha / 2 + i (k_0 - k))) / (alpha / 2 + i (k_0 - k)) bar)_(x = -infinity)^0
  ] \
  &= N / (2pi) [
    (cancel(e^(-infinity alpha / 2) e^(i infinity(k_0 - k))) -
    e^0) / (-alpha / 2 + i (k_0 - k))
    +
    (e^0 -
    cancel(e^(-infinity alpha / 2) e^(infinity(k_0 - k)))) / (alpha / 2 + i (k_0 - k))
  ] \
  &= N / (2pi) [
    (-1) / (-alpha / 2 + i (k_0 - k))
    +
    1 / (alpha / 2 + i (k_0 - k))
  ] \
  &= N / (2pi) [
    (-1) / (-alpha / 2 + i (k_0 - k))
    dot
    (alpha / 2 + i (k_0 - k)) / (alpha / 2 + i (k_0 - k))
    +
    1 / (alpha / 2 + i (k_0 - k))
    dot
    (-alpha / 2 + i (k_0 - k)) / (-alpha / 2 + i (k_0 - k))
  ] \
  &= N / (2pi) [
    (-2 (alpha / 2))
    /
    (alpha^2 / 4 - (k_0 - k)^2)

  ] \
  // &= N / (2pi) dot 1 / (-alpha / 2 + i (k_0 - k)) [-2] \
  &= N / (2pi) (-alpha) / (-alpha^2 / 4 - (k_0 - k)^2) \
  &= N / (2pi) (4 alpha) / (alpha^2 + 4(k_0 - k)^2) \
  // &= N / (2pi) (4 alpha) / (4k_0^2 - 8k k_0 + 4k^2 + alpha^2) \
$

==

// real part of psi(x)
#let psi_real = csv("psi_re.csv")
#let psi_real_fl = ()
#for i in range(1000) {
  let element = psi_real.at(i)
  psi_real_fl.push((float(element.at(0)), float(element.at(1))))
}

// squared psi(x)
#let psi_sq = csv("psi_sq.csv")
#let psi_sq_fl = ()
#for i in range(1000) {
  let element = psi_sq.at(i)
  psi_sq_fl.push((float(element.at(0)), float(element.at(1))))
}


#figure(
  grid(
    columns: 2,
    row-gutter: 2mm,
    column-gutter: 1mm,
    graph_plot(
      plot(
        data: psi_real_fl,
        axes: (
          axis(
            min: -10,
            max: 10,
            step: 2,
            location: "bottom",
            value_color: white,
            marking_color: white,
            stroke: white,
            title: [$x$],
          ),
          axis(
            min: -0.25,
            max: 0.75,
            step: 0.25,
            location: "left",
            value_color: white,
            marking_color: white,
            stroke: white,
            title: [$"Re"[psi(x)]$],
          ),
        ),
      ),
      (100%, 50%),
      markings: "",
      caption: [$"Re"[psi(x)]$ for $alpha = 1$],
      stroke: red,
    ),
    graph_plot(
      plot(
        data: psi_sq_fl,
        axes: (
          axis(
            min: -10,
            max: 10,
            step: 2,
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
            title: [$|psi(x)|^2$],
          ),
        ),
      ),
      (100%, 50%),
      markings: "",
      caption: [$|psi(x)|^2$ for $alpha = 1$],
      stroke: red,
    ),
  ),
)

$
  |A(k)|^2 &= abs(N / (2pi) (4 alpha) / (alpha^2 + 4(k_0 - k)^2))^2 \
  &= (N^2 16alpha^2) / (4pi^2 (alpha^2 + 4(k_0 - k)^2)^2) \
$

// |A(k)|^2 for alpha = 1, k_0 = 1

#let fourier = csv("fourier_transform.csv")
#let fourier_fl = ()
#for i in range(1000) {
  let element = fourier.at(i)
  fourier_fl.push((float(element.at(0)), float(element.at(1))))
}

#figure(
  graph_plot(
    plot(
      data: fourier_fl,
      axes: (
        axis(
          min: -1,
          max: 3,
          step: 0.5,
          location: "bottom",
          value_color: white,
          marking_color: white,
          stroke: white,
          title: [$k$],
        ),
        axis(
          min: 0,
          max: 0.2,
          step: 0.0625,
          location: "left",
          value_color: white,
          marking_color: white,
          stroke: white,
          title: [$|A(k)|^2$],
        ),
      ),
    ),
    (100%, 25%),
    markings: "",
    caption: [$|A(k)|^2$ for $alpha = 1, k_0 = 1$],
    stroke: red,
  ),
)

==

We can plug $p = planck.reduce(0.5 k_0)$ into $|A(k)|^2$ to find the probability of finding the particle with momentum $p$ (using the relation $p = planck.reduce k$).

$
  planck.reduce(0.5 k_0) &= planck.reduce k \
  0.5 k_0 &= k \
  ==> |A(0.5 k_0)|^2 &= (N^2 16alpha^2) / (4pi^2 (alpha^2 + 4(k_0 - 0.5k_0)^2)^2) \
$

We can repeat the same process for $p = planck.reduce(1.1 k_0)$.

$
  planck.reduce(1.1 k_0) &= planck.reduce k \
  1.1 k_0 &= k \
  ==> |A(1.1 k_0)|^2 &= (N^2 16alpha^2) / (4pi^2 (alpha^2 + 4(k_0 - 1.1k_0)^2)^2) \
$

By inspection, we can see that when $k = 1.1k_0$, the denominator will be smaller than when $k = 0.5k_0$. Therefore, the probability of finding the particle with momentum $p = planck.reduce(1.1 k_0)$ will be higher than the probability of finding the particle with momentum $p = planck.reduce(0.5 k_0)$ (unless $k_0 = 0$, when they are equal).

=

$
  psi(x) = cases(
  0 &"for" x < -3a,
  C &"for" -3a <= x <= a,
  0 &"for" x > a
)
$

==

$
  1 &= C^2 integral_(-3a)^a d x \
  &= 4a C^2 \
  ==> C &= 1 / (2sqrt(a))
$

==

$
  P(0 <= X <= a) &= integral_0^a 1 / (16a^2) d x \
  &= 1 / (16a)
$

==

In order to find the plausible values for momenta, we need to take the Fourier transform of $psi(x)$.

$
  A(k) &= integral_(-infinity)^infinity psi(x) e^(-i k x) d x \
  &= C integral_(-3a)^a e^(-i k x) d x \
  &= C [lr((i e^(-i k x)) / (k) bar)_(x = -3a)^a] \
  &= C / k (i e^(-i k a) - i e^(3 i k a)) \
$

We can set $|A(k)|^2 = 0$ to find impossible values for the momentum.

$
  0 &= |A(k)|^2 \
  0 &= abs(C / k (i e^(-i k a) - i e^(3 i k a)))^2 \
  0 &= C^2/k^2 abs(i e^(-i k a) - i e^(3 i k a))^2 \
  0 &= (C^2 / k^2) (sin(3 k a) + sin(k a) + i(cos(k a) - cos(3 k a)))(sin(3 k a) + sin(k a) - i(cos(k a) - cos(3 k a))) \
  0 &= (C^2 / k^2) (sin^2(3 k a) + cos^2(3 k a) + sin^2(k a) + cos^2(k a) - 2cos(3 k a)cos(k a) + 2sin(3 k a)sin(k a)) \
  0 &= (C^2 / k^2) (2 - 2cos(3 k a)cos(k a) + 2sin(3 k a)sin(k a)) \
  1 &= cos(3 k a)cos(k a) - sin(3 k a)sin(k a) \
  1 &= cos(4 k a) \
  ==> 4 k a &= 2n pi \
  k &= (n pi) / (2a) quad n in ZZ \
  // 0 &= C^2 / k^2(i e^(- i k a) - i e^(3 i k a)) (i e^(-3 i k a) - i e^(i k a)) \
  // 0 &= C^2 / k^2 e^(i k a)(-e^(-4) - e^4) + 2 \
  // (-2k^2) / (C^2(-e^4 - e^(-4))) &= e^(i k a) \
  // (2k^2) / (C^2(e^4 + e^(-4))) &= e^(i k a) \
  // 0 &= e^(i k a) - e^(-3 i k a) \
  // e^(-3 i k a) &= e^(i k a) \
$

We know that $p = planck.reduce k$, so we can write the values for which $k = 0$ in terms of $p$.

$
  k &= (n pi) / (2a) \
  p / planck.reduce &= (n pi) / (2a) \
  p &= (n pi planck.reduce) / (2a) quad n in ZZ
$

=

$
  A(k) = (C alpha) / sqrt(pi) e^(-alpha^2 k^2)
$

$
  psi(x) &= integral_(-infinity)^infinity A(k) e^(i k x) d k \
  &= (C alpha) / sqrt(pi) integral_(-infinity)^infinity e^(-alpha^2 k^2) e^(i k x) d k \
  "gaussian integral": a=alpha^2, b = i x ==> quad&= (C cancel(alpha)) / cancel(sqrt(pi)) cancel(sqrt(pi)) / cancel(alpha) e^(-x^2 / (4 alpha^2)) \
  &= C e^(-x^2 / (4 alpha^2))
$

By inspection of $psi(x)$, we can see that $alpha$ corresponds to the uncertainty/standard deviation $(epsilon)$ of the Gaussian. Therefore $Delta x = alpha$.

We can do a similar analysis for $A(k)$ to find the uncertainty in $k$.

$
  alpha^2 &= 1 / (4 epsilon^2) \
  ==> epsilon = Delta k &= 1 / (2 alpha)
$

$
  Delta x Delta k &<= 1 / 2 \
  cancel(alpha) / (2 cancel(alpha)) &<= 1 / 2 \
  1 / 2 &= 1 / 2
$

Because this is a Gaussian, $Delta x Delta k$ attains the minimum value of $1 / 2$.

=

$
  U(x)= 1 / x^2 - 2 / x + 1
$


==

#let pot_str = csv("prob_4_plot.csv")

#let pot_fl = ()

// hard coded because len attribute is not working
#for i in range(1000) {
  let element = pot_str.at(i)
  pot_fl.push((float(element.at(0)), float(element.at(1))))
}

#graph_plot(
  plot(
    data: pot_fl,
    axes: (
      axis(
        min: 0,
        max: 8,
        step: 1,
        location: "bottom",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [x],
      ),
      axis(
        min: 0,
        max: 4,
        step: 0.5,
        location: "left",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [$U(x)$],
      ),
    ),
  ),
  (100%, 50%),
  markings: "",
  caption: [Potential Energy vs. Position of $U(x) = 1 / x^2 - 2 / x + 1$],
  stroke: red,
)

$
  lim_(x -> 0) U(x) &= infinity \
  lim_(x -> infinity) U(x) &= 1 / infinity - 2 / infinity + 1 = 1
$

==

If the particle has $0.5$ Joules of energy, it will have 2 turning points and is bound. We can find those turning points by setting $U(x) = 0.5$ and assuming that $x eq.not 0$.

$
  U(x) &= 0.5 \
  1 / x^2 - 2 / x + 1 &= 0.5 \
  1 / x^2 - 2 / x &= -0.5 \
  (x - 2x^2) / x^3 &= -0.5 \
  x - 2x^2 &= -0.5x^3 \
  0.5x^2 - 2x + 1 &= 0 \
  ==> x &= 2 plus.minus sqrt(2)
$


==

When a particle has $2$ Joules of energy, it is not bound as there is only one time when $U(x) = 2$ for $x > 0$. The limit of $U(x)$ as $x -> infinity$ is $1$, so the particle will never get "stopped" by the potential energy (or turned around).

$
  f(x) &= x^2 \
  f(1) &= 1^2 \
  &= 1 \
$