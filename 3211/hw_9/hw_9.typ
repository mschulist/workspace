#import "../template.typ": *

#show: project.with(title: "Homework 9")

= 6.3.4

==

$
  f (x) = x / theta^2 e^(x^2 / (2 theta^2)), quad x >= 0,
$

$
  mu &= theta sqrt(pi / 2) \
  sigma^2 &= theta^2 (4 - pi) / 2
$

Methods of moments. We have a single parameter $(theta)$ so we only need to find the first moment.

$
  hat(mu_1) &= 1 / n sum_(i = 1)^n x_i = overline(x)
$

$
  mu_1 &= mu = theta sqrt(pi / 2)
$

We can set them equal and solve for $theta$:

$
  overline(x) &= theta sqrt(pi / 2) \
  overline(x) sqrt(2 / pi) &= hat(theta)
$

= 6.3.6

==

$
  X_i ~^"iid" "Poisson"(lambda)
$


$
  p_(X)(x) &= (lambda^x e^(-lambda)) / x!
$

Maximum likelihood: we will find the log-likelihood.

$
  ln(p_(X)(x)) &= ln((lambda^x e^(-lambda)) / x!) \
  &= ln(lambda^x) + ln(e^(-lambda)) - ln(x!)
$

$
  cal(L)(theta) &= n ln(e^(-theta)) + sum_(i = 1)^n [ln(theta^(x_i)) - ln(x_i !)] \
  &= -n theta + sum_(i = 1)^n [x_i ln(theta) - ln(x_i !)] \
  &= -n theta + ln(theta) sum_(i = 1)^n x_i - sum_(i = 1)^n ln(x_i !)
$

We can set the derivative of the log-likelihood equal to zero to find the maximum.

$
  (dif cal(L)(theta)) / (dif theta) &= -n + 1 / theta sum_(i = 1)^n x_i \
  ==> quad 0 &= -n + 1 / theta sum_(i = 1)^n x_i \
  n theta &= sum_(i = 1)^n x_i \
  hat(theta) &= 1 / n sum_(i = 1)^n x_i \
  &= overline(x)
$

==

$
  overline(x) &= (12 + 2 dot 11 + 3 dot 14 + 4 dot 9) / 50 \
  &= 2.24
$

Therefore, $hat(lambda) = 2.24$.

==

Model-based variance:

$
  "var"(X) &= hat(lambda) \
  &= 2.24
$

Sample variance:

$
  S_x &= 1 / (n - 1) sum_(i = 1)^n x_i \
  &= 1.533
$

If the data truly assumes a Poisson distribution, then we should use the model-based variance as it more accurately represents the population.

= 6.3.7

==

$
  X ~ "nbinom"(r = 5, p = ?)
$

$
  P(X = x) &= binom(x + 4, x) (1 - p)^x p^5
$

$
  cal(L)(p) &= 5 ln(p) + ln binom(X + 4, X) + ln(1 - p) X
$

$
  (dif cal(L)) / (dif p) &= 5 / p - (X) / (1 - p) \
  ==> quad 0 &= 5 / p - (X) / (1 - p) \
  hat(p) &= 5 / (5 + X)
$

==

==

$
  hat(p) &= 5 / (5 + 47) \
  &= 0.096
$
