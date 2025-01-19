#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 1")

=

$
  a, b, c in ZZ
$

==

$
  a, b > 0
$

Show that if $a|b$ then $a <= b$

#proof[
  From the definition of "divides", we know that $b = a k$ for some $k in ZZ$. We know that $a, b > 0$, so $k > 0$ as well. We can see from the definition of "divides" that multiplying $a$ by a positive integer will yield a number larger than or equal to $a$. Therefore $b >= a$.
]

==

$
  a|b quad a|c
$

Show that $a|b x + c y$ for any $x, y in ZZ$.

#proof[
  WTS: [$b x + c y = a k$]


  We again recall the definition of "divides."

  $
    b = a k quad c = a l
  $
  We can multiply the equations by a constant.

  $
    b x = a k x quad c y = a l y
  $

  And add the two equations.

  $
    b x + c y &= a k x + a l y \
    b x + c y &= a underbrace((k x + l y), "some integer")
  $

  The LHS is $a$ times some integer, which is what we needed to show.
]

==

$n in ZZ$ with $n > 2$. Let $b_1, b_2, ..., b_n in ZZ$. Suppose $a|b_i$ for all $i <=  n$.

Show that for any $n$ integers $x_1, x_2, ..., x_n in ZZ$ we have

$
  a lr(| sum_(i=1)^n) b_i x_i
$

#proof[
  Using the fact from the previous problem, we can see that this is true.

  The previous problem is a integer combination of two variables, but when we proved it nothing prevented us from using any number of variables.

  In this case, we have that $a$ divides every $b_i$, which means that $a k = b_1 x_1 + b_2 x_2 + dots + b_n x_n$.
]


=

$
  (609, 140)
$

$
  609 &= 140 dot 4 + 49 \
  140 &= 49 dot 2 + 42 \
  49 &= 42 dot 1 + 7 \
  42 &= 7 dot 6 + 0
$

So...$arrow.squiggly.long (609, 140) = 7$

Solve for $609 x + 140 y = 7$.
$
  7 &= 49 - 42 \
  7 &= 49 - 140 + 49 dot 2 \
  7 &= -140 + (609 - 140 dot 4) dot 3 \
  7 &= -140 + 609 dot 3 - 140 dot 12 \
  7 &= 609 dot 3 - 140 dot 13 \
  ==> x &= 3, y = -13
$


=

$
  a x + b y &= 6
$

If we let $a = b = 3$, then $3 dot 1 + 3 dot 1 = 6$. But $(3, 3) = 3$. So this is an example of why $(a, b)$ does not need to be $6$.

Similarly, we can show that $a = 4, b = 2$ also works, with $(4, 2) = 2$.

We can also show that $a = 6, b = 1$ works and $(6, 1) = 1$.

And $a = 0, b = 6 = (6,0) = 6$

This list of GCDs ${1, 2, 3, 6}$. As we can see, this list includes all of the divisors of $6$.

We can further split this up into _pairs_ of divisors of $6$, such that the product of each pair equals $6$.

For example, $1 dot 6 = 6$ and $2 dot 3 = 6$.

First we find all of the _factors_ of $6$, and then we find all of the complements to those factors such that each factor multiplied by the factor equals $6$. Our set of possible GCDs is the set of all factors and their complements.

TODO: Prove list is complete.


=

$a, b in ZZ$ not both $0$.

$
  C(a, b) &= {a x + b y | x, y in ZZ}
$

Show $C(a, b) = {(a, b)n | n in ZZ}$

#proof[
  To prove that
  $
    {a x + b y | x, y in ZZ} &= {(a, b)n | n in ZZ}
  $
  we need to show that each set is contained within the other.

  First show that ${a x + b y | x, y in ZZ} subset.eq {(a,b)n | n in ZZ}$

  Suppose $r = a x + b y$. We know $a = (a, b)l$ and $b = (a,b)k$.

  $
    r &= (a,b) l x + (a,b) k y \
    r &= (a,b) underbrace((l x + k y), "some integer") \
    r &= (a,b) n
  $

  Therefore, $r in {(a,b)n | n in ZZ}$.

  Now we can show that ${(a,b)n | n in ZZ} subset.eq {a x + b y | x, y in ZZ}$.

  Suppose $r = (a,b)n$ for some $n in ZZ$.

  Then $a = (a,b) x$ and $b = (a,b)y$ for some $x,y in ZZ$.

  Add the equations:
  $
    a + b &= (a,b)(x + y) \
    a + b &= (a,b)n quad "let" x + y = n \
  $
  Hence, $r = a + b$, $r in {a x + b y | x, y in ZZ}$.
]


=

==

Show $D(a) sect D(b) = D((a,b))$

#proof[
  We can show that each set is contained within the other so show they are equal.

  WTS: $D(a) sect D(b) subset.eq D((a,b))$.

  For any $x in D(a) sect D(b)$, we know that $x$ divides $a$ and $b$. $(a,b)$ is defined to be the greatest integer that divides $a$ and $b$ so $x$ must also divide $(a,b)$.

  WTS: $D((a,b)) subset.eq D(a) sect D(b)$

  For any $y in D((a,b))$, we know that $y$ divides $(a,b)$ which must divide $a$ and $b$ by definition (it is the _greatest common divisor_). So $y in D(a) sect D(b)$.
]


$
  a, b, c in ZZ
$

$
  (a, b, c) = max{D(a) sect D(b) sect D(c)}
$

==

Show that $(a,b,c) = (a,(b,c))$

#proof[
  We know that intersection is associative.

  $
    (a, (b,c)) &= (a,b,c) \
    D(a) sect (D(b) sect D(c)) &= D(a) sect D(b) sect D(c)
  $
]

==

$N = 8$

#for i in range(1, 21) [
  #calc.gcd(i, 8),
] ...

The period of this sequence is 8 (i.e. there are 8 numbers before it repeats). The period corresponds with my choice of $N$.

If $N = 7$ (which is prime)

#for i in range(1, 21) [
  #calc.gcd(i, 7),
] ...

There is no period...

If $N = 6$

#for i in range(1, 21) [
  #calc.gcd(i, 6),
] ...

The period is 6.

So it seems like if $N$ is not prime, then the period is $N$.

=

=

==

Show that $"ord"_(p)(a b) = "ord"_(p)(a) + "ord"_(p)(b)$

#proof[
  Let $a = p_1^a_1 p_2^a_2 p_3^a_3 ...$ and $b = p_1^b_1 p_2^b_2 p_3^b_3 ...$.

  Then $a b = p_1^(a_1 + b_1) p_2^(a_2 + b_2) p_3^(a_3 + b_3) ...$.

  Then $"ord"_p_(i)(a) = a_i$ and $"ord"_p_(i)(b) = b_i$.

  Clearly, $"ord"_p_(i)(a b) = a_i + b_i = "ord"_p_(i)(a) + "ord"_p_(i)(b)$
]

==

