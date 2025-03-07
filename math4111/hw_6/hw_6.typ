#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 6")

= 2.12

$
  K = {1 / n | n in NN} union {0}
$

Show that $K$ is compact.

#proof[
  Suppose ${G_alpha}$ is an open cover of $K$.

  Then $0 in G_(alpha_0)$ for some $alpha_0$ as ${G_alpha}$ must cover $K$.

  We know that $G_alpha_0$ is an open set, so there exists a ball of radius $r$ around 0 such that $B_(r)(0) subset G_alpha_0$.

  Let $1 / m < r$ with $m in NN$. Then $m > 1 / r$. When $n > m, 1 / n < 1 / m < 1 / r$. Hence $1 / n in B_(r)(0)$, which implies that $1 / n in G_alpha_0$.

  Let $G_alpha_i = {(1 / i - epsilon, 1 / i + epsilon)}$ for small $epsilon$.

  Then $K subset G_alpha_0 union union.big_(i = 1)^m G_alpha_i$ covers $K$. So $K$ is compact as we have shown that given any arbitrary cover of $K$, there exists a finite subcover.

  We used the fact that $0 in K$ so show that there must be a neighborhood around 0 that contains other points of $K$, and then just took the union of finitely many open intervals that live "to the right" of our open ball around 0. We know there are finitely many point to the right of our open ball because of the definition of $K$'s construction. We can always split up $K$ into 2 parts, $[0,1/2^n) inter K$ and $[1/2^n, 1] inter K$, and the second of these sets will contain a finite number of points for a fixed $n$.
]

= 2.13

Construct a compact set of $RR$ whose limit points form a countable set.

Our set must be closed and bounded by (Heine-Borel), and then it will be compact automatically.

$
  K = {1 / 2^n | n in NN} union {1 / 2^n + 1 / 2^m | n, m in NN} union {0}
$
The first set contains all of the limit points (except 0, which we add on later) of $K$, and this set is a countable set.

This set is bounded by $-1$ and $2$. $-1$ is less than $1 / 2^n$ for all $n in NN$, so $-1$ is a lower bound. $2$ is greater than $1 / 2^n + 1 / 2^m$ for all $n, m in NN$, as the maximum value each term can take on is $1 / 2$.

Claim:
$
  K' = {1 / 2^n | n in NN} union {0}
$

Fix $n$, then $K_n = {1 / 2^n + 1 / 2^m | m in NN} union {1 / 2^n}$. This has a limit point of $1 / 2^n$ which we include in the set to make it closed.

If we repeat for all $n in NN$, then we a closed set with a countable number of limit points.

Additionally, for a given $n$ these sets are disjoint and have different limit points (which we have added), so taking their union will not add more limit points. (The closure of the closure is the same).

= 2.15

*If we replace with bounded:*

$
  K_n = (0, 1 / n)
$

So we have nested sets: $K_(n+1) subset K_n$.

So the finite intersection $inter.big_(n = 1)^N K_n$ is nonempty the intersection will contain $(0, 1 / N)$ which is nonempty as long as $N$ is finite.

But the infinite intersection is empty. Suppose there exists an $a in inter.big_(n = 1)^infinity K_n$. Then $a$ is in every $K_n$. Take $alpha = floor(1 / a) + 1$. Then $a in.not K_alpha$ as the next index will no longer contain $a$. So the finite intersection is empty.

*If we replace with closed:*

$
  K_n = [n, infinity)
$

So we have nested sets: $K_(n + 1) subset K_n$.

Using the same argument as above, the finite intersection is nonempty.

But the infinite intersection is empty. Suppose there exists an $a in inter.big_(n = 1)^infinity K_n$. Then take $alpha = ceil(a) + 1$. Then $a in.not K_alpha$ as $n$ goes on forever. Hence the infinite intersection is empty.

= 2.16

$
  E = {p in QQ | 2 < p^2 < 3}
$

Show that $E$ is closed and bounded in $QQ$ but not compact.

*Bounded*

$-2$ is a lower bound. $-2 < q$ such that $2 < q^2 < 3$.

$2$ is an upper bound. $2 > q$ such that $2 < q^2 < 3$.

*Closed*

We will show that the "upper" part of this set is closed (all positive values in $E$) as the negative part is identical and it should immedietely follow that if the positive part if closed, then so is the negative part.

Suppose that $y$ is a limit point of $E$, $y in QQ$, $y^2 eq.not 2, y^2 eq.not 3$ (as $y in QQ$).

(Lower bound) Suppose $y^2 < 2$. Let $r = sqrt(2) - y$ and $p in B_(r)(y)$. Note that $r$ is well defined because $r in RR$ and $y in QQ subset RR$.

Then $p < sqrt(2)$, so $p^2 < 2 ==> p in.not E$. Hence $p$ cannot be a limit point of $E$ if $p$ is not in $E$.

(Upper bound) Now suppose that $y^2 > 3$. Let $r = y - sqrt(3)$ and $p in B_(r)(y)$.

Then $p > sqrt(3)$, so $p^2 > 3 ==> p in.not E$. Hence $p$ cannot be a limit point of $E$ if $p$ is not in $E$.

Remark: We can repeat the same steps for the "negative" part of $E$ so show that it too is closed. But it is identical to the "positive" part, so it will be closed (like the positive part is).

*Not compact*

Let $S = {x in QQ | x > 0, x^2 < 3}$. This forms a countable set of rational numbers. Let $S_i$ be the $i$th element of this countable subset of rational numbers (as we can enumerate them because $QQ$ is countable).

Then let $A_i = (0, S_i) inter QQ$.

$
  A = union.big_(i=1)^infinity A_i
$

Let $B = (-sqrt(3), -sqrt(2)) inter QQ$ (to handle the negatives).

Claim: $A union B$ covers $E$ and does not have a finite subcover.

Suppose there does exist a finite subcover, then we just take the maximum index of a rational number in our finite subcover, call it $j$. Then because we can find a rational number between any two real numbers, we can find a point between $S_j$ and $sqrt(2)$ (treating them as real numbers, we can find a rational between them). Hence this set does not have a finite subcover.

This set covers $E$. If we assume that there is an element $a in E, a in.not A$ (assume that it is in the positive part, if in the negative part then we are done). This is impossible because $A$ contains all rational numbers whose square is less than 3, which is a superset of the rational numbers whose square is between 2 and 3. Hence this set covers $E$.


// Let $B_n = (sqrt(2), sqrt(3) - (sqrt(3) - sqrt(2)) / n) inter QQ$. Let $B = union.big_(i = 1)^infinity B_i$.

// Suppose there exists a finite subcover. Then take the maximum index of $B_i$. Call it $n$. The points in the following set are not in the finite subcover.

// $
//   (sqrt(3) - (sqrt(3) - sqrt(2)) / n, sqrt(3)) inter QQ
// $

// We can always find a $q in QQ$ between two real numbers, so we will always miss some points of $E$.

// Hence we have made a set that does not have a finite subcover.

*Open*

Pick a $p in E$.

Let $r = min{sqrt(3) - p, p - sqrt(2)}$.

Claim: $B_(r)(p) subset E$. If we show this, then we have shown that all points of $E$ are interior points, hence $E$ is open.

$
  B_(r)(p) = {x in QQ | d(x, p) < r}
$

Suppose $y in B_(r)(p), y in E^c$. In the case when $r = sqrt(3) - p ==> y^2 > 3$.

$
  |y - p| &< sqrt(3) - p \
  y^2 - 2 p y &< 3 - 2 sqrt(3) p \
  y^2 > 3 ==> quad 3 - 2 p y &< 3 - 2 sqrt(3) p \
  p y &< sqrt(3)p \
  y^2 &< 3 arrow.zigzag
$

But $y^2 > 3$, so our assumption that $y in E^c$ must be wrong. Hence all $y in B_(r)(p)$ are in $E$, so $E$ is open (all points of $E$ are interior points).

We can repeat the same steps to show that in the other case (when $r = p - sqrt(2)$) $y$ cannot be an interior point.

We use the two cases as there are two "sides" that a $x in E$ could be closer to, and we want to make a ball that fits inside of $E$ for any $x$.

= 2.17

$
  E = {x in [0,1] | "decimal expansion only contains" 4, 7}
$

*$E$ is not countable*

$
  x_1 &= 0.&x_(11) &x_(12) &x_(13) &... \
  x_2 &= 0.&x_21 &x_22 &x_23 &... \
  x_3 &= 0.&x_31 &x_32 &x_33 &... \
  dots.v
$

We know that $x_(i i) in {4, 7}$ so we can use the diagonal argument to show that $E$ is not countable.

Let $s = s_1 s_2 ...$ such that

$
  s_i = cases(
    4 &"if" x_(i i) = 7,
    7 &"if" x_(i i) = 4
  )
$

Then $s in [0,1]$, but $s in.not E$. So $E$ is uncountable.

*$E$ is not dense in $[0,1]$*

Let $x in E, x > 0.4$. So all $y in [0, 0.3]$ are not limit points of $E$. Hence $E$ cannot be dense in $[0,1]$ as we have found points in $[0,1]$ which are not limit points of $E$.

*$E$ is compact*

If we can show that $E$ is closed and bounded, then we have shown that $E$ is compact. $E$ is bounded as $1$ is an upper bound and $0$ is a lower bound. $1 > 0.7777...$ and $0 < 0.4444...$.

Now we show that $E$ is closed. We will show that $E^c$ is open.

Suppose $y in E^c$. Then eventually a digit of the decimal expansion of $y$ will contain a 4 or 7 (otherwise, $y$ would be in $E$). Call this index $i$.

Let $epsilon = 10^(-(i + 1))$. Then $B_(epsilon)(y) subset E^c$ because we are making the neighborhood smaller than the distance from $y$ to any other point of $E$. So this ball is entirely contained withing $E^c$.

Hence $E$ is compact as $E^c$ is compact.


*$E$ is perfect*

Must show that all points of $E$ are limit points.

Let $x in E$. $x = 0.x_1 x_2 x_3 ...$, $x_i in {4, 7}$. We must show that all neighborhoods of $x$ contain another point which has a decimal expansion only containing ${4, 7}$.

Let $epsilon$ be the radius of the ball around $x$. Then let $epsilon < 10^(-n)$ for some $n$.

(1) If $x_(n+1) = 4$, take $q = 0.x_1 x_2 ... x_n 7 x_(n+2) ...$. In this case, $q - x = 3 dot 10^(-(n+1)) < 10^(-n)$. \
(2) If $x_(n+1) = 7$, take $q = 0.x_1 x_2 ... x_n 4 x_(n+2) ...$. In this case, $x - q = 3 dot 10^(-(n+1)) < 10^(-n)$.

So in both cases, we can find another point inside the ball for any arbitrary radius. So all points of $E$ are limit points. We know $E$ is closed, so $E$ is perfect.


= 2.23

Show any separable metric space $X$ has a countable base.

$X$ is separable, so $X$ has a countable dense subset. Call it $E = {x_1, x_2, ...}$, with $x_i in E$.

Consider $B_(q)(x_i) = {y | d(y, x_i) < q}$ where $q in QQ$. These are neighborhoods with rational radius.

The collection ${B_(q)(x_i)}$ for all $1 <= i < infinity, q in QQ$ is countable. Now we show that it is also a base for $X$.

Let $G subset X$ be an open subset of $X$, and $x in G$. Then there exists an $r > 0$ such that $B_(r)(x) subset G$ as $x$ is an interior point of $G$ ($G$ is an open set, so all points in $G$ are interior points).

$E$ is dense in $X$, so there exists $x_i in E$ such that $d(x_i, x) < r / 4$.

Let $q in QQ$ satisfying $r / 4 < q < r / 2$.

Claim: $x in B_(q)(x_i) subset B_(r)(x) subset G$ for some $i$.

We know that $d(x_i, x) < r / 4 < q ==> x in B_(q)(x_i)$.

Let $y in B_(q)(x_i)$. Then by the triangle inequality:

$
  d(y, x) &<= d(y, x_i) + d(x_i, x) \
  &< q + r / 4 \
  &< r / 2 + r / 2 = r
$

So $d(y, x) < r$, hence $y in B_(r)(x)$. We have shown that for any $x in G subset X$, $x$ is in some ball of rational radius centered at one of the points of countable dense subset of $X$.

= 2.25

Show every compact metric space $K$ has a countable base, which implies that $K$ is separable.

For all $n in NN, K = union.big_(p in K) B_(1 / n)(p)$. $K$ is compact, and ${B_(1 / n)(p)}_(p in K)$ covers $K$, so there exists a finite subcover of this set that still covers $K$.

Let

$
  A = {B_(1 / n)(p_i^n) | n in NN, 1 <= 1 <= r_n}
$

where we need $r_n$ balls for a given radius $1 / n$. We know that we only need a finite number of balls for a given radius to cover $K$.

Claim: $A$ is a countable base of $K$.

Let $G subset X$ be an open set and $x in G$. Then there exists $r > 0$ such that $B_(r)(x) subset G$ (as $x$ is an interior point of $G$).

Fix $1 / n < r / 2$. Since $x in K$, $x$ is in some $B_(1 / n)(p_i^n)$ for some $i = 1, ..., r_n$ (and $n$ is finite as we only need a finite number of balls for a given radius to cover $K$).

Claim: $B_(1/n)(p_i^n) subset B_(r)(x)$.

Let $y in B_(1/n)(p_i^n)$. Then (by the triangle inequality)

$
  d(y, x) &<= d(y, p_i^n) + d(p_i^n, x) \
  &< 1 / n + 1 / n \
  &< r / 2 + r / 2 = r
$

Hence $y in B_(r)(x)$.

So $x in B_(1 / n)(p_i^n) subset G$ for any $x in G$. In other words, given an $x in G$, $x$ lives in one of the balls centered at one of the finite points for a given radius size $1 / n$.

Now we show that $K$ is separable.

Let $A_n = {p_1^n, p_2^n, ..., p^n_r_n}$ and $E = union.big_(n=1)^infinity A_n$. Now $E subset K$, and $E$ is countable and dense. Hence any compact metric space $K$ has a countable base and we can always find a countable dense subset of $K$, so $K$ is separable.
