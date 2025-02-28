#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 5")


= 2.6

==

$
  E' = {"limit points of E"}
$

Show that $E'$ is closed.

Closed means that every limit point of $E'$ is a point of $E'$.

We can show that $(E')^c$ is open.

// We want to show that $E'' subset E'$.

// #proof[
//   Let $x in E''$. Then for any $r > 0$, $B_(r)(x)$ contains a $y in B_(r)(x)$ such that $y eq.not x$. Then $y in E'$ as $x$ is a limit point of $E'$ (from the definition of limit points, there must be at least one $y$ in all $r > 0$).

//   $y$ is an interior point of $B_(r)(x)$ as $B_(r)(x)$ is open. So there exists $B_(r_1)(y) subset B_(r)(x)$ as $y$ is an interior point of $B_(r)(x)$.

//   $y in E'$ and $B_(r_1)(y)$ is a neighborhood of $y$, which implies that $exists z in B_(r_1)(y), z eq.not y ==> z in B_(r_1)(y) subset B_(r)(x) ==> z in B_(r)(y) sect E$.

//   The fact that there exists $z in B_(r_1)(y) sect E$ for all $B_(r)(x)$ means that $x in E' forall x in E''$. Hence $E'' subset E' ==> E'$ is closed.
// ]

#proof[
  For all $p in (E')^c$, there exists an $r>0$ such that for all $q in B_(r)(p), q in.not E$ (with $q eq.not p$).

  Assume that $q in E'$, with $d(p,q) = epsilon$. Then $B_((r - epsilon) / 2)(q) subset B_(r)(p)$, so we have found a ball that avoids $E$. Hence $q$ is not a limit point of $E$, so $q in.not E'$.

  Hence every point of $(E')^c$ is an interior point, so $(E')^c$ is an open set.
]

// TODO, check black board.

==

Show that $E$ and $overline(E)$ have the same limit points. $overline(E) = E union E'$.

#proof[
  $(==>, E' subset (overline(E))')$ We know that $E subset overline(E)$. Because of this, any limit point of $E$ is a limit point of $overline(E)$. Hence $E' subset (overline(E))'$.

  $(<==, (overline(E))' subset E')$

  We know that for all $p in (overline(E))'$, for all $r>0$ there exists $q in B_(r)$ with $q in overline(E)$ (with $p eq.not q$). Therefore $q in E$ or $q in E'$.

  Assume for all $x in B_(r)(p), x in.not E$. Let $d(p,q) = epsilon$. Consider $B_((r - epsilon) / 2)(q) subset B_(r)(p)$. So for all $a in B_((r - epsilon) / 2)(q), a in.not E$. So $q in.not E' arrow.zigzag$. We assumed for all $x in B_(r)(p), x in.not E$, so our assumption must be wrong. So then $q in.not E$. So $q in E'$, which implies that for any neighborhood around any point in $(overline(E))'$, there is another point that is inside of $E$. Hence $(overline(E))'$ is a subset of $E'$.
]

==

Do $E$ and $E'$ always have the same limit points?

In $(RR, d)$.

Let $E = {1 / n | n in NN}$. Then $E' = {0}$ and $E'' = emptyset$. So not true.


= 2.7

$A_1, A_2, ..., A_n$ are subset of a metric space.

==

If $B_n = union.big_(i=1)^n A_i$, show that $overline(B_n) = union.big_(i=1)^n overline(A_i)$.

#proof[
  $(<==)$ Suppose $y in union.big_(i=1)^n overline(A_i)$. Then $y in overline(A_i)$ for some $1 <= i <= n$. So $y in A_i union A'_i'$ for some $i$.

  - If $y in A_i$, then $y in B_n$ by the given, so $y in overline(B_n)$.
  - If $y in A'_i$, then $y$ is a limit point of $A_i$. $A_i subset B_n$, which implies that $y$ is a limit point of $B_n ==> y in overline(B_n)$.

  $(==>)$ Suppose $y in overline(B_n) = B_n union B'_n$, then $y in B_n$ or $y in B'_n$.

  - If $y in B_n$ then $y in A_i$ for some $i$. This implies that $y in union.big_(i=1)^n A_i ==> y in union.big_(i=1)^n overline(A_i)$.
  - If $y in B'_n$ then $y$ is a limit point of $B_n$. Because $y$ is a limit point of $B_n$, for all $r > 0$ $N_(r)(y)$ contains a point $x in B_n$ with $x eq.not y$. Because $x in B_n$, there exists an $i$ such that $x in A_i$. Note that is only works for finite $i$ as if we have an infinite union, then we might not be able to pick out a specific $A_i$ that $x$ is a part of (see (c)). Because we can find this $x$ for any neighborhood of $y in A_i$, $y in A'_i$. Hence $y in overline(A_i)$, which means that $y$ is in the RHS of the problem.

    // So $x in union.big_(i=1)^n A_i ==> x in union.big_(i=1)^n overline(A_i)$ as $A_i subset overline(A_i)$ and $y$ is a limit point of $union.big_(i=1)^n overline(A_i)$.

    // TODO! Look at the board!

    // $union.big_(i=1)^n overline(A_i)$ is closed (finite union of closed sets) so it contains its limits points. Hence $y in union.big_(i=1)^n overline(A_i)$.
]

==

If $B = union.big_(i=1)^infinity A_i$, show $overline(B) supset union.big_(i=1)^infinity overline(A_i)$.

#proof[
  Suppose $x in union.big_(i=1)^infinity$. Then $x in overline(A_i) = A_i + A'_i$ for some $i$.

  - If $x in A_i$, then $x in B$ by given. So $x in overline(B)$ as $B subset overline(B)$.
  - If $x in A'_i$, then $x$ is a limit point of $A_i$. $A_i subset B ==> x$ is a limit point of $B ==> x in overline(B)$.
]

==

Example:

$
  A_i &= {1 / i} \
  B &= union.big_(i = 1)^infinity A_i = {1 , 1 / 2, 1 / 3, ...}
$

So $0 in overline(B)$.

$overline(A_i) = A_i$ as they consist of a single point. So $0 in.not union.big_(i=1)^infinity overline(A_i)$ as $0$ is not in any $A_i$, but $0 in overline(B)$.

= 2.9

$
  E degree = {"interior points of" E}
$

==

Show $E degree$ is always open.

#proof[
  For all $x in E degree$, there exists $r > 0$ such that $N_(r)(x) subset E$. This is because for all $N_(r)(x)$, we can pick a $q in N_(r)(x) ==> exists N_(r_1)(q) subset N_(r)(x) subset E$. This is because there exists a neighborhood around $q$ if we make $r_1$ smaller than $(r- epsilon) / (2)$, where $epsilon = d(p,q)$. Hence any point in $N_(r)(x) in E degree$, which implies that $N_(r)(x) subset E degree$.

  Because we can always find a neighborhood around any $x in E degree$ that is a subset of $E degree$, we have shown that $E degree$ is an open set.
]




==

Show that $E$ open $<==> E degree = E$

#proof[
  $(==>)$ Assume that $E$ is open. So for all $x in E$, $x$ is an interior point. So $E = {"interior point of" E} = E degree$.

  $(<==)$ Assume $E degree = E$. Then $E = {"interior points of" E}$. We know that $E degree$ is open, which implies that $E$ must be open.
]

==

Show that if $G subset E$ and $G$ is open, then $G subset E degree$.

#proof[
  Because $G$ is open, $G = G degree$. For all $g in G$, there exists $r > 0$ such that $B_(r)(g) subset G subset E$. Hence every $g$ is an interior point of $E$. Hence $G subset E degree$.
]

==

Show that $(E degree)^c = overline(E^c)$.

#proof[
  $(==>)$ Suppose $y in (E degree)^c$. So $y$ is not an interior point of $E$. So irregardless of how small we make our neighborhood of $y$, it will always contain a least one $x in E^c$. So we have 2 options for $y$:
  - if $y in E^c$, then we are done (as $E^c subset overline(E^c)$)
  - if $y in.not E^c$, then $y$ must be a limit point of $E^c$ as all neighborhoods of $y$ must contains at least one point of $E^c$, or else $y$ would be an interior point of $E$. Hence $y in (E^c)' subset overline(E^c)$.

  $(<==)$ Suppose $y in overline(E^c)$. Then $y in E^c$ or $y in (E^c)'$.
  - If $y in E^c$, then $y$ cannot be an interior point of $E$ so $y in (E degree)^c$.
  - If $y in (E^c)'$, then $y$ is a limit point of $E^c$. This means that all neighborhoods of $y$ contain another (distinct) point $q in E^c$. Because all neighborhoods always contains another point in $E^c$, $y$ cannot be an interior point of $E$. Hence $y in (E degree)^c$.
]

==

Do $E$ and $overline(E)$ have the same interiors?

Let us be in $RR$.

Let $E = {x | x in QQ, 0 < x < 1}$.

$E degree = emptyset$ as any neighborhood $r > 0$ contains points of $RR$ not in $QQ$.

$overline(E) = (0,1)$ as $QQ$ dense in $RR$.

$(overline(E))degree = (0,1) eq.not emptyset$. Hence $E$ and $overline(E)$ do not necessarily have the same interiors.

==

Do $E$ and $E degree$ have the same closures?

Let us be in $RR$.

Let $E = {x | x in QQ, 0 < x < 1}$. Then $overline(E) = [0,1]$.

But $E degree = emptyset$ as we are in $RR$ and any neighborhood of any point in $E$ cannot be a subset of $E$ as it will contain another point in $RR$ that is not in $QQ$ (it will contain an _irrational_ number). Hence $overline(E degree) = emptyset$.

So no as $overline(E) eq.not overline(E degree)$.

= 2.10

$X$ is an infinite set. $p, q in X$

$
  d(p,q) = cases(
    1 &"if" p eq.not q,
    0 &"if" p = q
  )
$

==

Show this is a metric.

(a) $d(p,q) = 0 ==> p = q$. $d(p,q) = 1 > 0$ otherwise.

(b) $d(p,q) = d(q,p)$ by definition of metric.

(c) $r, p, q in X$

We need $d(r,q) <= d(r,p) + d(p,q)$ to hold for all $p, q, r$.

Case 1: $r = p = q$. Then all terms are 0 so it holds.

Case 2: $r eq.not p, r = q ==> 0 <= 1 + 1$.

Case 3: $r = p, r eq.not q ==> 1 <= 0 + 1$.

==

Let $E subset X$.

For all $x in E, B_(r < 1)(x) = {x} subset E$ as $x in E$. So all nonempty subsets of $X$ are open.

==

We know that all nonempty subsets of $X$ are open, so if $E subset X$, then $E^c$ is open as $E^c$ is a nonempty subset of $X$. So $(E^c)^c = E$ is closed. If $E = emptyset$, then $E$ is closed. So all subsets of $X$ are closed.

==

All finite subsets of $X$ are compact as we just need to select all points in the subset as the finite subcover.

Let $A subset X$, with $A$ infinite.

Suppose $0 < r < 1$, then $union.big_(p in A) B_(r)(p)$ is a cover of $A$. But it cannot be a finite subcover as $B_(r)(p)$ only contains one point of $A$. If there exists a finite subcover, then $A$ must be finite $arrow.zigzag$. So there does not exist a finite subcover of $A$ is $A$ is infinite.

= 2.14

Construct open cover of $(0,1)$ which has no finite subcover.

// $
//   A &= {(1 / (a + 1), 1 / a) | a in NN} = {(1 / 2,1), (1 / 3, 1 / 2), ...} \
//   B &= {1 / (n+1) | n in NN} = {1 / 2, 1 / 3, 1 / 4, ...} \
//   K &= A union B
// $

// $K$ is an open set of $(0,1)$ which has no finite subcover. There are an infinite number of disjoins sets which (only when put together) will fully cover $(0,1)$.

// TODO, prove there is no finite subcover!

Let $G_i = (1 / i, 1)$. This covers $(0,1)$ if we have union of $G_i$ for $2 <= i < infinity$. The sets are nested, meaning that the outermost set will approach containing (with $i -> infinity$) $(0,1)$.

If we have a finite subcover, then we just take the max index of our subcover. Call the max index $m$. Then we have missed all points between $(0, 1 / m)$ so any finite subcover will not cover $(0,1)$.

= 2.22

$
  QQ^k = {(a_1, a_2, ..., a_k) | a_1, a_2, ..., a_k in QQ}
$

We know that $QQ^k subset RR^k$ and that $QQ^k$ is countable.

$QQ^k$ is countable because it is the cartesian product of countable sets, so it must be countable.

Now we must show that $QQ^k$ is dense in $RR^k$.

Let $x in RR^k, x in.not QQ^k$ (denote the components of $x$ by $x_1, x_2, ...$).

We know that $QQ$ is dense in $RR$, so $exists y_i in QQ$ such that $abs(x_i - y_i) < r / sqrt(k)$ for any $r > 0$.

$
  (x_i - y_i)^2 < r^2 / k
$

$
  abs(x - y) = sqrt(sum_(i=1)^k (x_i - y_i)^2) < sqrt(sum_(i=1)^k r^2 / k) = r
$

For all $r > 0$. Hence $QQ^k$ is dense in $RR^k$.

Because $QQ^k$ is countable and is dense in $RR^k$, we have shown that $RR^k$ is separable.
