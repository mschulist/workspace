#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 6")

=

Show that $x^2 = -1 mod p$ has a solution if and only if $p = 1 mod 4$.

#proof[
  $(==>)$ Assume $x^2 = -1 mod p$. From the Euler criterion, $(-1)^((p-1)/2) = 1 mod p$. $p = 1, 3 mod 4$ for $(p-1)/2$ to make sense.
  - If $p = 3 mod 4$, then $(-1)^((3 + 4 k - 1)/2) = (-1)^(1 + 2k) = -1 mod p$ so by Euler there is no solution.
  - If $p = 1 mod p$, then $(-1)^((1 + 4k - 1)/2) = (-1)^(2k) = 1$ so there is a solution.

  Hence $p = 1 mod 4$.

  $(<==)$ Assume $p = 1 mod 4$. Then
  $
    (-1)^((p-1) / 2) &= (-1)^(2k) = 1 \
    ==> quad a &= x^2 mod p "for" a in (ZZ\/p ZZ)^times \
    ==> quad -1 &= x^2 mod p "has solution"
  $
]

=

==

$
  m in NN, a in (ZZ \/ m ZZ)^times
$

Let $h$ be the order of $a (mod m)$. Show that for all $i, j in ZZ$, $a_i = a^j mod m <==> i = j mod h$.

#proof[
  $(==>)$ Assume $a^i = a^j mod m$. Then $a^(i-j) = 1 mod m$. So $h | i - j ==> i = j mod h$.

  $(<==)$ Assume $i = j mod h$. Then $h | i - j ==> a^(i-j) = 1 mod m$. So $a^i = a^j mod m$.
]

==

Show $2^n = 4 mod 7 <==> n = 2 mod 3$.

The order of $2 mod 7$ is $h = 3$.

#proof[
  $(==>)$ Suppose $2^n = 2^2 mod 7$. Then $n = 2 mod 3$ by (a).

  $(<==)$ Suppose $n = 2 mod 3$. Then $2^n = 2^2 mod 7$.
]

==

Which $n in ZZ$ is $2^n = 5 mod 7$.

The order of $2 mod 7$ is $h = 3$.

$2^1 = 2, 2^4 = 2$\
$2^2 = 4, 2^5 = 4$ \
$2^3 = 1, 2^6 = 1$

This cycle repeats so there is no $n in NN$ where $2^n = 5 mod 7$.

==

$3^n = 2 mod 7$

The order of $3 mod 7$ is 6. So 3 is a primitive root.

$3^1 = 3$\
$3^2 = 2, 3^8 = 2, ..., 3^(6k + 2) = 2$

So $n = 6k + 2$ for any $k in ZZ$. Hence $n = 2 mod 6$

$5^n = 4 mod 11$. The order of 5 mod 11 is 5.

So $5^(5k + 3) = 4$ as $5^3 = 4 mod 11$.

So $n = 5k + 3$ for any $k in ZZ$. Hence $n = 3 mod 5$.

=

$p$ odd prime, $g$ primitive root mod p.

==

Show that $g^((p-1)/2) = -1 mod p$.

#proof[
  $
    g^((p-1) / 2) &= a mod p \
    g^(p-1) &= a^2 mod p \
    ==> quad a^2 &= 1 mod p \
    a &= plus.minus 1 mod p
  $

  If $a = 1$, i.e. $g^((p-1)/2) = 1 mod p$, then the order of $g$ is at most $(p-1)/2$. But $g$ is primitive so the order of $g = p - 1 arrow.zigzag$.

  So $a = -1$. Hence $g^((p-1)/2) = -1 mod p$.
]

==

Show $-g$ is a primitive root if and only if $p = 1 mod 4$.

#proof[
  Let $r$ be the order of $(-g)$.

  So $(-g)^r = 1 mod p$.

  Then write $g = -(-g)$.

  $
    g^2 &= (-g)^2 mod p \
    g^(2r) &= (-g)^(2r) mod p \
    g^(2r) &= 1 mod p
  $

  So $p - 1 | 2r$ as $g$ is a primitive root.

  Either $r = p-1$ or $r = (p-1)/2$. From (a) we know that $g^((p-1)/2) = -1 mod p$.

  $
    (-g)^((p-1) / 2) &= (-1)^((p-1) / 2) g^((p-1) / 2) mod p \
    (-g)^((p-1) / 2) = (-1)^((p-1) / 2) (-1) &= (-1)^((p+1) / 2) mod p
  $ <3b-odd-prim>

  For $-g$ to be primitive, $(-g)^((p-1)/2) eq.not 1 mod p$. So $(p+1)/2$ must be odd if and only if $-g$ is a primitive root (by @3b-odd-prim).

  Hence

  $
    (p+1) / 2 &= 2k + 1 \
    p + 1 &= 4k + 2 \
    p &= 1 mod 4
  $

  If $p = 3 mod 4$, then $(-g)^((p-1)/2) = 1 mod p$, and then $-g$ would not be a primitive root.

]

=

$p eq.not 3$ prime.

==

Suppose $p = 1 mod 3, a in (ZZ\/p ZZ^times)$. Show $x^3 = a mod p$ has a solution if and only if $a^((p-1)/3) = 1 mod p$.

#proof[
  $(==>)$ Suppose $x^3 = a mod p$ has a solution.

  Let $a = x^3$. Then $a^((p-1)/3) = x^(p-1) = 1 mod p$.

  $(<==)$ Let $g$ be a primitive root and $a^((p-1)/3) = 1 mod p$.

  Write $a = g^k$ for some $k = 0,1,2,...,p-2$.

  Then $(g^k)^((p-1)/3) = 1 ==> g^((k(p-1))/3) = 1 mod p$.

  Since $p - 1$ is the order of $g$, $p-1 | (k(p-1))/3 ==> 3 | k ==> k = 3 l$ for some $l in ZZ$.

  So $a = g^k = g^(3l) = (g^l)^3$. Hence $a$ is a cube.
]

==

Show that $1/3$ of the elements in $(ZZ\/p ZZ)^times$ are cubes.

#proof[
  Let $g$ be a primitive root mod $p$. Then $g^k = a$ is a cube if $3 | k$. So every third element of $(ZZ\/ p ZZ)^times$ is a cube, hence $1 / 3$ of the elements are cubes. We know that we can write all elements of $(ZZ\/ p ZZ)^times$ as $g^k$ for some $k$, so we have shown that a third of the elements are cubes.
]

==

$(ZZ\/13ZZ)^times$. $g = 2$ is a primitive root.

$2^12, 2^9, 2^6, 2^3$ are cubes mod 13. These are all of the exponents that divide 12 of a primitive root mod $13$.

==

$p = 2 mod 3$.

There are 4 cubes mod 5, 10 cubes mod 11, 16 cubes mod 17.

// My conjecture is that there are $(p-1)/2$ cubes mod p (with $p = 2 mod 3$).

// TODO! Prove this.

My conjecture is that there are $p - 1$ cubes mod $p$ if $p = 2 mod 3$. So every unit is a cube if $p = 2 mod 3$.

We want to show that if $p = 2 mod 3$, every unit $a in (ZZ\/p ZZ)^times$ has a unique solution to $x^3 = a mod p$.

#proof[
  Let $g$ be a primitive root mod $p$, and write $a = g^k$.

  We can also see that (by FLT) $a = g^(k + (p - 1)) mod p$ and $a = g^(k + 2(p-1)) mod p$.

  So by the definition of $p = 2 mod 3$

  $
    k = k mod 3 \
    k + (p - 1) &= k + 1 mod 3 \
    k + 2(p - 1) &= k + 2 mod 3
  $

  Hence for any $k$, we have found that there exists an $a$ (with the corresponding exponent) such that $a$ is a cube. So all units are cubes mod $p$ if $p = 2 mod 3$.
]


=

==

$a in (ZZ\/13 ZZ)^times$, $h$ is order of $a$.

Suppose $a^4 eq.not 1 mod 13$ and $a^6 eq.not 1 mod 13$.

$1, 2, 3, 4, 6$ are divisors of $p - 1 = 12$. Let the order of $a$ be $h$. We know that $h | 12$.

$h divides.not 4$ and $h divides.not 6$ but $h | 12$. So $h = 12$, which means that $a$ is a primitive root mod 13.

==

$a in (ZZ\/31 ZZ)^times$, $h$ is order of $a$.

$1, 2, 3, 6, 10, 15$ divide $30 = p - 1$.

Let $x = 6, y = 10, z = 15$.

If $a^x eq.not 1 mod 31$ and $a^y eq.not 1 mod 31$ and $a^z eq.not 1 mod 31$, then $h = 30 ==> a$ is a primitive root.

This statement is correct because the prime factors of $30$ are $2, 3, 5$, and $30/2 = 15, 30/3 = 10, 30/5 = 6$. Hence if we check if $a$ to the power of these three values is not equal to one, then it can not be equal to one for any of the divisors of $p - 1$.
