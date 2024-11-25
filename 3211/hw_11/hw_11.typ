#import "../template.typ": *

#show: project.with(title: "Homework 11")


= 7.3.10

==

$
  hat(p) &= 985 / 1516 \
  &= 0.645
$

$
  (985 / 1516 - 1.96 sqrt(0.645(1 - 0.645)) / sqrt(1516), 985 / 1516 + 1.96 sqrt(0.645(1 - 0.645)) / sqrt(1516)) \
  (0.626, 0.674)
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

$
  0.03 &= 1.96 sqrt(0.5^2) / sqrt(n) \
  ==> quad n &= 1068
$

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
  g_(theta|bold(X)) = K t^8 (1 - t)^2 4t^3
$

$
  1 / (4K) &= integral_0^1 t^11 (1 - t)^2 dif t \
  &= integral_0^1 (t^11 + t^13 - 2t^12) dif t \
  &= 1 / 12 + 1 / 14 - 2 / 13 \
  ==> 4K &= 1092 \
  K &= 273
$

$
  g_(theta|bold(X))(t) = 273 dot 4 t^11 (1 - t)^2
$

==

$
  1092 integral_0^1 t t^11 (1 - t)^2 dif t &= 1092 integral_0^1 (t^12 + t^14 - 2t^13) dif t \
  &= 1092 (1 / 13 + 1 / 15 - 1 / 7) \
  &= 0.8
$