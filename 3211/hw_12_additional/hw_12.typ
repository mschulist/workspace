#import "../template.typ": *

#show: project.with(title: "Homework 12")

= 7.3.8

==

```R
confint(lm(ed~1))
               2.5 %   97.5 %
(Intercept) 3.351534 3.624032
```

= 7.4.2

$
  S_"pr" = 18 "grams" \
  n = 50 \
  L = 4
$

$
  n &= (2 t_(49, 0.05) 18 / 4)^2 \
  &= (3.35 18 / 4)^2 \
  &= 228
$

= 7.3.18

$
  n = 15 \
  S = 0.64 " " mu "m" \
$

$
  chi^2_(14, 0.975) = 5.63 \
  chi^2(14, 0.025) = 26.12
$

$
  (sqrt((14)0.64^2) / (26.12)), sqrt(((14)0.64^2) / (5.63)) \
  (sqrt(0.22), sqrt(1.02)) \
  (0.47, 1.01)
$

We need to show normal population to use this CI.

= 8.2.4


$
  H_0: mu = mu_0
$

==

$
  H_a: mu > mu_0
$

==

$
  H_a ': mu < mu_0
$

==

Case 1: if the null is rejected she should buy the new machine because there is evidence that the new one is better.

Case 2: if the null is rejected, there is evidence that the new machine is worse than the new one, so she should NOT buy the new machine.

= 8.3.6

==

$
  H_0 &: p = 0.3 \
  H_a &: p > 0.3
$

==

```R
pnorm(185 / 500, 0.3, sqrt(185/500 * (1 - 185/500) / 500))
[1] 0.9994065
```

We reject because 1 - this number is much less than 0.05.

==

The same thing, we still reject.

= 8.3.2


$
  overline(X) = 2.1 "ppm" \
  S = 4.1 "ppm"
$

==

$
  H_0 &: mu = 1 \
  H_a &: mu > 1
$

==

We can make a CI.

$
  T_(H_0) &= (2.1 - 1) / (4.1 \/ sqrt(36)) \
  &= 1.61
$

```R
qt(0.95, 35)
[1] 1.689572
```

Because our t score is less than the critical t score, we do not reject $H_0$.

==

```R
pt(1.61, df=35)
[1] 0.9418092
```

Still don't reject. $p = 1 - 0.942 = 0.058$

= 8.3.4

$
  mu_0 = 29
$

==

$
  H_0 &: mu = 29 \
  H_a &: mu > 29
$

$
  overline(X) = 30.79 \
  S = 6.53 \
  n = 8
$

$
  T_H_0 &= (30.79 - 29) / (6.53 \/ sqrt(8))\
  &= 0.775
$

```R
pt(0.775, df=7)
[1] 0.7681449
```

$
  p = 1 - 0.768 = 0.232
$

Do not reject.

==

$n < 30$, so population must be normal.