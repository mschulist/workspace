#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 3")


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
  &= N/(2pi) (4 alpha) / (4k_0^2 - 8k k_0 + 4k^2 + alpha^2)
  // &= N / (2pi)[
  //   integral_0^infinity e^(x(-alpha / 2 + i (k_0 + k))) d x + integral_(-infinity)^0 e^(-x(
  //     -alpha / 2 + i (k_0 + k)
  //   )) d x
  // ] \
  // &= N / (2pi) [
  //   lr(e^(x(-alpha / 2 + i (k_0 + k))) / (-alpha / 2 + i (k_0 + k)) bar)_(x = 0)^infinity -
  //   lr(e^(-x(-alpha / 2 + i (k_0 + k))) / (-alpha / 2 + i (k_0 + k)) bar)_(x = -infinity)^0
  // ]
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
          axis(min: -10, max: 10, step: 2, location: "bottom", value_color: white, marking_color: white, stroke: white),
          axis(
            min: -0.25,
            max: 0.75,
            step: 0.25,
            location: "left",
            value_color: white,
            marking_color: white,
            stroke: white,
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
          axis(min: -10, max: 10, step: 2, location: "bottom", value_color: white, marking_color: white, stroke: white),
          axis(
            min: 0,
            max: 0.5,
            step: 0.125,
            location: "left",
            value_color: white,
            marking_color: white,
            stroke: white,
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
  1 &= C integral_(-3a)^a d x \
  &= 4a C \
  ==> C &= 1 / (4a)
$

==

$
  P(0 <= X <= a) &= integral_0^a 1 / (16a^2) d x \
  &= 1 / (16a)
$

==

=

$
  A(k) = (C alpha) / sqrt(pi) e^(-alpha^2 k^2)
$

$
  psi(x) &= integral_(-infinity)^infinity A(k) e^(i k x) d k \
  &= (C alpha) / sqrt(pi) integral_(-infinity)^infinity e^(-alpha^2 k^2) e^(i k x) d k \
  &= (C cancel(alpha)) / cancel(sqrt(pi)) cancel(sqrt(pi)) / cancel(alpha) e^(-x^2 / (4 alpha^2)) \
  &= C e^(-x^2 / (4 alpha^2))
$

By inspection, we can see that $alpha$ corresponds to the uncertainty/standard deviation $(epsilon)$ of the Gaussian. Therefore $Delta x = alpha$.

We can do a similar analysis for $A(k)$ to find the uncertainty in $k$.

$
  alpha^2 &= 1 / (4 epsilon^2) \
  ==> epsilon = Delta k &= 1 / (2 alpha)
$

$
  Delta x Delta k &<= 1 / 2 \
  cancel(alpha) / (2 cancel(alpha)) &<= 1 / 2 \
  1 / 2 &<= 1 / 2
$

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
      axis(min: 0, max: 8, step: 1, location: "bottom", value_color: white, marking_color: white, stroke: white),
      axis(min: 0, max: 4, step: 0.5, location: "left", value_color: white, marking_color: white, stroke: white),
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