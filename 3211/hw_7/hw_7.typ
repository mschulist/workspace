#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 7")

= 4.4.2

==

$
  X = "uniform"(0, 1) quad Y = "uniform"(0, 1)
$

We can set $T = max(X, Y)$ and solve for the CDF of $T$.

$
  P(T <= t) &= P(X <= t)P(Y <= t) \
  &= t dot t \
  &= t^2 "for" 0 < t < 1
$

$X$ and $Y$ are independent so we can just multiply them.


$
  F_(T)(t) = cases(
    0 "if" x < 0,
    t^2 "if" 0 <= x <= 1,
    1 "if" x > 1
  )
$

We can differentiate to get the PDF:

$
  f_(T)(t) = cases(
    0 &"if" x < 0,
    2t &"if" 0 <= x <= 1,
    1 &"if" x > 1
  )
$

= 4.5.4


==

I would expect a positive correlation because as a tree gets older it usually gets larger, which its diameter corresponds to.


#let treeage = csv("treeage.csv")
#let treeage_fl = ()
#for i in range(27) {
  let element = treeage.at(i)
  treeage_fl.push((float(element.at(0)), float(element.at(1))))
}

#scatter_plot(
  plot(
    data: treeage_fl,
    axes: (
      axis(
        min: 0,
        max: 600,
        step: 50,
        location: "bottom",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [Diameter],
      ),
      axis(
        min: 0,
        max: 175,
        step: 25,
        location: "left",
        value_color: white,
        marking_color: white,
        stroke: white,
        title: [Age],
      ),
    ),
  ),
  (100%, 50%),
  markings: "",
  caption: [Diameters and Ages of Trees],
  stroke: red,
)

==

```R
cov(x, y)
[1] 9308.47

cor(x, y)
[1] 0.9262
```

Yes, it seems to decently capture the linear relationship between the data. In the plot, it is clear that there is a positive linear relationship between diameter and ages of trees.

= 4.5.8

$
  X = "uniform"(-1, 1) quad Y = X^2
$

Show that $rho_(X,Y) = 0$

$
  E(X Y) &= E(X^3) \
  &= integral_(-1)^1 x^3 dif x \
  &= 0
$

$
  E(Y) &= E(X^2) \
  &= integral_(-1)^1 x^2 dif x \
  &= 2 / 3
$

$
  E(X) &= 0
$

$
  "Cov"(X, Y) &= E(X Y) - E(X)E(Y) \
  &= 0 - 0 \
  &= 0
$

= 4.6.8

$
  N_1 &= "recent", &p_1 &= 0.6 \
  N_2 &= "moderately aged", &p_2 &= 0.3 \
  N_3 &= "aged", &p_3 &= 0.08 \
  N_4 &= "unusable", &p_4 &= 0.02
$

We will have $16$ trials because $n = 16$.

==

We can view this as a binomial with $p = 0.02, n = 16$.

```R
dbinom(1, 16, 0.02)
[1] 0.2363421
```

==

Here we can use the multinomial distribution. We want to know the probability of $x_1 = 10, x_2 = 4, x_3 = 2, x_4 = 0$.

$
  (16!) / (10! 4! 2!) 0.6^10 0.3^4 0.08^2 approx 0.0377
$

==

```R
dmultinom(c(10,4,2,0), prob=c(0.6,0.3,0.08,0.02))
[1] 0.03765241
```

==

$
  "Cov"(N_1 + N_2, N_3) &= -16(0.6 + 0.3)(0.08) \
  &= -1.152
$

It is negative because if one of the variables has a small value for $N_i$, then the others must have larger values. Therefore there is a negative relationship between the variables as adding "mass" to one of the $N_i$'s will reduce mass from another.

==

We can treat this like a single binomial with $n = 16, p = 0.98$.

$
  "Var"(N_1 + N_2 + N_3) &= n p (1 - p) \
  &= 16(0.98 dot 0.02) \
  &= 0.3136
$

= 5.3.4

$
  X_1 = cal(N)(6, 2) quad X_2 = cal(N)(7, 3) quad X_3 = cal(N)(8, 4)
$

==

$
  Y = X_1 + X_2 + X_3
$

$
  Y &= cal(N)(6 + 7 + 8, 2 + 3 + 4) \
  &= cal(N)(21, 9)
$

```R
qnorm(0.95, 21, 3)
[1] 25.93456
```

==

```R
pnorm(25, 21, 3)
[1] 0.9087888
```

==

$
  Z = "binom"(n = 5, p = 0.9087888)
$

```R
dbinom(3,5,1 - 0.9087888)
[1] 0.006267155
```

= Extra Problem

$
  mu_X = 2.8, mu_Y = 110, sigma^2_X = 0.16, sigma^2_Y = 100, rho = 0.6
$

==

$
  P(106 < Y < 124)
$

```R
pnorm(124, 110, 10) - pnorm(106, 110, 10)
[1] 0.5746651
```

==

$
  P(106 < Y < 124 | X = 3.2)
$

$
  Y|X = 3.2 &~ cal(N)(110 + (0.6 dot 10) / 0.4 (3.2 - 2.8), (1 - 0.36)100) \
  &~ cal(N)(116, 64)
$

```R
pnorm(124, 116, 8) - pnorm(106, 116, 8)
[1] 0.735695
```