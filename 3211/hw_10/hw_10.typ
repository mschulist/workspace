#import "../template.typ": *

#show: project.with(title: "Homework 10")

= 6.2.6

==

$
  hat(p)_1 &= X / m \
  hat(p)_2 &= Y / n
$

We need to show that the expected value of the estimator $(hat(p)_1 - hat(p)_2)$ is the estimator itself $(p_1 - p_2)$.

$
  E(hat(p)_1 - hat(p)_2) &= E(hat(p)_1) - E(hat(p_2)) \
  &= E(X) / m - E(Y) / n \
  &= (p_1 m) / m - (p_2 n) / n \
  &= p_1 - p_2
$

We can see that this is an unbiased estimator.

==

To find the standard error, we need to find the error of the estimator.

$
  "var"(hat(p)_1 - hat(p)_2) &= (p_1 (1 - p_1)) / m + (p_2 (1 - p_2)) / n \
  sigma_(hat(p)_1 - hat(p)_2) &= sqrt((p_1 (1 - p_1)) / m + (p_2 (1 - p_2)) / n) \
$

We know that the standard error is just the square root of the variance of the estimator, but we don't actually know the values of the values of $p_1$ and $p_2$. We can estimate them with $hat(p)_1$ and $hat(p)_2$.

$
  S_(hat(p)_1 - hat(p)_2) &= sqrt((hat(p)_1 (1 - hat(p)_1)) / m + (hat(p)_2 (1 - hat(p)_2)) / n)
$

==

$
  hat(p)_1 - hat(p)_2 &= 70 / 100 - 160 / 200 \
  &= -0.1
$

$
  S_(hat(p)_1 - hat(p)_2) &= sqrt((0.7 dot 0.3) / 100 + (0.8 dot 0.2) / 200) \
  &= 0.054
$

= Additional Problem

$
  f(x | theta) &= theta x^(theta - 1), 0 < x < 1, theta > 0
$

==

$
  cal(L)(theta) &= (theta - 1) sum ln x_i + n ln theta \
  &= theta sum ln x_i - sum ln x_i + n ln theta
$

$
  (diff d cal(L)) / (diff theta) &= sum ln x_i + n / theta \
  ==> quad 0 &= sum ln x_i + n / theta \
  - n / theta &= sum ln x_i \
  hat(theta) &= - n / (sum ln x_i)
$


==

$
  I(theta) &= - E[diff^2 / (diff theta^2) ln f(X; theta)]
$


Find the second derivative of $cal(L)$.

$
  cal(L)(theta) &= (theta - 1) X + ln theta \
  (diff cal(L)(theta)) / (diff theta) &= X + 1 / theta \
  (diff^2 cal(L)) / (diff theta^2) &= - 1 / theta^2
$

Find the negative expected value of $(diff^2 cal(L)) / (diff theta^2)$

$
  E(1 / theta^2) = 1 / theta^2
$

==

$
  hat(theta) &~^. cal(N)(theta, 1 / (n I(theta))) \
  &~^. cal(N)(3, 1 / (100 1 / 9)) \
  &~^. cal(N)(3, 0.09)
$

```R
pnorm(3.1, 3, 0.3) - pnorm(2.9, 3, 0.3)
[1] 0.2611173
```