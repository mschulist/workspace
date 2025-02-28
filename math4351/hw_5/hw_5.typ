#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import emoji: mango, banana, tangerine


#show: project.with(title: "Homework 5")


=

==

$
  f(x) = x^5 + x^4 + 1 = 0 mod 243
$

We know that $243 = 3^5$.

$
  f(x) = x^5 + x^4 + 1 = 0 mod 3
$

$f(1)$ is the only solution.

$
  f'(x) &= 5x^4 + 4x^3 \
  f'(1) &= 9 = 0 mod 3
$

So could all be solutions are none be solutions.

$
  f(1) = 3 eq.not 0 mod 9
$

So none are solutions. Hence there is no solution to $f(x) = 0 mod 243$.

==

$
  f(x) = x^3 + x + 87 = 0 mod 125
$

We know that $125 = 5^3$.

$f(4) = 0 mod 5$ is only solution, so 4 is a solution mod 5.

$
  f'(x) &= 3x^2 + 1 \
  f'(4) &= 49 = 4 mod 5
$

So there is a unique lift.

$
  t &= -f'(4)^(-1) f(4) / 5 mod 5 \
  t &= -4 dot 31 mod 5 \
  t &= 1 mod 5
$

$
  a' = 4 + 5 = 9
$

Now let $a = 9$, we are in mod 25.

$
  f'(9) = 244 = 4 mod 5
$

$
  t &= -4 f(9) / 25 = -4 dot 33 = -132 = -7 = 18 mod 25
$

$
  a' = 9 + 18 dot 25 = 459 = 84 mod 125
$

So $x = 84$ is a solution mod 125.

==

$
  x^3 - x^2 = 0 mod 16
$

Mod 4, we can see that $f(0) = f(1) = f(2) = 0 mod 4$. So there are 3 solutions mod 4.

Start with 0.

$
  f'(0) &= 0 \
  f(0) &= 0
$

So all are lifts. $a' = 0, 4, 8, 12$.

Now do 1.

$
  f'(1) = 1
$

$
  t &= -1 dot f(1) / 4 mod 4 \
  &= 0
$

So $a' = a + 0 = 1$.

Now do 2.

$
  f'(2) = 8 = 0 mod 4
$

$a' = a = 2$. $f(2) = 4 mod 16$, so none are solutions.

So $x = 0,1,4,8,12$ are solutions!

=

==

$
  x^3 - x = 0 mod 48
$

$x^3 - x^2 = 0 mod 16$ has 5 solutions.

$x^3 - x^2 = 0 mod 3$ has 2 solutions.

So we have 10 solutions in all.

==

$
  x^3 + x + 87 = 0 mod 1000
$

$x^3 + x + 87 = 0 mod 125$ has one solution.

$x^3 + x + 1 = 2x + 1 = 1 = 0 mod 2$ has no solutions!

So there are no solutions overall!

=

All we know is that $x^p = x mod p$.

==

$
  x^7 &= x mod 7 \
  x^11 &= x^5 mod 7
$

$
  x^7 &= x mod 7 \
  x^8 &= x^2 mod 7
$

So $x^11 + x^8 + 5 = 0 mod 7$ is same as $x^5 + x^2 + 5 = 0 mod 7$.

==

$
  x^7 &= x mod 7 \
  x^20 &= x^14 mod 7
$

$
  x^7 &= x mod 7 \
  x^14 &= x^8 mod 7
$
And we know that $x^8 = x^2 mod 7$ from above problem.

$
  x^7 &= x mod 7 \
  x^13 &= x^7 = x mod 7 \
$

So $x^20 + x^13 + x^7 + x = 2 mod 7$ is the same as $x^2 + x + x + x = x^2 + 3x = 2 mod 7$.

=

$p$ is prime, $d in NN$, $d | p - 1$.

We want to show that $f(x) = a^p - 1 mod p^n$ has $d$ solutions mod $p$. We know that $0 <= d <= p - 1$.

$
  f'(x) &= d x^(d - 1) mod p \
  // f'(a_1) &= d a_1^(d - 1) eq.not 0 mod p
$

Now our goal is to show that $f'(x) eq.not 0$ for any $x in ZZ\/p ZZ$.

We know that $d eq.not 0$, so the only way that $f'(x) = 0$ is if $h(x) = x^(d-1) = 0 mod p$ (as we are working mod $p$, and $0 in.not (ZZ\/ p ZZ)^times$, and is only element that is not a unit).

Now we show that $h(x) eq.not 0 mod p$ for any $x in ZZ \/ p ZZ$.

$x^(d - 1) = 0 mod p$ means that $x^(d - 1) = p k$ for some $k in ZZ$. But the only possible value that can divide the RHS is $p$, but $x eq.not p$ as $p = 0 mod p$, and we know that $x eq.not 0$. Hence there is no $x in ZZ \/ p ZZ$ (besides 0) which can make $x^(d - 1) = 0$. Therefore we have shown that $h(x) eq.not 0$ for any $x in ZZ \/ p ZZ$.

// We know this last line is true because in order for it to equal 0, $d = 0$ (which cannot happen as $d in NN$) or $a_1^(d - 1) = 0$. But this also cannot happen as $d <= p - 1$ so $a^(d - 1)$ cannot equal 0 (TODO! EXPLAIN MORE!).

So now we know that there must be unique lifts, which means that all $d in ZZ\/p ZZ$ get lifted once so there are always $d$ solutions at each level (each $n$ of $p^n$, and we know there are $d$ solutions in $ZZ \/ p ZZ$ by the theorem from class).

=

$p$ is prime.

==

$f$ is a monic polynomial in $ZZ\/p ZZ$ and has exactly $n$ roots in $ZZ \/ p ZZ$. Show that $f$ can be factored as $f(x) = (x - a_1)(x - a_2)...(x - a_n)$.

#proof[
  Let $g(x) = (x - u_1)(x - u_2)...(x - u_n)$. We know that $g$ must have $n$ roots ($u_1, ..., u_n$).

  Let $f(x) = x^n + a_(n-1)x^(n-1) + ... + a_1 x + a_0$.

  $
    h(x) &= f(x) - g(x) \
    &= x^n + a_(n-1) x^(n-1) + ... + x_1 x + a_0 - (x - u_1)...(x - u_n)
  $

  We can see that $h$ has degree _at most_ $n - 1$ at the highest order terms will cancel.

  If $h(x) eq.not 0$, then it can only have $n - 1$ roots at most (as it is a degree at most $n - 1$ in mod $p$, which can only have $n - 1$ roots). But it must have $n$ roots as $u_i$ is a root of $f$ and $g$.

  So $h(x) = 0$ (it is the zero function), hence $f$ can be factored like $g$, which is what we wanted.
]
==

$
  f(x) = x^(p - 1) - 1
$

We know that $x^(p - 1) = 0 mod p$ has $p - 1$ solutions to $x$, which is every number in $ZZ\/p ZZ$. So we can write $f$ as

$
  f(x) = (x - 1)(x - 2) ... (x - (p-1))
$

==

Plug in $f(p) = f(0)$ for the same $f$ as above.

$
  f(0) = 0^(p-1) -1 = -1 = underbrace((-1)(-2)...(p+1), (p-1)(p-2)...(1)) = (p-1)! mod p
$

=

==

$
  f(x) = x^3 - x mod 6
$

$f(0) = 0, f(1) = 0, f(2) = 6 = 0, f(3) = 24 = 0, f(4) = 60 = 0, f(5) = 120 = 0$.

==

$
  f(x) = product_(k=0)^(m-1)(x - k) = x(x - 1)(x - 2)...(x - (m-1))
$

All $x in ZZ\/m ZZ$ are roots as seen in the factored form. Hence $d(m) <= m$ as $f$ is degree $m$ and is identically zero for all $x in ZZ\/m ZZ$.

==

$
  g(x) = 0 mod p forall x in ZZ \/ p ZZ
$

We know that a polynomial of degree $n$ has at most $n$ solutions in mod p (from the theorem in class). But we cannot have more than $n$ solutions because there are only $n$ numbers! So $d(p) = p$.

==

Want to show if $m' | m$ and if $f(x) = 0 mod m forall x in ZZ\/m ZZ$, then $f(x) = 0 mod m' forall x in ZZ
\/m' ZZ$.

$m = m' k$ for some $k$.

$f(x) = m l forall x in ZZ\/m ZZ$ for some $l$.

$f(x) = m' l k forall x in ZZ\/m' ZZ$ for some $k, l$.

Hence $f(x) = 0 mod m'$ for all $x in ZZ \/ m' ZZ$.

So $d(m') <= d(m)$. If $f$ is identically zero mod $m$, it is also identically zero mod $m'$ for $m' | m$.

Let $m = 6, m' = 3$.

$f(x) = x^3 - x = 0 mod 6 forall x in ZZ \/ 6 ZZ$. This implies that $d(6) <= 3$.

$f(x) = 0 mod 3$ for all $x in ZZ \/ 3 ZZ$, hence $d(6) >= 3$. Hence $3 <= d(6) <= 3 ==> d(6) = 3$.

==

Show that $d(2 p) = p$ for odd primes.

Suppose that $g(x) = 0 mod 2 p forall x in ZZ \/ 2p ZZ$.

Then $g(x) = 0 mod p$ for all$ x in ZZ \/ p ZZ$. This implies that $g(x) = x(x-1)(x-2)...(x - (p-1))$, which means that $d(2p)$ is bounded above by $p$ (we have found a polynomial of degree $p$ which is identically zero, so we have created an upper bound on $d(2p)$).

Let $m' = p, m = 2p$. Then $m' | m$. So

$
  d(m') &<= d(m) \
  d(p) &<= d(2p) \
  p &<= d(2p)
$

So we have found the smallest possible degree of a polynomial to be identically zero mod $2p$.

Hence $p <= d(2p) <= p ==> d(2p) = p$.

// Then $g(x) = 0 mod 2 forall x in ZZ\/ 2 ZZ$ because $2 | 2 p$. Similarly, $g(x) = 0 mod p$ for all $x in ZZ \/ p ZZ$ because $p | 2p$.

// But then we know that $g$ must be degree $p$ as $g$ is identically zero mod $p$.

==

$p$ is prime, $f$ is a monic polynomial that is identically zero mod $p^2$.

Show $f$ and $f'$ are identically zero mod $p$.

We know that $f(x) = 0 mod p^2$ for all $x in ZZ \/ p^2 ZZ$. So $f'(x) = 0$ for all $x in ZZ \/ p ZZ$ as we cannot have unique lifts to have all $f(x) = 0 forall x in ZZ \/ p^2 ZZ$.

We also know that $f(x) = 0 mod p$ for all $x in ZZ \/ p ZZ$ as we need all $x in ZZ \/ p ZZ$ to satisfy $f(x) = 0 mod p$ (the "base" of our tree must have zeros for all $x$ if we are to lift every single $x in ZZ \/ p ZZ$).

// We know that $f(x) = 0 mod p^2 forall x in ZZ \/ p^2 ZZ$. So there must be a unique lift for all $x in ZZ \/ p ZZ$ which implies that $f'(x) eq.not 0 forall x in ZZ\/p ZZ$ as if $f'(x) = 0$ then we do not have a unique lift.

// We also know that $f(x) = 0 mod p forall x in ZZ\/ p ZZ$ as we need $p$ unique lifts to have $p$ zeros in $p^2$.

==

We want to show that there are no polynomials of degree 2 or 3 that are identically zero mod 4.

First check degree 2.

$
  f(x) = x^2 + a x + b
$

We need $f(0) = 0$, so $b = 0$. We also need $f(1) = 0$, so $a = -1$.

Hence our $f(x) = x^2 - x$, but $f(2) = 4 - 2 = 2 eq.not 0 mod 4$. So there is no degree 2 polynomial that is identically zero mod 4.

Now check degree 3.

$
  g(x) = x^3 + a x^2 + b x + c
$

For $g(0) = 0$, we need $c = 0$. We need $g(1) = 0$, so $a + b = -1 ==> a = -b - 1$.

We need $g(2) = 0$, so

$
  8 + 4a + 2b &= 0 \
  7 - 4(-b-1) + 2 b &= 0 \
  6b &= 12 \
  b &= 2
$

Plugging $b = 2$ in we get that $a = -3$.

Hence our polynomial is $g(x) = x^3 - 3x^2 + 2x$, but $g(3) = 27 - 27 + 6 = 6 eq.not 0 mod 4$.

We have shown that there is no polynomial of degree 2 or 3 that is identically 0 mod 4, so $d(4) = 4$.
