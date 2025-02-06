#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 2")


= 1.3

Proposition 1.15:

(a): $x y = x z ==> y = z$ \
(b): $x y = x ==> y = 1$ \
(c): $x y = 1 ==> y = 1 / x$ \
(d): $1 / (1 \/ x) = x$

#proof[
  (a)

  Suppose $x y = x z$.

  $
    y &= 1 dot y quad& "(M4)" \
    y &= (x / x) dot y quad& "(M5)" \
    y &= (x dot y) / x quad& "(M3)" \
    y &= (x dot z) / x quad& "(given)" \
    y &= z quad& "(M5)"
  $

  (b)

  Suppose $x y = x$.

  $
    y &= 1 dot y quad& "(M4)" \
    y &= x / x dot y quad& "(M5)" \
    y &= (x dot y) / x quad& "(M3)" \
    y &= x / x quad& ("given") \
    y &= 1 quad& ("M5")
  $

  (c)

  Suppose $x y = 1$

  $
    y &= 1 dot y quad& "(M4)" \
    y &= (x dot y) / x quad& "(M5, M4)" \
    y &= 1 / x quad& "(given)"
  $

  (d)

  $
    x &= 1 dot x quad& "(M4)" \
    x &= x / x dot x quad& "(M5)" \
    x &= x / (x dot x / x) x quad& "(M5)" \
    x &= x / x x / x 1 / (1 / x) quad& "(M5)" \
    x &= 1 / (1 / x)
  $
]


= 1.6

$m, n, p, q in ZZ, n > 0, q > 0, r = m / n = p / q$

==

We want to show that $(b^m)^(1/n) = (b^p)^(1/q)$.

#proof[
  We can use the uniqueness of nth roots to show that $(b^m)^(1/n) = (b^p)^(1/q)$.

  Let $a_1 = (b^m)^(1/n)$ and $a_2 = (b^p)^(1/q)$.

  $
    a_1^n = b^m = b^(r n) & quad quad &a_2^q = b^p = b^(q r) \
    a_1^(n q) = b^(r n q) & quad quad &a_2^(n q) = b^(q n r)
  $

  Hence:
  $
    a_1^(n q) &= a_2^(n q) \
    "take" n q"th root" ==> a_1 &= a_2
  $
  Therefore:
  $
    (b^m)^(1 / n) = (b^p)^(1 / q)
  $
]

==

We want to show that $b^(r + s) = b^r b^s$ if $s, r in QQ$.

#proof[
  Let $r = m / n, s = p / q$. By part (a), we know that the following holds:
  $
    b^r b^s &= (b^m)^(1 / n) (b^p)^(1 / q) \
    &= ((b^m)^q (b^p)^n)^(1 / (n q)) \
    &= (b^(m q) b^(p n))^(1 / (n q)) \
    &= b^((m q + p n) / (n q))
  $
  We know that $r + s = (m q + p n) / (n q)$. Hence:
  $
    b^((m q + p n) / (n q)) &= b^(r + s)
  $
]

==


$
  B(x) = {b^t | t in QQ, t <= x}
$
We want to show that $b^r = sup B(r)$ for $r in RR$.


#proof[
  $
    B(x) = {b^t | t in QQ, t <= x}
  $

  We know that $b^r in B(r)$ because $r in QQ$.

  If $t < r$, then $b^t < b^r$, so $b^r$ is #underline([an]) upper bound of $B(r)$.

  If $gamma < b^r$, then $gamma$ is smaller than some element in $B(r)$ because $b^r in B(r)$. Hence $gamma$ cannot be an upper bound of $B(r)$. Therefore, we conclude that $b^r$ is the LUB of $B(r)$.
]

==

We want to show that $b^(x + y) = b^x b^y$ for $x, y in RR$.

#proof[
  $
    b^(x+y) &= sup B(x + y) \
    b^x &= sup B(x) \
    b^y &= sup B(y)
  $
  We can manipulate $B(x+y)$ as follows. We let $t = c + d$.
  $
    B(x + y) &= {b^t | t in QQ, t <= x + y} \
    &= {b^(c + d) | c, d in QQ, c + d <= x + y} \
    &= {b^c b^d | c, d in QQ, c <= x, d <= y}
  $
  Claim: $b^x dot b^y = sup {b^c b^d | c, d in QQ, c <= x, d <= y}$.

  We can first show that $b^x b^y$ is an upper bound of the RHS.

  Because $c <= x$ and $d <= y$ for all $c, d in QQ$, we know that $b^c <= b^x$ and $b^d <= b^y$. We can multiply both inequalities to get that $b^x b^y >= b^c b^d$. Hence $b^x b^y$ is an upper bound.

  Now we show that $b^x b^y$ is the least upper bound of the RHS. Suppose there exists a $gamma < b^x b^y$ with $gamma >= b^c b^d$ for all $c <= x, d <= y$ and $c, d in QQ$.

  This implies:
  $
    b^c b^d <= gamma < b^x b^y
  $ <LUB-1.6e>

  We know that $QQ$ is dense in $RR$, which means that between any 2 (distinct) real numbers we can find a rational number. We also know that $c <= x, d <= y forall c, d in QQ$ is true in @LUB-1.6e. But since $c <= x$ and $d <= y$, we can see that there is no value of $gamma$ satisfying this inequality. Hence, there cannot be a smaller value than $b^x b^y$ that is an upper bound for $B(x + y)$, so $b^x b^y = sup B(x + y)$.
]

= 1.7

$b>1, y > 0$

==

Show for any $n in NN$, $b^n >= n(b-1)$.

#proof[
  We can expand $b^n - 1$:
  $
    b^n - 1 &= (b-1)underbrace((b^(n-1) + b^(n-2) + ... + b + 1), n "terms") >= n(b-1)
  $
  Hence, $b^n - 1 >= n(b - 1)$.
]

==

Show $b-1 >= n(b^(1/n) - 1)$.

#proof[
  If we let $a = b^(1/n)$, we know $a$ is unique because nth roots are unique. Then $b = a^n$. If we plug in this new definition of $b$ into the equation for part (a), we get

  $
    a^n - 1 >= n(a - 1)
  $
  Which we know is true from part (a).

  Hence, $b - 1 >= n(b^(1/n) - 1)$.
]


==

Show if $t > 1$ and $n > (b-1)/(t-1)$ then $b^(1/n) < t$.

#proof[
  Starting from part (b):
  $
    b - 1 &>= n(b^(1 / n) - 1) \
    1 + (b - 1) / n &>= b^(1 / n)
  $ <1.7beq1>

  Now starting from the given in the problem:
  $
    n &> (b-1) / (t-1) \
    n(t-1) &> b-1 \
    t - 1 &> (b-1) / n \
    t &> (b-1) / n + 1
  $<1.7beq2>

  Combining @1.7beq1 and @1.7beq2:
  $
    b^(1 / n) <= 1 + (b-1) / n < t \
    ==> quad b^(1 / n) < t
  $
]

==

Show if $w$ is such that $b^w < y$, then $b^(w + 1 / n)<y$ for large enough $n$.


#proof[
  Let $t = y dot b^(-w)$. From (c):
  $
    n &> (b - 1) / (t - 1) \
    n &> (b - 1) / (y dot b^(-w) - 1)
  $
  So given values for $y, b,$ and $w$, we need $n$ to be larger than the value on the RHS of the above inequality.

  By part (c):
  $
    b^(1 / n) &< t \
    b^(1 / n) &< y b^(-w) \
    b^(w + 1 / n) &< y
  $
]

==

Show if $b^w > y$, then $b^(w - 1 / n) > y$ for large enough $n$.

#proof[
  Let $t = b^w y^(-1)$ and $n > (b - 1) / (t - 1) = (b - 1) / (b^w y^(-1) - 1)$.

  Let $b^(1/n) < t$. Then $b^(1/n) < b^w y^(-1)$, which implies that $y < b^(w - 1/n)$.
]

==

$
  A(y) := {w | w in RR, b^w < y}
$

Show that $x = sup A(y)$ means that $b^x = y$.

#proof[
  Assume for the sake of contradiction that $b^x > y$. Then by (e) we know that $b^(x - 1 / n) > y$ for large enough $n$. So $x$ is not $sup A(y)$ as we have found a smaller value that is still larger than all elements in $A(y)$. So $b^x gt.not y$.

  Now assume for the sake of contradiction that $b^x < y$. Then by (d) we know that $b^(x + 1 / n) < y$ for large enough $n$. So $x$ is not an upper bound of $A(y)$, hence $b^x lt.not y$.

  Combining the two contradictions we conclude that $b^x = y$.
]


==

Show that this $x$ is unique. We need to show that if $b^(x_1) = b^(x_2)$ then $x_1 = x_2$. The contrapositive of this if $x_1 eq.not x_2 ==> b^(x_1) eq.not b^(x_2)$.

#proof[
  Let $b^(x_1) = sup B(x_1), b^(x_2) = sup B(x_2)$. Without loss of generality, suppose that $x_1 < x_2$. Then there exists an element $r in B(x_2)$ but $r in.not B(x_1)$ as $x_1 < x_2$. So the $sup B(x_1) eq.not sup B(x_2)$. Hence, $b^(x_1) eq.not b^(x_2)$ if $x_1 eq.not x_2$.
]


= 1.8

We want to show that there is no ordering that will make $CC$ an ordered field.

#proof[
  We know that in any ordered field, any element of the ordered field squared must larger than 0 (if the element is not zero, and $i eq.not 0$). So $i^2 = -1 > 0$. But we know that $(i^2)^2 = 1 > 0$ by the same logic. Combining $1 > 0$ and $-1 > 0$ by adding both sides yields $0 > 0$, which is a contradiction. $arrow.zigzag$

  Hence, this ordering on $CC$ can not form an ordered field. But we did not make any assumptions about the specifics of the ordering (just following the properties of an ordered field) when finding this contradiction, so it is impossible for $CC$ to form an ordered field.
]

= 1.9

We need to show that the lexographic ordering on $CC$ is an order. An order follows the following properties:

(1) Exactly one holds: $z < w, z = w, z > w$ \
(2) If $x < y$ and $y < z$ then $x < z$.

#proof[
  We will show property (1) first. We can show that if not $z > w$ and not $z < w$ then $z = w$. That way we know that $<$ and $>$ are both false, then must be $=$.

  Let $z = a + b i, w = c + d i, v = f + g i$.

  $
    z = w <==> a = c "and" b = d
  $

  $
    w <= z <==> a >= c "and" [c eq.not a "or" b >= d]
  $ <8-1-cond-1>

  $
    z >= w <==> c >= a "and" [c eq.not a "or" d >= b]
  $ <8-1-cond-2>

  @8-1-cond-1 and @8-1-cond-2 are the negation of the definition of lexographic ordering as we are showing that if $z gt.not w$ and $z lt.not w$.

  For @8-1-cond-1 and @8-1-cond-2 to both be true, then $a = c$ as $a <= c$ and $a >= c$.

  Because $a = c$, we know that $c eq.not a$ is false, so $b >= d$ and $b <= d$, which implies that $b = d$.

  Hence, $a = c$ and $b = d$ which is the definition of equality.

  And because all of these relations are exclusive, we know that exactly one will hold.

  Now we show (2). If $z < w < v ==> z < v$.

  We have 4 cases:

  + $a < c < f$, so $a < c ==> z < v$ .
  + $b < d < g$ and $a = c = f$, so $b < g$ and $a = f ==> z < v$.
  + $a = c < f$ and $b < d$, so $a < f ==> z < v$.
  + $a < c = f$ and $d = g$, so $a < c ==> z < v$,
]

This set does not have the LUB property due to the following set:
$
  S = {a + b i | a < 0}
$

This set has an upper bound of $z = 1 + 0 i$, but has no least upper bound.

Say $alpha = 0 + 0i$, then we can continue to decrease the imaginary part forever, but the real part must be zero (as if the real part $<0$ then it is less $alpha$). So there is no LUB of $S$.

If $alpha$ is our upper bound of $S$, we can find a $gamma = alpha - i$ that will still be an upper bound of $S$. 