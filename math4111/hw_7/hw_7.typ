#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 7")

= 2.19

==

If $A$ and $B$ are disjoint closed sets in some metric space $X$, show they are separated.

#proof[
  If $A$ and $B$ are closed, then $A = overline(A)$ and $B = overline(B)$. We know that $A inter B = emptyset$, so $A inter overline(B) = emptyset$ and $overline(A) inter B = emptyset$. Hence they are separated.
]

==

Show the same for disjoint open sets.

#proof[
  Suppose $A$ and $B$ are open disjoint sets and $A inter overline(B) = emptyset$ WLOG.

  Suppose there is an $x in A inter overline(B)$, and suppose $x in B'$ and $x in A$.

  This means that there exists a neighborhood of $x$ where there be a least one (not equal to $x$) point in $B$ (as $x$ is a limit point of $B$) and all points of the neighborhood are in $A$. But this is a contradiction as $A$ and $B$ are disjoint.

  Hence there cannot be an $x in A inter overline(B)$, so $A inter overline(B) = emptyset$. We can repeat the same for $overline(A) inter B$ to show it must also be empty.

  So $A$ and $B$ are separated.
]

==

#proof[
  $A$ is clearly open as it is an open ball of radius $delta$.

  $B$ is the complement of $overline(A)$, so $B$ is open.

  Since $A$ and $B$ are open disjoint sets, by (b) they are separated.
]

==

TODO!

= 2.20

Are closures and interiors of connected sets always separated?

*Interiors*

Let $A = {p in RR^2 | d(p, (0,0)) < 1}$.

Let $B = {p in RR^2 | d(p, (2, 0)) <= 1}$.

Let $S = A union B$. $S$ is the union of a open ball and a closed ball that are disjoint.

$S$ is connected because $S$ is cannot be made of the union of 2 nonempty separated sets. Regardless of how we choose to split $S$, the 2 sets will never be separated as the closure of one of them will contain some points in the other.

But now if we consider $A degree$ and $B degree$, we see that $A degree union B degree$ are separated sets as they are disjoint open sets. So the interiors of connected sets is not always separated (as the interiors "lose" points).


*Closures*

Yes, but show why!

= 2.21

$A, B$ separated sets in $RR^k$, $a in A, b in B$

$
  p(t) = (1 - t) a + t b
$
for $t in RR$.

$A_0 = p^(-1)(A), B_0 = p^(-1)(B)$

==

Show $A_0$ and $B_0$ are separated.

#proof[
  Suppose WLOG that $t in A_0$ and $t in overline(B_0)$.

  This means that $p(t) in A$ and $p(t) in overline(B)$, but $A union overline(B) = emptyset$ as $A$ and $B$ are separated.
]

==

Show there exists $t_0 in (0,1)$ such that $p(t_0) in.not A union B$.

#proof[
  Suppose there does not exist a $t_0 in (0,1)$ such that $p(t_0) in.not A union B$.

  So suppose for all $t in [0,1], t in A_0 union B_0$. This implies that $A_0 union B_0 = [0,1]$, but $[0,1]$ is connected and $A_0$ and $B_0$ are separated $arrow.zigzag$.
]

==

Show that every convex subset of $RR^k$ is connected.

A convex subset $E subset RR^k$ means that for any $p, q in E$, the line that connects $p$ and $q$ only goes through $E$.

If we apply (a), we can see that TODO!

= 2.24

Let $X$ be a metric space where every infinite subset has a limit point. Show that $X$ is separable.

#proof[
  Fix $delta > 0$, and pick $x_1 in X$. Having chosen $x_1, ..., x_j in X$, choose $x_(j_1) in X$ such that $d(x_i, x_(j+1)) >= delta$ for $1 <= i <= j$.

  But this process must stop after a finite number of steps. Here is why:

  Let $a, b in X$.

  Let $delta < d(a, b)$ such that for all $p in X, d(a, p) eq.not delta$. This only fails if all $delta in [0, d(a, b)]$ correspond to a point such that $delta = d(a, p)$.

  But we can only have a TODO!
]


= 2.26

Let $X$ be a metric space where every infinite subset has a limit point. Show that $X$ is compact.

$
  K = {B_(1 / n)(p_i^n) | n in NN, 1 <= i <= r_n}
$

where for $delta = 1 / n$, we only need $r_n$ balls of radius $delta$ to cover $X$.

$X$ has a limit point so it is bounded.

// Given an open set $S subset X$, where $x in S$, there exists an $r > 0$ such that $B_(r)(x) subset S$.

Let ${G_alpha}$ be an arbitrary open cover of $X$.

Let $x in G_alpha_0$ for some $alpha_0$ ($x$ is in some $G_alpha$).

TODO!

= 3.1

Show that if ${s_n}$ converges, then ${|s_n|}$ also converges.

#proof[
  If ${s_n}$ converges, then given an $epsilon > 0$ there exists $N$ such that if $n > N, d(s_n, s) < epsilon$.

  We can see that ${|s_n|}$ converges to $|s|$. Also see that $abs(|s_n| - |s|) <= |s_n - s| < epsilon$, which implies that $abs(|s_n| - |s|) < epsilon$.
]

The converse is false. Let $p_n = (-1)^n$.

${|p_n|} = 1, 1, 1, ...$ which converges to 1.

But ${p_n} = -1, 1, -1, ...$ which does not converge.


= 3.2

= 3.3

$
  s_1 &= sqrt(2) \
  s_(n+1) &= sqrt(2 + sqrt(s_n))
$

Show that ${s_n}$ converges and is less than 2 for all $n$.

We can show that $s_(n+1) < s_n$ by induction.

$s_2 = sqrt(2 + sqrt(2)) > sqrt(2)$ so base case works.

Assume $s_(k+1) > s_k$ when $n = k$. Let $k = n + 1$.

$
  s_(k+2) - s_(k+1) &= sqrt(2 + sqrt(s_(k+1))) - sqrt(2 - sqrt(s_k)) \
  "inductive hyp" ==> quad s_(k+2) - s_(k+1) &> 0 \
  s_(k+2) &> s_(k+1)
$

Hence $s_(n+1) > s_n$ for all $n$.

Now we can show that $s_n < 2$ for all $n$, which will imply that ${s_n}$ converges as any bounded increasing sequence in $RR$ converges.

$s_1 = sqrt(2) < 2$ so the base case works.

Assume $s_(k+1) < 2$ with $n = k$.

$
  sqrt(2 + sqrt(s_k)) &< 2 \
  2 + sqrt(2 + sqrt(s_k)) &< 4 \
  sqrt(2 + sqrt(2 + sqrt(s_k))) &< 2 \
  sqrt(2 + sqrt(s_(k+1))) &< 2
$

We know that $sqrt(s_(k+1)) < s_(k+1)$, so we can see that $sqrt(2 + sqrt(s_(k+1))) < sqrt(2 + s_(k+1)) < 2$.

So hence $s_(k+2) < 2$, which implies that $s_n < 2$ for all $n$.

Now we know that ${s_n}$ is bounded above by 2 and is increasing, so it must converge.

