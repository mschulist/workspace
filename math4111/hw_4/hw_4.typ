#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 4")


= 2.2

Show that the set of algebraic numbers is countable.

An algebraic number is a $z in CC$ that, with the some set of coefficients, satisfies the following equation:

$
  a_0 z^n + a_1 z^(n-1) + a_2z^(n-2) + ... + a_n z^0 = 0
$ <algebraic-def>

We know that for each $N, n in NN$, $n + |a_0| + |a_1| + ... + |a_n| = N$ has a finite number of solutions.

Let $C_(n N)$ be the set of complex numbers satisfying @algebraic-def with $n + |a_0| + |a_1| + ... + |a_n| = N$, which we know has a finite number of solutions (where solution means set of coefficients that satisfies the equation) for a fixed $n, N$.

Hence $C_n = union.big_(i=1)^infinity C_(n i)$ is at most countable as we are taking an infinite union of finite sets. And finally $A = union.big_(i=1)^infinity C_i$ is at most countable as we are taking the union of many at most countable sets.

We know that the integers are a subset of $A$ (all integers are algebraic), and the integers are an infinite set. Hence $A$ must be a countable set.

We know that $A$ contains all possible algebraic numbers due to the following: each algebraic number can be represented by _some_ polynomial of degree $n$ (using @algebraic-def), and we have _every possible polynomial for each degree_ due to our contruction. We have every degree as we are taking the union over all $n$. For each $n$, we have all possible set of coefficients as, by construction, we are taking all possible $n + |a_0| + |a_1| + ... + |a_n| = N$ for each degree. Hence $A$ contains all algebraic numbers.

= 2.3

Show that there exists real numbers which are not algebraic.

#proof[

  From the above problem, we know that the set of algebraic numbers if countable. Call it $A$.

  Suppose $RR subset A$, meaning that all real numbers are algebraic. Since $RR$ is uncountable, $A$ must also be $arrow.zigzag$.

  So $A$ is not a subset of $RR$, hence there exist real numbers which are not algebraic.
]

= 2.4

Is the set of irrational numbers countable?

We know that the irrational numbers (call the set $A$) satisfies $A = RR \\ QQ$, which implies that $A union QQ = RR$. We know that $QQ$ is countable, so if we assume that $A$ is countable then we get that the union of 2 countable sets is uncountable $arrow.zigzag$. Hence $A$ must be uncountable.

= 2.5

Construct a bounded set with 3 limit points.

$
  A &= {1 / (n + 1) | n in NN} \
  B &= {1 + 1 / (n + 1) | n in NN} \
  C &= {2 + 1 / (n + 1) | n in NN}
$

We can show that set $A$ has a limit point as 0. Pick an arbitrary open ball $1 / r, r > 0$ centered at 0. Any point $1 / n, n > r$ is in this ball. Hence there are are infinitely many points from $A$ in any ball about 0, therefore 0 must be a limit point. We can apply this same logic to show that $B$ and $C$ also have respective limit points of 1, 2.

If we pick any other point in $A$, I claim it cannot be a limit point of $A$. Suppose we pick $p < 0$. Then we can find a neighborhood around $p$ that does not contain any elements of $A$ by setting the radius to any value less than $-p$.

Suppose we pick a point $0 < p = 1 / k <= 1 / 2$. If $p in A$ then we just make the ball $B_(r)(p)$ have radius $r < 1 / (k(k+1))$, which guarantees that no other point of $A$ will be in this open interval. If $p in.not A$, then we just find the distance to the nearest point in $A$ and set the radius to be smaller than that distance.

If we pick a point $p > 1 / 2$, then we just set the radius of the neighborhood to be less than $p - 1 / 2$ which guarantees that no elements of $A$ are in the neighborhood.

With these 3 cases, we have shown that $A$ only has a single limit point.

$A$ is also bounded below by 0 and above by $1/2$. $1 / n$ cannot be negative, so $0$ is the lower bound. The smallest $n$ is $1$, so $1 / (1 + 1) = 1 / 2$ which is the upper bound.

Each of these sets has 3 limit points (0, 1, 2 in particular), so $A union B union C$ must also have 3 limit points as the sets are disjoint and their individual limit points are distinct.

= 2.8

Is every limit point of every open set $E subset RR^2$ a limit point of $E$?

$E$ is an open set if for all $x in E$, there exists $r > 0$ such that $B_(r)(x) subset E$.

$x$ is a limit point of $E$ if every neighborhood of $p$ contains a point $q eq.not p$ such that $q in E$.

Because $E$ is open, we can always find a neighborhood $B_(r)(x)$ around any $x in E$ such that $B_(r)(x) subset E$. Because we can always find this neighborhood, we can find a point $q in B_(r)(x)$ such that $q eq.not p$ and $q in E$. If we make the neighborhood larger (larger $r$), the point $q$ will still be in $B_(r)(x)$ (meaning that $q$ is in all neighborhoods of larger radius than $r$, satisfying part of the possible neighborhoods). If we make the neighborhood smaller, the same $q$ is no longer guaranteed to still be in the neighborhood, but $B_(r)(x)$ will contain other points in $E$ (as $B_(r)(x) subset E$ for all $r > 0$) so we can still find another point $q in B_(r)(x), q eq.not p$ such that $q in E$.

For closed sets, no! Take $X = {(x, y) | x^2 + y^2 <= 1, x, y in RR} union {(10,10)}$.

This set is closed, but the point $(10,10) in X$ is not a limit point of $X$. Hence not every point of $X$ is a limit point of $X$ if $X$ is closed.

= 2.11

==

$
  d_1(x, y) = (x - y)^2
$

(a) $(x - y)^2 > 0$ and $0 = (x - y)^2 ==> 0 = x - y ==> x = y$, so satisfied.

(b) $(x - y)^2 = (y - x)^2$ so is satisfied.

(c) We want to see if $(x - z)^2 <= (x - y)^2 + (y - z)^2$. If we set $x = 0, y = 0.5, z = 1$ we get:
$
  (-1)^2 &<= 0.5^2 + 0.5^2 \
  1 &lt.eq.not 0.25 + 0.25
$

So metric (1) is not a valid metric.

==

$
  d_2(x, y) = sqrt(|x - y|)
$

(a) $sqrt(|x - y|) > 0$ unless $x = y$, as $sqrt(|x - y|) = 0 ==> |x - y| = 0 ==> x = y$. So (a) is satisfied.

(b) $sqrt(|x - y|) = sqrt(|y - x|)$. We take multiply by -1 in the abs and nothing changes.

(c) We want to show that $sqrt(|x - z|) <= sqrt(|x - y|) + sqrt(|y - z|)$. We can show this by squaring both sides.

$
  underbrace(|x - z| &<= |x - y| + |y - z|, "triangle ineq, thm 1.37, prop f") + underbrace(2sqrt(|x - y| |y - z|), >0)
$

We know that the first part is true by the "regular" triangle inequality, and if we add a positive term to the greater then or equal to side, the inequality still holds. Hence this metric satisfies all 3 properties of being a valid metric.

==

$
  d_3(x, y) = |x^2 - y^2|
$

(a) $abs((-1)^2 - (1)^2) = 0$, but $x, y eq.not 0$. So this is not a valid metric!

==

// (a) $|x^2 - 2y| > 0$ if $x, y eq.not 0$ by definition of abs. If $0 = |x^2 - 2y| ==> x = y$.

(b) $|x^2 - 2y| eq.not |y^2 - 2x| forall x, y in RR$ so does not satisfy symmetric property (as $x^2 eq.not 2x$, they are not the same operation being applied to both $x$ and $y$).

==

$
  d_5(x, y) = abs(x - y) / (1 + abs(x - y))
$

(a) $abs(x - y) / (1 + abs(x - y)) > 0$ if $x, y eq.not 0$ as we have positive divided by a positive. If $0 = abs(x - y) / (1 + abs(x - y)) ==> abs(x - y) = 0 ==> x = y$.

(b) $abs(x - y) / (1 + abs(x - y)) = abs(y - x) / (1 + abs(y - x))$ as same operations are being applied to $x$ and $y$ (just labeling).

(c) This is a a bit longer so will continue onto another line.

We want to show that $abs(x - z) / (1 + abs(x - z)) <= abs(x - y) / (1 + abs(x - y)) + abs(y - z) / (1 + abs(y - z))$.

First, we will prove a Lemma denoted as _Andy's Lemma_ (named after the fellow classmate I worked on the homework with).

#underline([_Lemma_ (Andy's Lemma)]) \
Given $c <= a, c eq.not b, x in RR, b + a > 0$ with $(x + a) / (b + a) < 1$, the following is true:

$
  (x + a) / (b + a) >= (x + c) / (b + c)
$

#proof[
  Let $n = (x + a) / (b + a)$. We know that $n < 1$ by the given.

  $
    n &= (x + a) / (b + a) \
    n b + n a &= x + a \
    n b - x &= a (1 - n) \
    n < 1 ==> quad n a + n b &>= c(1 - n) \
    n b - x &>= c - c n \
    n b + c n &>= c + x \
    n(b + c) &>= c + x \
    n &>= (c + x) / (b + c) \
    ==> quad (x + a) / (b + a) &>= (c + x) / (c + b)
  $
]

Now we can apply the lemma to the problem. We will set $a = abs(x - y) / (1 + abs(x - y)) + abs(y - z) / (1 + abs(y - z))$.

$
  a &= abs(x - y) / (1 + abs(x - y)) + abs(y - z) / (1 + abs(y - z)) \
  a &= (|x - y| + |y - z| + 2|x - y||y - z|) / (1 + |x - y||y - z| + |x - y| + |y - z|) \
  "get rid of" 2 ==> quad a &>= (|x - y| + |y - z| + |x - y||y - z|) / (1 + |x - y||y - z| + |x - y| + |y - z|)
$

We know that $a < 1$ (due to the +1 in the denominator) so we can apply the lemma. Using the normal triangle inequality (thm 1.37, prop f), we know that $|x - z| <= |x - y| + |y - z|$. Hence we can replace $|x - y| + |y - z|$ with $|x - z|$ in both the numerator and denominator and keep the inequality valid.

$
  a >= (|x - z| + |x - y||y - z|) / (1 + |x - z| + |x - y||y - z|)
$

Now we again apply the lemma and replace $|x - y||y - z|$ with $0$. This fits all the requirements of the lemma as all we need is for $0 <= |x-y||y-z|$ which is true as abs must be non-negative.

$
  a >= abs(x - z) / (abs(x - z) + 1)
$

Now we plug back into the definition of $a$.

$
  abs(x - z) / (abs(x - z) + 1) &<= a = abs(x - y) / (1 + abs(x - y)) + abs(y - z) / (1 + abs(y - z)) \
  abs(x - z) / (abs(x - z) + 1) &<= abs(x - y) / (1 + abs(x - y)) + abs(y - z) / (1 + abs(y - z))
$

And hence this is a valid metric!
