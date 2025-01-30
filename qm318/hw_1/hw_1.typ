#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 1")

= 1.2

$
  ket(psi_1) &= 1 / sqrt(3) ket(+) + i sqrt(2) / sqrt(3) ket(-) \
  ket(psi_2) &= 1 / sqrt(5) ket(+) - 2 / sqrt(5) ket(-) \
  ket(psi_3) &= 1 / sqrt(2) ket(+) + e^(i pi \/ 4) 1 / sqrt(2) ket(-)
$

==

=== First State

$
  ket(phi.alt_1) &= a ket(+) + b ket(-)
$

$
  0 &= braket(phi.alt_1, psi_1) \
  &= a^* 1 / sqrt(3) + b^* i sqrt(2) / sqrt(3) \
  ==> abs(a)^2 &= 2 abs(b)^2
$

We can use the normality condition:

$
  1 &= abs(a)^2 + abs(b)^2 \
  1 &= 2 abs(b)^2 + abs(b)^2 \
  1 &= 3 abs(b)^2 \
  ==> b &= 1 / sqrt(3) = b^*
$

Then we can plug our result of $b^*$ into the orthonormality condition.

$
  a^* &= -i b^* sqrt(2) \
  a^* &= -i sqrt(2) / sqrt(3) \
  ==> a &= i sqrt(2) / sqrt(3)
$

Therefore:

$
  ket(phi.alt_1) &= i sqrt(2) / sqrt(3) ket(+) + 1 / sqrt(3) ket(-)
$

=== Second State

$
  ket(phi.alt_2) = a ket(+) + b ket(-)
$

$
  0 &= braket(phi.alt_2, psi_2) \
  0 &= a^* / sqrt(5) - b^* 2 / sqrt(5) \
  a^* &= 2 b^*
$

Normality:

$
  abs(a)^2 + abs(b)^2 &= 1 \
  4 abs(b)^2 + abs(b)^2 &= 1 \
  b &= plus.minus 1 / sqrt(5)
$

Therefore, $a = plus.minus 2 / sqrt(5)$

There are two possible solutions, we will just use one here.

$
  ket(phi.alt_2) &= 2 / sqrt(5) ket(+) + 1 / sqrt(5) ket(-)
$

=== Third State

$
  ket(phi.alt_3) &= a ket(+) + b ket(-)
$

$
  0 &= braket(phi.alt_3, psi_3) \
  0 &= a^* 1 / sqrt(2) + b^* e^(i pi \/ 4) 1 / sqrt(2) \
  a^* &= - b^* e^(i pi \/ 4) \
  b &= -a e^(i pi \/ 4)
$

Normality:

$
  abs(a)^2 + abs(b)^2 &= 1
$

$
  abs(b)^2 &= (-a^* e^(-i pi \/ 4))(-a e^(i pi \/ 4)) \
  abs(b)^2 &= abs(a)^2
$

Plugging into normality condition:

$
  abs(a)^2 + abs(a)^2 &= 1 \
  2 abs(a)^2 &= 1 \
  abs(a)^2 &= 1 / 2 \
  a &= plus.minus 1 / sqrt(2)
$

$
  b &= minus.plus e^(i pi \/ 4) 1 / sqrt(2)
$

Therefore one option is:

$
  ket(phi.alt_3) &= 1 / sqrt(2) ket(+) - e^(i pi \/ 4) 1 / sqrt(2) ket(-)
$

==

$
  braket(psi_1, psi_2) &= 1
$

$
  braket(psi_1, psi_2) &= 1 / sqrt(15) + ((2 sqrt(2)) / sqrt(15) i) \
  &= 1 / sqrt(15) (1 + i 2 sqrt(2))
$

$
  braket(psi_1, psi_2) &= 1 / sqrt(6) - i sqrt(2) / sqrt(3) e^(i pi \/ 4) 1 / sqrt(2) \
  &= 1 / sqrt(3) (1 / sqrt(2) - i e^(i pi \/ 4)) \
  &= 1 / sqrt(6) (2 - i)
$

$
  braket(psi_2, psi_1) &= 1 / sqrt(15) - 2 / sqrt(5) i sqrt(2) / sqrt(3) \
  &= 1 / sqrt(15) (1 - i 2 sqrt(2))
$

$
  braket(psi_2) &= 1
$

$
  braket(psi_2, psi_3) &= 1 / sqrt(10) - 2 / sqrt(5) e^(i pi \/ 4) 1 / sqrt(2) \
  &= 1 / sqrt(10) (1 - 2 e^(i pi \/ 4)) \
  &= 1 / sqrt(10) (1 - sqrt(2) - i sqrt(2))
$

$
  braket(psi_3, psi_1) &= 1 / sqrt(6) + i sqrt(2) / sqrt(3) e^(-i pi \/ 4) 1 / sqrt(2) \
  &= 1 / sqrt(3) (1 / sqrt(2) + i e^(-i pi \/ 4)) \
  &= 1 / sqrt(6) (2 + i)
$

$
  braket(psi_3, psi_2) &= 1 / sqrt(10) - 2 / sqrt(5) 1 / sqrt(2) e^(-i pi \/ 4) \
  &= 1 / sqrt(10) (1 + sqrt(2) i - sqrt(2))
$

$
  braket(psi_3) = 1
$

= 1.4

Show $|b|^2 = |c|^2 = |d|^2 = 1/2$

$
  ket(+)_x &= a ket(+) + b ket(-) \
  ket(-)_- &= c ket(+) + d ket(-)
$

$
  1 / 2 &= abs(""_x braket(-, +))^2 \
  &= abs(c^* braket(+,+) + d^* braket(-,+))^2 \
  &= abs(c^*)^2 = abs(c)^2
$

$
  1 / 2 &= abs(""_x braket(+, +))^2 \
  &= abs(a^* braket(+,-) + b^* braket(-,-))^2 \
  &= abs(a^*)^2 = abs(a)^2
$

$
  1 / 2 &= abs(""_x braket(-, -))^2 \
  &= abs(c^* braket(+,-) + d^* braket(-,-))^2 \
  &= abs(d^*)^2 = abs(d)^2
$



= 9.21

$
  V_(M)(R) &= - D_e + 1 / 2 mu omega^2(R - R_0)^2
$

$
  V_("HO")(R) &= D_(e)(e^(-2 alpha (R - R_0)) - 2 e^(- alpha (R - R_0)))
$

$
  alpha = omega sqrt(mu / (2 D_e))
$

We can do a Taylor expansion around the point $R_0$.

$
  V_(M)(R_0) &= - D_e
$

$
  V'_(M)(R) &= D_(e)(-2 alpha e^(-2 alpha (R - R_0)) + 2 alpha e^(-alpha(R - R_0))) \
  V'_(M)(R_0) &= 0 \
$

$
  V''_(M)(R) &= D_e [4 alpha^2 e^(-2 alpha (R - R_0)) - 2 alpha^2 e^(-alpha(R - R_0))] \
  V''_(M)(R_0) &= D_(e)(2 alpha^2) = omega^2 mu
$

Plugging into the defintion of Taylor expansion:

$
  - D_e + 1 / 2 mu omega^2 (R - R_0)^2
$

Which is exactly what $V_("HO")$ is!

We can find the cubic term by finding the third degree Taylor expansion.

$
  V'''_(M)(R) &= D_(e)(-8 alpha^3 e^(-2 alpha (R - R_0)) + 2 alpha^3 e^(-alpha (R - R_0))) \
  V'''_(M)(R_0) &= D_(e)(-8 alpha^3 + 2 alpha^3) \
  &= - D_(e) 6 alpha^3 \
  &= - 3 / sqrt(2) 1 / sqrt(D_e) omega^3 mu^(3 \/ 2)
$

Therefore the cubic correction term is:
$
  -D_e 6 / 6 alpha^3 (R - R_0)^3
$