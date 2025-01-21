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
  Using the fact from the previous problem, we can see that this is true. We can do induction on $NN$.

  Our base case is that $a | b_1 x_1 + b_2 x_2$.

  Inductive hypothesis: $a | b_1 x_1 + ... + b_j x_j$.

  $
    a | b_1 x_1 + dots + b_j x_j + b_(j+1) x_(j+1)
  $

  This is true as $a$ divides all terms up to $j$ by the inductive hypothesis, and $a$ must also divide the final term by the problem statement. If we see the first $j$ terms as a single term that (that $a$ can divide), then we get two terms and the problem reduces to the same problem as part (b).

  // The previous problem is a integer combination of two variables, but when we proved it nothing prevented us from using any number of variables.

  // In this case, we have that $a$ divides every $b_i$, which means that $a k = b_1 x_1 + b_2 x_2 + dots + b_n x_n$.
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

*TODO: Prove list is complete.*

// *Use the next problem to prove our list is complete.*

We can use the next problem to show that our list is complete.

#proof[
  Let $r = a x + b y = 6$. Then we know that we can write $r = (a,b)n$ for some $n in NN$.

  In our example, we have that $6 = (a,b)n$. The possible choices for $(a,b)$ are all of the values that divide $6$.

  $
    (a,b) in {x in NN | x|6}
  $

  These are also known as the _factors_ of $6$, which are ${1,2,3,6}$, hence showing our list is exhaustive.
]

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

  Suppose $r = (a,b) f x + (a,b) g y in {a x + b y | x, y in ZZ}$. Then:
  $
    r = (a,b) underbrace((f x + g y), "some integer") \
  $

  Hence, $r in {(a,b)n | n in ZZ}$.

  // Suppose $r = a x + b y$. We know $a = (a, b)l$ and $b = (a,b)k$.

  // $
  //   r &= (a,b) l x + (a,b) k y \
  //   r &= (a,b) underbrace((l x + k y), "some integer") \
  //   r &= (a,b) n
  // $

  // Therefore, $r in {(a,b)n | n in ZZ}$.

  Now we can show that ${(a,b)n | n in ZZ} subset.eq {a x + b y | x, y in ZZ}$.

  Suppose $r = (a,b)n$ for some $n in ZZ$.

  Then $a = (a,b) x$ and $b = (a,b)y$ for some $x,y in ZZ$.

  Add the equations:
  $
    a + b &= (a,b)(x + y) \
    a + b &= (a,b)n quad "let" x + y = n \
    a + b &= r
  $
  Hence, $r = a + b$, $r in {a x + b y | x, y in ZZ}$.
]


=

==

Show $D(a) sect D(b) = D((a,b))$

#proof[
  We can show that each set is contained within the other so show they are equal.

  WTS: $D(a) sect D(b) subset.eq D((a,b))$.

  For any $x in D(a) sect D(b)$, we know that $x$ divides $a$ and $b$.

  // $(a,b)$ is defined to be the greatest integer that divides $a$ and $b$ so $x$ must also divide $(a,b)$.

  We can write $a = x k$ and $b = x l$ because $x$ divides $a$ and $b$.

  $
    a &= x((k, l) alpha) quad quad b &= ((k,l)beta)
  $

  We want to show that $x (k, l) = (a,b)$. AFSOC that $x(k,l) != (a,b)$. Then $(alpha, beta) > 1$, which constradicts our choice of $alpha$ and $beta$, which were chosen such that there are coprime.

  Hence,
  $
    (k,l) x = (a,b) ==> x | (a,b) ==> x in D((a,b))
  $

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

#proof[
  Assume there exists $d in C(a,b,c)$ with $0 < d < C(a,b,c)$. $d in C(a,b,c)$ so there exists $x,y,z in ZZ$ such that $a x + b y + c z = d$. We know that $(a,b,c)|a$ and $(a,b,c)|b$ and $(a,b,c)|c$, so by the linear combination proposition, $(a,b,c)$ divides any linear combination of $a,b,c$. In particular, $(a,b,c)|d$ which implies that $(a,b,c) <= d arrow.zigzag$.

  This cannot be true because we assumed that $d > (a,b,c)$, so therefore $(a,b,c)$ must be the smallest positive element in $C(a,b,c)$.
]

==

(b) GCD is "associative" so order of determining divisors does not matter.

(c) $(a_1, a_2, ..., a_n)$ is the smallest element of $C(a_1,a_2,...,a_n) = {a_1 x_1 + a_2 x_2 + ... + a_n x_n | x_1, x_2, ..., x_n in ZZ}$

==

#proof[
  We can give a counterexample that disproves the statement.

  Let $a = 6, b = 10, c = 15$. Then $(a,b,c) = 1$.

  But $(a,b) = 2, (a,c) = 3, (b,c) = 5$.
]

=

$N = 8$

#for i in range(1, 21) [
  #calc.gcd(i, 8),
] ...

The period of this sequence is 8 (i.e. there are 8 numbers before it repeats). The period corresponds with my choice of $N$.

If $N = 7$ (which is prime)

#for i in range(1, 21) [
  #calc.gcd(i, 7),
] ...

The period is 7, which equals $N$.

If $N = 6$

#for i in range(1, 21) [
  #calc.gcd(i, 6),
] ...

The period is 6.

So it seems like the period is the value of $N$.

To prove this fact, we would need to use the fact that

$
  (a, N) = (N, a - N k)
$

Everytime we increment $k$, both sides remain equal but the RHS will "look" different. Incrementing $k$ will make the second argument in the RHS become $N$ larger, which is the period in our sequence.

We also know that the sequence can't repeat in the first $N$ terms, so $N$ is the period and not just an upper bound on the period.

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

#proof[
  Let $r_a = "ord"_(p)(a)$ and $r_b = "ord"_(p)(b)$.

  WLOG let $r_a <= r_b$. Then $min{r_a, r_b} = r_a$.

  We know from the FTA:
  $
    a = p^(r_a) + l quad quad b = p^(r_b) + k
  $
  // where $p divides.not l$ and $p divides.not k$.

  Therefore:
  $
    a + b &= p^(r_a) dot l + p^(r_b) + k \
    &= p^(r_a)(l + p^(v_b - v_a) k) quad "using" r_a <= r_b
  $
  // Because $p divides.not l$, we know that $p divides.not l + p^(r_a - r_b) k$.

  Therefore the exponent of $p$ must be at least $r_a$ (i.e. $"ord"_(p)(a+b) >= r_a$ where $r_a = min{"ord"_(p)(a), "ord"_(p)(b)}$).
]

*Example 1*

$"ord"_(p)(a + b) = min{"ord"_(p)(a), "ord"_(p)(b)}$ in the following example.

Let $a = 8, b = 16$. Then

$
  "ord"_2(8 + 16) = "ord"_2(24) = 3
$

And $"ord"_2(8) = 3$, $"ord"_2(16) = 4$. So $min{3, 7} = 3$

*Example 2*

$"ord"_(p)(a + b) = min{"ord"_(p)(a), "ord"_(p)(b)}$ in the following example.

Let $a = 9, b = 18$. Then

$
  "ord"_(3)(9) = 2 quad quad "ord"_(3)(18) = 2
$

$
  "ord"_(3)(9 + 18) = "ord"_(3)(27) = 3
$

As we can see, $min{"ord"_(3)(9), "ord"_(3)(18)} = 2$ (they are the same). But this value is less than $"ord"_(3)(27) = 3$. So this is an example of when the LHS is strictly greater than the RHS.

We can also see that in this second example, the ord of $a$ and $b$ were the same, which led to the prime of interest having an additional term in the factorization of their sum.

==

Show that $b | a <==> "ord"_(p)(a) <= "ord"_(p)(b) forall p in {"primes"}$

#proof[

  $(==>)$

  We are given that $b | a ==> a = b x$ for some $x in ZZ$. Therefore:
  $
    "ord"_(p)(a) &= underbrace("ord"_(p)(b), >=0) + underbrace("ord"_(p)(x), >=0) \
    "ord"_(p)(a) &<= "ord"_(p)(b)
  $

  If we add a non-negative value to the RHS, we cannot get a smaller value than $"ord"_(p)(b)$.

  $(<==)$

  Given $"ord"_(p)(b) <= "ord"_(p)(a)$, show that $b | a$.

  $
    a &= p_1^(a_1) p_2^(a_2) ... \
    b &= p_1^(b_1) p_2^(b_2) ...
  $

  If we "divide" $a$ by $b$, then we get the following:

  $
    a / b &= p_1^(a_1 - b_1) p_2^(a_2 - b_2)
  $

  But we know that $"ord"_(p)(b) <= "ord"_(p)(a)$ for all primes, so the exponents on the RHS must all be positive, which means that the RHS is still an integer. Hence, $b | a$.
]

==

#proof[
  Given that $(a,b)|a$ and $(a,b)|b$, by part (c) we know the following 2 statements are true:
  $
    "ord"_(p)((a,b)) <= "ord"_(p)(a) quad quad "ord"_(p)((a,b)) <= "ord"_(p)(b)
  $ <7d-by-part-c>

  We want to show that [$"ord"_(p)((a,b)) = "ord"_(p)(a)$ or $"ord"_(p)((a,b)) = "ord"_(p)(b)$] to prove that the min of them is equal to $"ord"_(p)((a,b))$.

  AFSOC that neither of the above are true.

  Let $min{"ord"_(p)(a), "ord"_(p)(b)} - "ord"_(p)((a,b)) = k$.

  Then we know that $(a,b) k | a$ and $(a,b) k | b$. But that implies that $(a,b)$ is not the GCD because it is too small (not the smallest divisor of $a$ and $b$) $arrow.zigzag$.

  So $"ord"_(p)((a,b)) = "ord"_(p)(a)$ or $"ord"_(p)((a,b)) = "ord"_(p)(b)$. Because $"ord"_(p)((a,b))$ is equal to the lower bounds established in @7d-by-part-c, we know that $"ord"_(p)((a,b))$ exactly equals the minimum of $"ord"_(p)(a)$ and $"ord"_(p)(b)$.
]


=

Given $m | a b$ and $(a,m) = 1$, show that $m | b$.

#proof[
  We want to show that $m | b$ which means that $"ord"_(p)(m) <= "ord"_(p)(b)$.


  First given:
  $
    m | a b ==> "ord"_(p)(m) <= "ord"_(p)(a b)
  $ <first-given-8>

  From @first-given-8, we can see the following:

  $
    "ord"_(p)(m) <= "ord"_(p)(a b) = "ord"_(p)(a) + "ord"_(p)(b)
  $ <ord-add-8>

  Second given:
  $
    (a,m) = 1 ==> product p^(min{"ord"_(p)(a), "ord"_(p)(m)}) = 1 ==> min{"ord"_(p)(a), "ord"_(p)(m)} = 0
  $ <second-given-8>


  We have two cases with the minimum in @second-given-8.

  If $"ord"_(p)(m) = 0$ then $"ord"_(p)(m) <= "ord"_(p)(b)$ because all terms on the RHS of @ord-add-8 are non-negative.

  If $"ord"_(p)(a) = 0$, then we reach the same conclusion using the same reasoning as above (i.e. @ord-add-8 is still satisfied when $"ord"_(p)(a) = 0$ which then implies what we want to show).
]