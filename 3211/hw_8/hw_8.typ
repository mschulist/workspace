#import "../template.typ": *

#show: project.with(title: "Homework 7")

= 5.4.5


$
  X_i ~ U(35.5, 36.5)
$

$
  H = sum_(i = 1)^30 X_i
$

When we sum many random variables, they approach a normal distribution. So we can _approximate_ the summed height to be normal.

We know that:

$
  H tilde.dot cal(N)(n mu_X, n sigma^2_X)
$

We know $n = 30$ by problem statement. We also know that $mu_X = 36$ by uniform distribution. We can find $sigma^2_X$:

$
  sigma^2_X &= 1 / 12 (1)^2 \
  &= 1 / 12
$

Therefore, we know that:

$
  H tilde.dot cal(N)(1080, 2.5)
$

We can add another random variable $(T)$ that is the difference between two $H$ variables (one for each tower).

$
  T &= H_1 - H_2 \
  T &~ cal(N)(0, 5)
$

We would like to know the probability that $|T| < 4$.

$
  P(|T| < 4) &= P(T < 4) - P(T < -4)
$

```R
pnorm(4, 0, sqrt(5)) - pnorm(-4, 0, sqrt(5))
[1] 0.9263617
```

=

$
  f_(X)(x) = e^(-x), x > 0
$

$
  Y = ln(X)
$

$
  f_(Y)(y) = f_(X)(g^(-1)(y)) abs(dif / (dif y) g^(-1)(y))
$

$
  g^(-1)(y) &= e^y \
  abs((dif) / (dif y) g^(-1)(y)) &= e^y
$

$
  f_(Y)(y) &= f_(X)(e^y) e^y \
  &= e^(-e^y) e^y \
  &= e^(y - e^y)
$

Support:

$
  y > 0
$

=

$
  f_(X_1, X_2)(x_1, x_2) = x_1 + x_2 "for" 0 < x_1 < 1, 0 < x_2 < 1
$

$
  Y_1 &= X_1 X_2 \
  Y_2 &= X_2
$

$
  X_1 &= Y_1 / Y_2 \
  X_2 &= Y_2
$

$
  J &= mat(
    (diff x_1) / (diff y_1), (diff x_1) / (diff y_2);
    (diff x_2) / (diff y_1), (diff x_2) / (diff y_2);
    delim: "|"
  ) = mat(
  1 / y_2, -y_1 / y_2^2;
  0, 1;
  delim: "|"
  ) = 1 / y_2
$

$
  f_(Y_1, Y_2)(y_1, y_2) &= f_(X_1, X_2)(y_1 / y_2, y_2)|J| \
  &= y_1 / cancel(y_2) dot cancel(y_2) dot 1 / y_2 \
  &= y_1 / y_2
$

Support:

$
  0 < y_1 / y_2 < 1, 0 < y_2 < 1
$

This shows that $y_2 > y_1$ because the fraction $y_1 / y_2$ must be less than one.

$
  0 < y_1 < y_2 < 1
$


=

```R
samples = 1e5
X1 = runif(samples)
X2 = runif(samples)

Y = apply(cbind(X1, X2), 1, 'max')
```

==

```R
cdf_y = function(y) {mean(Y < y)}

c(cdf_y(0.5), cdf_y(0.75))
[1] 0.25194 0.56338
```

==

```R
y_df = data.frame(yvals = Y)

ggplot(y_df, aes(x = yvals)) +
  geom_histogram(binwidth=0.05) +
  xlab('Y') +
  labs(title = 'Histogram of Y') +
  xlim(c(0,1)) +
  dark_theme_gray(base_size = 10) +
  theme(
    plot.background = element_rect(
      fill = '#1c1c1c', size=0,
      ),
      panel.background = element_rect(
        fill = '#1c1c1c', size=0,
      ),
    )
```

#figure(
  image("prob_3_hist.svg"),
)