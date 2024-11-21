#import "../template.typ": *

#show: project.with(title: "Homework 11")


= 7.3.10

==

$
  hat(p) &= 985 / 1516 \
  &= 0.645
$

$
  (0.645 - 1.96 sqrt(0.645(1 - 0.645)) / sqrt(1516), 0.645 + 1.96 sqrt(0.645(1 - 0.645)) / sqrt(1516)) \
  (0.621, 0.669)
$


==

False. This interval is the confidence we have that the true proportion lies within it, not the probability.

= 7.4.4

$
  hat(p) &= 75 / 193 \
  &= 0.389
$

==

$
  0.03 &= 1.96 dot sqrt(0.389(1 - 0.389)) / sqrt(n) \
  ==> quad n &= 1015
$

==

If we did not have any information about the variance from the sample proportion, we would have to estimate it at a values of $0.5$. This will give us the largest spread (variance), and the true variance will probability be smaller.

=

$
  X_1, ..., X_10 ~ "Bern"(theta)
$

$
  h_(theta)(t) = 4t^3 quad 0 < t < 1
$

$
  p_(X|theta = t) = t^x (1 - t)^(1 - x) quad x in {0, 1}
$

$
  bold(X) = {1, 1, 1, 0, 1, 1, 0, 1, 1, 1}
$

==

$
  p_(bold(X)|theta = t) = t^8 (1 - t)^2
$

$
  g_(theta|bold(X)) = K t^8 (1 - t)^2
$

$
  1 / K &= integral_0^1 t^8 (1 - t)^2 dif t \
  &= integral_0^1 t^8 (1 - 2t + t^2) dif t \
  &= integral_0^1 (t^8 - 2t^9 + t^10) dif t \
  &= lr(t^9 / 9 - 1 / 5 t^10 + t^11 / 11|)_(t = 0)^1 \
  &= 1 / 9 - 1 / 5 + 1 / 11 \
  &= 1 / 495 \
  ==> quad K &= 495
$

$
  g_(theta|bold(X))(t) = 495 t^8 (1 - t)^2
$

==

$
  495 integral_0^1 t t^8 (1 - t)^2 dif t &= 495 integral_0^1 (t^9 - 2 t^10 + t^11) dif t \
  &= 495 (1 / 10 - 2 / 11 + 1 / 12) \
  &= 0.75
$