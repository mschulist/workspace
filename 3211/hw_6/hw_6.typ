#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 6")


= 4.3.7

==
$
  E(Y|X = 1) &= 0.66 dot 1 + 0.34 dot 2 \
  &= 1.34
$

$
  "Var"(Y|X = 1) &= (1 - 1.34)^2 dot 0.66 + (2 - 1.34)^2 dot 0.34 \
  &= 0.2244
$

==

#figure(
  table(
    columns: 4 * (auto,),
    stroke: white,
    table.cell(rowspan: 2, colspan: 2, []), table.cell(colspan: 2, $y$),
    $1$, $2$,
    table.cell(rowspan: 3, $x$, align: horizon), $1$, $0.132$, $0.068$,
    $2$, $0.24$, $0.06$,
    $3$, $0.33$, $0.17$
  ),
)

==

$
  P(Y = 1) &= 0.132 + 0.24 + 0.33 \
  &= 0.702
$

==

$
  P(X = 1|Y = 1) = 0.132 / 0.702 = 0.188
$

= 4.3.11

$
  f(x, y) = cases(
    x + y "for" 0 < x < 1 "and" 0 < y < 1,
    0 "otherwise"
  )
$

==

$
  f_(Y|X = x)(y) &= integral_0^1 (x + y) dif x \
  &= lr(x^2 / 2 + x y |)_(x = 0)^1 \
  &= 1 / 2 + y
$

$
  P(0.3 < Y < 0.5|X = x) &= integral_0.3^0.5 (1 / 2 + y) dif y \
  &= lr(y / 2 + y^2 / 2 |)_(y = 0.3)^0.5 \
  &= 0.18
$

= 4.3.15

$
  f(x, y) = (e^(-x / y) e^(-y)) / y "for" x > 0 "and" y > 0
$

$
  f_(X|Y = y)(x) = 1 / y e^(-x / y) "for" x > 0
$

This equation is not separable, so therefore $X$ and $Y$ are not independent.

= 4.4.4

==

Let $T = $ total waiting time.

$
  T = X_1 + X_2 + X_3 + X_4 + X_5 + Y_1 + Y_2 + Y_3
$

==

$
  E(T) &= E(X_1) + E(X_2) + E(X_3) + E(X_4) + E(X_5) + E(Y_1) + E(Y_2) + E(Y_3) \
  &= 5 dot 3 + 3 dot 6 \
  &= 33
$

Because the events are independent (or at least we are modeling them as such), we can add the variances.

$
  "Var"(T) &= "Var"(X_1) + "Var"(X_2) + "Var"(X_3) + "Var"(X_4) + "Var"(X_5) + "Var"(Y_1) + "Var"(Y_2) + "Var"(Y_3) \
  &= 5 dot 2 + 3 dot 4 \
  &= 22
$

= 4.4.8

$
  f(x, y) = cases(
    24 x y "for" 0 <= x <= 1 "and" 0 <= y <= 1 "and" x + y <= 1,
    0 "otherwise"
  )
$

$
  E(X) &= integral_0^1 integral_0^(1 - x) 24 x^2 y dif y dif x \
  &= integral_0^1 12 x^2 (1 - x)^2 dif x \
  &= integral_0^1 (12 x^2 - 24 x^3 + 12 x^4) dif x \
  &= lr(4 x^3 - 6 x^4 + 12/5 x^5 |)_(x = 0)^1 \
  &= 2 / 5
$

$E(X) = E(Y)$ because the function is symmetric.

$
  E(X Y) &= integral_0^1 integral_0^(1 - x) x y 24 x y dif y dif x \
  &= integral_0^1 integral_0^(1 - x) 24x^2 y^2 dif y dif x \
  &= integral_0^1 8 x^2 (1 - x)^3 dif x \
  &= 2 / 15
$

$
  "Cov"(X, Y) &= E(X Y) - E(X)E(Y) \
  &= 2 / 15 - 4 / 25 \
  &= - 2 / 75
$