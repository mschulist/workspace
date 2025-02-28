#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import emoji: mango, banana, tangerine


#show: project.with(title: "Homework 4")
#set math.mat(delim: "[")


=

==

$
  x &equiv 3 mod 10 ==> x equiv 1 mod 2 quad x equiv 3 mod 5 \
  x &equiv 11 mod 17 ==> x equiv 2 mod 9 quad x equiv 1 mod 2 \
  x &equiv 14 mod 27 ==> x equiv 5 mod 9
$

Here we get incompatible equations, in particular the ones that claim $x equiv 2 mod 9$ and $x equiv 5 mod 9$. There is no solution to $x$ where both of these can be satisfied.

==

$
  x &equiv 5 mod 8 ==> x equiv 1 mod 2 \
  x &equiv 5 mod 12 ==> x equiv 2 mod 3 quad x equiv 1 mod 4 \
  x &equiv 11 mod 45 ==> x equiv 1 mod 5 quad x equiv 2 mod 9
$

Combining we get:

$
  cases(
    x equiv 5 mod 8,
    x equiv 2 mod 9,
    x equiv 1 mod 5
  )
$

Our $m = 8 dot 5 dot 9 = 360$.

$
  b_1 &= (360 / 8)^(-1) = 45^(-1) = 5^(-1) = 5 mod 8 \
  b_2 &= (360 / 9)^(-1) = 40^(-1) = 4^-1 = 7 mod 9 \
  b_3 &= (360 / 5)^(-1) = 72^(-1) = 2^(-1) =3 mod 5
$

Hence $x = 45 dot 5 dot 5 + 40 dot 7 dot 2 + 72 dot 3 dot 1 = 101 mod 360$.

=

==

When is $phi.alt(n)$ even?

$
  phi.alt(n) = product_(i = 1)^r p_i^(a-1) (p_i - 1)
$ <totient-def>

If $phi.alt(n)$ has a factor of 2, then it will be even, so we need to ensure that both (a) $p_i^a-1$ AND (b) $p_i - 1$ are odd. The only even prime is 2, so we know that the only prime which can make (b) odd is 2. Additionally, we know that (a) cannot be even, and the only way to make $2^k$ odd is if $k = 0 ==> a - 1 = 0 ==> a = 1$. Hence $n = 2$ is the only nontrivial solution.

If $n = 1$, it has no factors (other than 1) and $abs((ZZ\/ZZ)^times) = 1$ which is odd.

==

When is $phi.alt(n) = phi.alt(2n)$?

We know that $phi.alt(2) = 1$.

If $n$ is odd, then $(n,2) = 1$. Hence $phi.alt(2n) = phi.alt(2) phi.alt(n)$ so $phi.alt(n) = phi.alt(2n)$.

If $n$ is even, then $n = 2^k m$ where $m$ is odd. Hence $phi.alt(2n) = phi.alt(2^(k + 1)) phi.alt(m) ==> phi.alt(2n) eq.not phi.alt(n)$.

So this fact is only true when $n$ is odd.

==

$phi.alt(n) = 14$ for what $n$?

We know that $14 = 2 dot 7$. Using @totient-def we can see that because $14$ only has 2 factors, we can only use one prime to satisfy $phi.alt(n) = 14$. We know that the second term must equal 2 because if the first term was 2, then the second would be 1 which is not 7. Hence $p_i - 1 = 2 ==> p_i = 3$. That means that we need to find a value for $a$ such that $7 = 3^(a - 1)$, but there is no solution in $ZZ$. Hence there is no value of $n$ where $phi.alt(n) = 14$.

=

#proof[

  Fix $k$ to equal an $phi.alt(n)$.

  We can first show that a particular inequality holds, and then use it show that $n$ is bounded above. We want to show that $p - 1 > sqrt(p / 4) forall p$ primes.

  $
    p &> 1 \
    p &> (9 + sqrt(17)) / 8 \
    p &> sqrt(17 / 64) + 9 / 8 \
    (p - 9 / 8)^2 &> 17 / 64 \
    p^2 - 9 / 4 p + 81 / 64 &> 17 / 64 \
    p - 9 / 4 p + 1 &> 0 \
    p^2 - 2 p + 1 &> p / 4 \
    p - 1 &> sqrt(p / 4)
  $

  On paper I started in the reverse direction to show the above inequality holds, which is why it looks a bit contrived in this form...

  $
    phi.alt(n) &= product_(i = 1)^r p_i^(a - 1)(p_i - 1) <= product_(i = 1)^r (p_i - 1) < sqrt(n / 4) \
    phi.alt(n) &> sqrt(n / 4) \
    k > sqrt(n / 4) \
    4k^2 > n
  $

  Since $n$ is bounded above, $phi.alt(n) = k$ has finitely many solutions. Looking back, this is a pretty loose bound but at least it's finite!
]

=

==

$
  x^3 + 2x - 3 = 0 mod 45
$

For mod 9, the solutions are $x = 1, 2, 6$ (by brute force on mod 9).

For mod 5, the solutions are $x = 1, 3$.

So we know there are 6 total solutions.

$
  b_1 &= 5^(-1) = 2 mod 9 \
  b_2 &= 9^(-1) = 4 mod 5
$

For $(1,1)$: $x = 2 dot 5 dot 1 + 4 dot 9 dot 1 = 46 = 1 mod 45$. \
For $(1,3)$: $x = 2 dot 5 dot 1 + 4 dot 9 dot 3 = 118 = 28 mod 45$. \
For $(2,1)$: $x = 2 dot 5 dot 2 + 4 dot 9 dot 1 = 56 = 11 mod 45$. \
For $(2,3)$: $x = 2 dot 5 dot 2 + 4 dot 9 dot 3 = 128 = 38 mod 45$. \
For $(6,1)$: $x = 2 dot 5 dot 6 + 4 dot 9 dot 1 = 96 = 6 mod 45$. \
For $(6,3)$: $x = 2 dot 5 dot 6 + 4 dot 9 dot 3 = 168 = 33 mod 45$

==

$
  x^2 + 5x - 13 = 0 mod 154
$

$
  154 = 11 dot 7 dot 2
$


If we look at $x^2 + 5x - 13 = x^2 + x + 1 = 0 mod 2$, we can see that it has no solutions for $x$. Therefore, the overall polynomial cannot have any solutions.


=

We want to determine the number of solutions if $n$ is square-free and $a in (ZZ\/n ZZ)^times$ and $x^2 = a mod n$ has at least one solution.

If $n$ is square-free, then $n = product_(i = 1)^k p_i$ (the exponent on each prime is either 0 or 1 and $n$ has $k$ prime factors).

We know that $x^2 = a mod p$ for odd primes ($p eq.not 2$) $p$ has exactly 2 solutions.

$
  x^2 = a mod n ==> cases(
    x^2 = a mod p_2 => 2 "sol",
    x^2 = a mod p_2 => 2 "sol",
    ...,
    x^2 = a mod p_k => 2 "sol"
  )
$

So if $n$ is odd, then there are $2^k$ solutions.

And if $n$ is even, then there are $2^(k - 1)$ solutions (as one of the factors is $p = 2$ which only has one solution).


=

==

if $f(x) = 0 mod p$ then $x = (-b plus.minus sqrt(Delta)) / (2a) mod p$, which has 2 unique solutions if $sqrt(Delta) eq.not -sqrt(Delta)$. $sqrt(Delta) eq.not -sqrt(Delta)$ if and only if $Delta eq.not 0$. In other words, if $Delta = 0$ then $x$ has 1 solution and if $Delta eq.not 0$ then $x$ has 2 solutions.

Notice that the same also holds for $x^2 = Delta mod p$. $x^2 = Delta mod p$ has 2 solutions if $Delta eq.not 0$ and 1 solution if $Delta = 0$. Hence quadratic polynomials have at most 2 roots mod prime $p$.

==

===

$
  x^2 + 5x - 15 = 0 mod 17
$

$
  x &= (- 5 plus.minus sqrt(25 + 60)) / 2 \
  &= (-5 plus.minus sqrt(85)) / 2 \
  &= (-5 plus.minus sqrt(0)) / 2 \
  &= 12 / 2 \
  &= 6
$

===


$
  x^2 + 3x - 8 = 0 mod 37
$

$
  x &= (-3 plus.minus sqrt(9 + 32)) / 2 \
  &= (-3 plus.minus sqrt(41)) / 2 \
  &= (-3 plus.minus 2) / 2 \
  &= (34 plus.minus 2) / 2 \
  ==> quad x &= 16, 18
$

==

We want to show the zeros of all 4 quadratic polynomials in $ZZ\/2ZZ$.

$
  x^2 + x + 1 &= 0 ==> emptyset \
  x^2 + 1 &= 0 ==> {1} \
  x^2 &= 0 ==> {0} \
  x^2 + x &= 0 ==> {0, 1}
$

=

==

$
  x^2 + 11x - 5 = 0 mod 71
$

$
  (-11 plus.minus sqrt(11^2 + 20)) / 2 &= (-11 plus.minus sqrt(70)) / 2
$

But $y^2 = 70$ does not have any solutions in mod 71. So $x$ has no solutions mod 71.

==

$
  4x^2 + 2x + 5 = 0 mod 55
$

$
  4x^2 + 2x + 5 &= 0 mod 5 \
  x^2 &= Delta mod 5 \
  x^2 &= 4 mod 5
$
So this part "brings" 2 solutions.

$
  4x^2 + 2x + 5 &= 0 mod 11 \
  x^2 &= Delta mod 11 \
  x^1 &= 1 mod 11
$
And this part also brings 2 solutions.

So $2 dot 2 = 4$ so there are 4 possible solutions.

==

$
  x^2 - 5x + 16 = 0 mod 30
$

$
  Delta = 25 - 64 = -39 &= 1 mod 2 \
  &= 0 mod 3 \
  &= 1 mod 5
$

When $Delta = 0 mod 3$, we know that this will give us 1 solution due to problem (6) (as the $plus.minus$ part will be $plus.minus 0$). When $Delta = 1 mod 5$, we know that this parts gives us 2 solutions using the same reasoning as above.

For $Delta = 1 mod 2$, we cannot directly use the discriminant to derive any information about the number of solutions, but there are only 4 quadratics in mod 2, so we can look up this one and find that it has 2 solutions $f(x) = x^2 + x = 0 mod 2$ (and this has 2 solutions in mod 2).

So there are 4 solutions in all $(2 dot 2 dot 1)$.

// So there are 4 solutions, $2 dot 1 dot 2$ (the "2"s come from when $Delta = 1 mod p$ and "1"s come from when $Delta = 0 mod p$).

=

==

$
  x^2 + b x + c = 0 mod 210
$

$
  210 = 5 dot 2 dot 3 dot 7
$

To get 8 solutions, we need to have 3 of the prime factors have 2 solutions and the other one have 1 solution. Then we will have 8 solutions in all.

$
  Delta &= 1 mod 2 \
  Delta &= 0 mod 3 \
  Delta &= 1 mod 5 \
  Delta &= 1 mod 7 \
  Delta &= 141 mod 210
$

$Delta = 141 = b^2 - 4c mod 210$. $141 + 4c = b^2$ so $b$ is odd. 169 is the next square after 141, so set $b^2 = 169, b = 13$. Then $141 + 4c = 169 ==> c = 7$.

Hence we get
$
  x^2 + 13x + 7 = 0
$

which has 8 solutions.

==

$
  f(x) &= 0 mod 143 \
  (x - a)(x - b)(x - c) &= 0 mod 143
$

We want this to have 6 solutions mod 143.

We can split this into its prime factors, which is $143 = 11 dot 13$. We need to try and get 2 solutions mod 11 and 3 solutions mod 13 so that we have 6 solutions in all.

We know that $12 = 1 mod 11$, so we can exploit this fact to get a repeated root in mod 11 when there are distinct roots in mod 13.

$
  f(x) &= (x - 1)(x - 5)(x - 12) \
  &= (x - 1)^2 (x - 5) mod 11 \
  &= (x - 1) (x - 5) (x - 12) mod 13
$

As we can see, $f(x)$ has 2 solutions in mod 11 and 3 solutions mod 13. Hence $f(x)$ will have 6 solutions mod 143 by the CRT.
