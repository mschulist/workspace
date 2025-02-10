#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 3")

= 1.12

We want to show that

$
  |r_1 + r_2 + ... + r_n| <= |r_1| + |r_2| + ... + |r_n|
$ <1.12-problem>

#proof[
  We can use induction on $n$ to show this is true regardless of the number of terms in our sum.

  When $n=1$, this is trivially true as $|r_1| <= |r_1|$.

  Suppose @1.12-problem holds when $n = k$. If $n = k + 1$ then:
  $
    |r_1 + r_2 + ... + r_k + r_(k+1)| <= |r_1 + r_2 + ... + r_k| + |r_(k+1)|
  $
  by the triangle inequality.

  We can break up the RHS further using the inductive hypothesis:
  $
    |r_1 + r_2 + ... + r_k| + |r_(k+1)| <= |r_1| + |r_2| + ... + |r_k| + |r_(k+1)|
  $
  This above equation is essentially the inductive hypothesis plus a constant positive term, so the above inequality holds for any value of $n$.
]

= 1.13

For $x, y in RR$, show that $||x| - |y|| <= |x - y|$.

#proof[
  We can start with the LHS and square it. We know that abs always returns a positive value, so we do not need to worry about square rooting and squaring negative values.
  $
    ||x| - |y||^2 &= x^2 + y^2 - 2|x||y|
  $ <1.13-lhs-sq>

  And now do the same to the RHS.
  $
    |x - y|^2 &= x^2 + y^2 - 2 x y
  $ <1.13-rhs-sq>

  We can observe that $2|x||y| >= 2 x y$. Hence $-2|x||y| <= -2 x y$. We can add $x^2 + y^2$ to both sides:
  $
    x^2 + y^2 - 2|x||y| <= x^2 + y^2 - 2x y
  $
  From @1.13-lhs-sq and @1.13-rhs-sq we can see
  $
    ||x| - |y||^2 &<= |x - y|^2 \
    ==> quad ||x| - |y|| &<= |x - y|
  $

  We can take this last square root because both elements inside of it have absolute value signs, meaning they must be positive.
]


= 1.15

When does equality hold for the Cauchy-Schwartz inequality?

$
  abs(sum_(i=1)^n a_i b_i)^2 <= sum_(i=1)^n abs(a_i)^2 dot sum_(i=1)^n abs(b_i)^2
$ <cs-ineq>

If we treat $arrow(a)$ and $arrow(b)$ as vectors in $RR^n$, the equality holds if $arrow(a) = lambda arrow(b)$ for some $lambda in RR$. In other words, if they are scalar multiples of each other then equality holds in @cs-ineq.

Looking at each component, this means that $a_i = lambda b_i$ for all $i in {1,...,n}$.

The LHS of @cs-ineq becomes:
$
  abs(sum_(i=0)^n lambda a_i^2)^2 &= lambda^2 (sum_(i=0)^n a_i^2)^2
$ <1.15-lhs>

And the RHS of @cs-ineq:
$
  sum_(i=1)^n a_i^2 dot sum_(i=1)^n lambda^2 a_i^2 &= lambda^2 (sum_(i=1)^n a_i^2)^2
$ <1.15-rhs>

Hence we can see that @1.15-lhs and @1.15-rhs are equal, so equality holds when $a_i = lambda b_i$.

If all of the $b_i = 0$ or all of the $a_i = 0$, then we trivially get equality as $0 = 0$.

= 1.16

$
  k>= 3 quad x, y in RR^k quad |x - y| = d > 0 quad r > 0
$

Intuitively, we can think of this problem as 2 (hyper) spheres of radius $r$ that may or may not intersect (as determined by the constraints of $r$). If the 2 spheres intersect at more than one (infinite) points, then there are $infinity$ solutions to $z$. If they intersect at a single point (the midpoint of the spheres), then there is a single solution for $z$. If they do not intersect at all, then there are no solutions to $z$.

==

We can think about the possible values for $z$ with a _cartoon picture_ for the case when $2r > d ==> r > d / 2$.

#figure(
  image("1.16-cartoon.png", width: 60%),
  caption: [Cartoon picture of all of the possible $z$ vectors with a fixed $r$ in $RR^3$],
) <1.16-cartoon>

Because $r > d / 2$, we know that all of the possible vectors $z$ will not lie on the #text([purple], fill: purple) vector in @1.16-cartoon. We can generalize to higher dimensions below.

We know that in $RR^k$, $k >= 3$ there are an infinite number of vectors orthogonal to any other vector. Let us write this orthogonal vector as $v$. Then:

$
  v dot (x - y) = 0
$

has infinite solutions to $v$.

Let us define $z = m + delta v$ where $m$ is the midpoint between $x$ and $y$ $((x + y) / 2)$ and $delta = sqrt(r^2 - d^2/4)$. $delta$ is found using the Pythagorean Theorem, where $r$ is the distance from $z$ to $x, y$ and $d = |x - y|$.

Now we can define $z = m + delta v$. We know that $z$ is equidistant from $x$ and $y$ by definition of $m$ and $v$. $m$ is the midpoint and $v$ is orthogonal to $v$, so adding them will retain the equal distance between $z$ and $x,y$.

Examining $delta$ we can see that when $r > d / 2$, we get a positive value for $delta$ meaning that there are infinite solutions to $z$. This is because there are infinite solutions to our vector $v$, and our definition of $z$ will have infinite solutions if the coefficient in front of $v$ ($delta$ in this case) is nonzero (which it is in this case, as we showed above).

Hence, $z$ has infinite solutions when $r > d / 2$. 

==

When $r = d / 2$, then the only possible $z$ vector is the one that lies on the #text([purple], fill: purple) vector in @1.16-cartoon, half way between the tip of the red and blue vectors (because of the constraint that $|z - x| = |z - y|$). Any other point would either not be equidistant from $x$ and $y$ or have a $r > d / 2$.

Generalizing to higher dimensions, we know that $|x - y| = d$ so there must exist a unique midpoint $z$ such that $|x - z| = d / 2 = r$ and $|x - y| = d / 2 = r$. The triangle inequality only holds when the triange made by $x, y, z$ as vertices is degenerate. So $z$ must live on the line segment connecting $x$ and $y$ and must be equidistant from $x$ and $y$, hence $z$ is unique (as the midpoint between $x$ and $y$).

==

When $r < d / 2$, it is clear that no $z$ can satisfy the constraints of the problem. The distance between $x$ and $y$ is $d$, so if $2 r < d$ then $z$ would have nowhere to lie.

We know that the $x, y, z$ form a triangle in $RR^n$, so hence the lenghts of the 3 sides must satisfy the triangle inequality.

$
  d = |x - y| &<= |x - z| + |y - z| < d / 2 + d / 2 \
  ==> d &< d
$

Which is a contradiction, so the three sides cannot form a triangle and hence there is no possible value for $z$ that works with $r < d / 2$.

= 1.18

$
  k >= 2 quad x in RR^k
$
We need to show that there exists $y in RR^k$ with $y eq.not 0$ such that $x dot y = 0$.

#proof[
  We need to prove that we can always find an orthogonal vector to $x$ in $RR^k, k >= 2$.

  If $x = 0$, then $y dot x = 0$ for any $y in RR^k$.

  If $x eq.not 0$ but at least a single component of $x$ is zero (say, the $j$th component), then we set all components in $y$ to be zero except for the $j$th component which we set to any nonzero value.

  If $x eq.not 0$ and all components of $x$ are nonzero, then we cook up $y$ according to the following rules:
  $
    y = vec(-x_2, x_1, 0, ..., 0)
  $

  We know that $x dot y = 0$ in this case because we are essentially doing the following computation:
  $
    - x_1 dot x_2 + x_2 dot x_1 = 0
  $
  And we know that all of the $x_i eq.not 0$ because we have already handled that case above (this is, the case where one of the $x_i = 0$ is handled above).
]

This is not true when $k = 1$ because in $RR^1$, there is no nonzero  "vector" that, when multiplied by any other vector, gives us zero. For example, $1 dot x eq.not 0$ if $x eq.not 0$. 


= 1.20

Property 3 of cut: If $p in alpha$, then $p < r$ for some $r in alpha$.

We will remove this requirement of a cut and see what it does to \
(1) LUB property (this should still hold) \
(2) Satisfies (A1-4) of addition axioms, but fails (A5).

We will refer to this new set without property 3 of cuts as $R$.

(1)

Let $A$ be a nonempty subset of $R$ bounded above by $beta in R$.

$
  gamma = union.big_(alpha in A) alpha
$

Claim: $gamma in R = sup A$.

We first need to show that $gamma$ is a cut.

1. $A$ is nonempty, so there exists $alpha_0 in A$. $alpha_0$ is a cut so $alpha_0 eq.not emptyset$. So there exists $p in QQ$ such that $p in alpha_0$. Then $p in gamma$. So $gamma eq.not emptyset$. $beta$ is a cut, so $beta eq.not QQ$. So there exists $q in QQ$ such that $q in.not beta$. Since $beta$ is an upper bound of $A$, then for all $alpha in A$, $alpha <= beta <==> alpha subset beta$. Hence $q in.not alpha forall alpha in A ==> q in.not gamma$. Hence $gamma eq.not QQ$.
2. Choose $p in gamma$ then $p in alpha$ for some $alpha in A$. Since $alpha$ is a cut, then any $q < p$ is in $alpha$. Then all $q in QQ$ such that $q < p$ are elements of $gamma$.

Now we can show that $gamma = sup A$.

Claim: $gamma <= alpha forall alpha in A$.

$gamma subset alpha$ is true by the definition of $gamma$ as a union of all $alpha in A$.

Claim: If $s < gamma$ then $delta$ is not an upper bound of $A$.

Since $delta < gamma$, then there exists $s in gamma$ such that $s in.not delta$. But since $gamma = union.big_(alpha in A) alpha$, then $s in alpha_0$ for some $alpha_0 in A$. Hence $alpha_0 > delta$ then $delta$ is not an upper bound of $A$. Hence $gamma$ is the least upper bound of $A$.

(2)

(A1) $x, y in R ==> x + y in R$

We need to show that is $alpha, beta in R$, then $alpha + beta in R$. Being in $R$ means that $alpha + beta$ is a cut.

1. It is clear that $alpha + beta subset Q, alpha + beta eq.not emptyset$. Take $r' in.not alpha, s' in.not beta$. Then $r' + s' > r + s$ for all $r in alpha, s in beta$. Hence $r' + s' in.not alpha + beta$ so $alpha + beta eq.not QQ$ (which is a requirement of property 1 of cut).
2. Pick $p in alpha + beta <==> p = r + s$ for some $r in alpha, s in beta$. If $q < p$ then $q < r + s ==> q - s < r ==> q - s in alpha$. But $q = underbrace((q - s), in alpha) + underbrace(s, in beta) ==> q in alpha + beta$.

(A2) $x, y in R ==> x + y = y + x$

WTS: $alpha + beta = beta + alpha$

Since any element in $alpha + beta$ is of the form $r + s$ (due to the definition of addition of cuts), $underbrace(r, beta) + underbrace(s, in alpha) = s + r$.

(A3) $x, y, z in R ==> (x + y) + z = x + (y + z)$

WTS: $(alpha + beta) + gamma = alpha + (beta + gamma)$

Using the same logic as above, we know that $alpha + beta$ can be written in the form $r + s$, so $(alpha + beta) + gamma$ can be written as $(s + r) + p = s + (r + p)$, where $s in alpha, r in beta, p in gamma$. We know addition on $QQ$ is associative, so we can clearly see that addition on $R$ is also associative.

(A4) There exists a $0 in R$ such that $0 + x = x forall x in R$.

We can define the zero element as ${p | p in QQ, p <= 0}$. This is different from the "normal" definition of the zero element as now we need to include $0 in QQ$ in the set (where "the set" refers to $0 in R$).

We can see that $0 + alpha$ where $0, alpha in R$ is equal to zero for any $alpha in R$.

To show the first inclusion: If $r in alpha$ and $s in 0$, then $r + s <= r$. Hence $alpha + 0 subset alpha$.

Now the second inclusion: Pick $r, p in alpha$ with $r > p$. Then $p - r in 0$ and $p = r + (p - r) in alpha + 0$. Hence $alpha subset alpha + 0$.

Hence $alpha + 0 = alpha$.

(A5) If $x eq.not 0, exists! -x in R$ such that $x + (-x) = 0$

We want to show that this is FALSE without the third property of cuts.

Because we do not have the third property of cuts, the following set is in $R$.

$
  alpha = {p | p in QQ, p <= 2} in R
$

The definition of $-alpha$ yields:

$
  -alpha = {p | exists r > 0, -p-r in.not alpha}
$

We can also think about $-alpha$ as $-alpha = {t | t in QQ, t < -2}$. We can see that $alpha + (-alpha)$ does not include $0 in QQ$, but $0 in QQ$ is an element of the cut corresponding to zero. Hence, this property does not hold.

If we were to change the definition of $-alpha$ to:

$
  -alpha = {p | exists r>=0, -p-r in.not alpha}
$

we would still run into the same problem with $alpha - alpha eq.not 0$. Because now we are allowed to both have set with and without maximum elements but we still need to have a single zero element, we conclude it is impossible to satisfy (A5).

// If we were to change the definition of what a negative number is to allow $-alpha$ to have a maximum element, we would still run into trouble as some of the negative elements would not have a maximum element and others would (like "$-sqrt(2)$" cannot have a maximum element).
