#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import emoji: mango, banana


#show: project.with(title: "Homework 2")


=

#let Z5_cells = ()

#for x in range(6) {
  for y in range(6) {
    if y == 0 {
      Z5_cells.push(([#x],))
    }
    Z5_cells.push(([#calc.rem(x * y, 6)],))
  }
}

#set table(
  fill: (x, y) => {
    if x == 0 or y == 0 {
      blue
    }
  },
)

#figure(
  table(
    columns: 7,
    stroke: white,
    table.header([$times$], [0], [1], [2], [3], [4], [5]),
    ..for c in Z5_cells {
      c
    }
  ),
  caption: [Multiplication table for $ZZ\/6ZZ$],
)

=

==

$
  f: ZZ \/ 11 ZZ -> ZZ \/ 11 ZZ \
  x arrow.bar x^3 - 2x^2 + 4
$

$
  f(5) &= 79 equiv 2 mod 11
$

==

- $0$ is not invertible because $0 x = 0$ for any $x in ZZ \/ 11ZZ$
- $1$ is invertible because $1 dot 1 equiv 1 mod 11$
- $2 dot 6 equiv 1 mod 11$
- $3 dot 4 equiv 1 mod 11$
- $4 dot 3 equiv 1 mod 11$
- $5 dot 9 equiv 1 mod 11$
- $6 dot 2 equiv 1 mod 11$
- $7 dot 8 equiv 1 mod 11$
- $8 dot 7 equiv 1 mod 11$
- $9 dot 5 equiv 1 mod 11$
- $10 dot 10 equiv 1 mod 11$

==

$
  5 x equiv 3 mod 11
$

$
  9(5x) equiv& 3 dot 9 mod 11 \
  ==> quad x equiv& 27 mod 11 \
  ==> quad x equiv& 5 mod 11
$

=

==

#proof[
  $
    n - 1 equiv& -1 mod n \
    (n-1)^100 equiv& 1 mod n
  $
  Therefore, $(n-1)^100$ is congruent to $1 mod n$. Because $(n-1)^100$ is congruent to $1 mod n$, it is always 1 larger than a multiple of $n$ by definition of modulo.
]


==

#proof[
  $
    (n - 2)^6 equiv& 33 mod n
  $
  Therefore, $n$ must divide $33 - (n-2)^6$.
  $
    n |& 33 - (n - 2)^6 \
    n |& 33 - underbrace(n(...), n "divides") - 2^6 \
    n |& 33 - 2^6 \
    n |& -31
  $
  So $n$ must divide $-31$. Because $31$ is prime, the only possible positive values for $n$ are $31$ or $1$.
]

==

#proof[
  $
    7^n equiv 17^n mod 8
  $
  We know that $7 equiv -1 mod 8$ and $17 equiv 1 mod 8$, so we can insert these facts into the given equation.

  $
    1^n - (-1)^n equiv& 0 mod 8 \
    1^n equiv& (-1)^n mod 8
  $
  This is only true when $n$ is even, so $n$ must be even.
]

==

#proof[
  $
    3^n equiv r mod 13
  $
  There are 3 cases (when $n$ is 0, 1, or 2 greater than a multiple of 3).

  If $n = 3 k$ for some $k in ZZ$:
  $
    3^(3k) &equiv r mod 13 \
    27^k &equiv r mod 13 \
    1^k &equiv r mod 13
  $
  Therefore, if $n$ is a multiple of $3$, then $r$ will be $1$.

  If $n = 3 k + 1$ for some $k in ZZ$:
  $
    3^(3k + 1) &equiv r mod 13 \
    3 dot 3^(3k) &equiv r mod 13 \
    3 dot 1 &equiv 1 mod 13
  $
  So if $n$ is one more than a multiple of 3, then $r$ will be 3.

  If $n = 3k + 2$ for some $k in ZZ$:
  $
    3^(3 k + 2) &equiv r mod 13 \
    9 dot 1 &equiv r mod 13
  $
  So if $n$ is two more than a multiple of 3, then $r$ will be 9.
]

=

==

$
  a in ZZ, b = 2 k + 1
$

#proof[
  $
    a^2 + 2b &= a^2 + 2(2 k + 1) \
    &= a^2 + 4 k + 2
  $

  AFSOC that there exists a number $(x)$ that when squared, equals $a^2 + 4 k + 2$.

  We can use the fact that $x^2 equiv 0, 1 mod 4$ ($x^2$ cannot be congruent to 2 or 3 mod 4).

  $
    x^2 &equiv a^2 + 4 k + 2 mod 4 \
    2 &equiv a^2 - x^2 mod 4 \
  $
  There are no values for $x$ and $a$ where this equation is true. The only possible values it can be are 0, 1, or 3. Hence, $a^2 + 2b$ cannot be a perfect square.
]

==

#proof[
  $
    n equiv 4 mod 5
  $

  $
    0^4 &equiv 0 mod 5 \
    1^4 &equiv 1 mod 5 \
    2^4 &equiv 1 mod 5 \
    3^4 &equiv 1 mod 5 \
    4^4 &equiv 1 mod 5 \
  $

  The maximum value for $a^4$ (and $b^4$ and $c^4$) in mod 5 is 1 (and the only other value is 0), so $1 + 1 + 1$ is the largest value $a^4 + b^4 + c^4$ can take, which is less than $n$, which itself is congruent to 4 mod 5.

  In other words, $a^4 + b^4 + c^4 equiv 3 mod 5$ is the largest value this sum can take on, so it can never be congruent to 4 mod 5.
]

=


$
  11 | n <==> 11 | a_0 - a_1 + a_2 - a_3 + ... + (-1)^r a_r
$

#proof[
  We know that $10 equiv -1 mod 11$.
  $
    n &= 10^r a_r + 10^(r-1)a_(r-1) + ... + 10^1 a_1 + a_0 \
    &equiv (-1)^r a_r + (-1)^(r-1) a_(r-1) + ... + (-1)^1 + a_0
  $
  Which is the definition of this divides rule (where the plus and minus alternatives for every term).
]

$
  2 - 8 + 5 - 9 + 1 - 0 + 3 = -6
$

So no, 11 does not divide 3019582.


=

#proof[
  $
    n &= 10^r a_r + 10^(r-1)a_(r-1) + ... + 10^1 a_1 + a_0
  $

  The division rule for 7 can be written as follows:

  $
    3 sum_(i = 1)^r 10^(i-1) a_i + a_0 &equiv 0 mod 7
  $

  We know that $3 equiv 10 mod 7$, so we can sub that in and bring the coefficient into the sum.

  $
    (sum_(i = 1)^r 10^i a_i) + a_0 &equiv 0 mod 7 \
    underbrace(sum_(i = 0)^r 10^i a_i, n) &equiv 0 mod 7
  $
  So therefore $n equiv 0 mod 7$ when this rule holds.
]

=

==


$
  1 &arrow.bar 9 \
  0 &arrow.bar 4 \
  13 &arrow.bar 17
$

#banana

$
  (9)(4)(17)(4)(17)(4)
$

Decrypting these using the following Python code yields ("JERERE")

```Python
chr(x + 97)
```
Where `x` is the numeric character code (0 is A...).



==

We can find the inverse of 5 in mod 26.

$
  5 dot 21 equiv 1 mod 26
$

So 21 is the inverse of 5 in mod 26.

$
  &"M"& quad &"E"& quad &"R"& quad &"I"& quad &"W" \
  &12& &4& &17& &8& &22
$


*M*

$
  5 x + 4 &equiv 12 mod 26 \
  5 x &equiv 8 mod 26 \
  21(5 x) &equiv 168 mod 26 \
  x &equiv 12 mod 26
$

So $M arrow.bar M$

*E*

$
  5 x + 4 &equiv 4 mod 26 \
  5 x &equiv 0 mod 26 \
  x &equiv 0 mod 26
$

So $A arrow.bar E$

*R*

$
  5x + 4 &equiv 17 mod 26 \
  5x &equiv 13 mod 26 \
  21 dot 5 &equiv 13 dot 21 mod 26 \
  x &equiv 13 mod 26
$

So $N arrow.bar R$

*I*

$
  5x + 4 &equiv 8 mod 26 \
  5x &equiv 4 mod 26 \
  21 dot 5 x &equiv 84 mod 26 \
  x &equiv 6 mod 26
$

So $G arrow.bar I$

*W*

$
  5 x + 4 &equiv 22 mod 26 \
  5 x &equiv 18 mod 26 \
  12 dot 5 &equiv 18 dot 21 mod 26 \
  x &equiv 14 mod 26
$

So $O arrow.bar W$.

#text([MANGO #mango], fill: orange, size: 24pt)

=

==

$a x equiv k mod m$ has a solution if and only if $(a,m) | k$.

#proof[
  $(==>)$

  $
    a x = k + m l
  $
  for some $l in ZZ$

  Let $a = alpha (a, m)$ and $m = u(a, m)$.

  Then:

  $
    a x - m l &= k \
    ==> quad (a,m)underbrace((alpha x - u l), in ZZ) &= k
  $
  So $(a,m) | k$.

  $(<==)$

  (1) we know that $(a, m) l = k$. \
  (2) we know that $(a,m) = a x + m y$ (Bezout's identity)

  Then subbing (2) into (1).

  $
    (a z + m y) l &= k \
    a z l + m y l &= k \
    a underbrace((z l), x) = k + m underbrace((- y l), in ZZ)
  $
  So $a x equiv k mod m$.
]

==

Choose $a = 5, m = 10, k = 5$. Then $(a,m) = 5$.

$
  5x &equiv 5 mod 10
$

Solutions to $x$ are $1,3,5,7,9$, which is $5 = (a,m)$ solutions...

Choose $a=2, m = 8, k = 2$. Then $(a,m) = 2$.

$
  2x &equiv 4 mod 8
$

Solutions to $x$ are $2,6$, which is $5 = (a,m)$ solutions...

So my conjecture is:
_If $(a,m) | k$, then the equation $a x equiv k mod m$ has exactly $(a,m)$ solutions modulo $m$._

=

==

#proof[
  Let $z = a_1 + b_1$ and $w = a_2 + b_2$.

  Then:
  $
    z dot w &= (a_1 + b_1 i) (a_2 + b_2 i) \
    &= (a_1 a_2 - b_1 b_2) + i(a_1 b_2 + a_2 b_1)
  $

  The norm of $z dot w$ is:

  $
    N(z w) &= (a_1 a_2 - -b_1 b_2)^2 + (a_1 b_2 + a_2 b+1)^2 \
    &= a_1^2 a_2^2 + b_1^2 b_2^2 - 2a_1 a_2 b_1 b_2 + a_1^2 b_2^2 + a_2^2 b_1^2 + 2a_1 a_2 b_1 b_2 \
    &= a_1^2 a_2^2 + b_1^2 b_2^2 + a_1^2 b_2^2 + a_2^2 b_1^2 \
    &= (a_1^2 + a_2^2)(b_1^2 + b_2^2) \
    &= N(z) N(w)
  $

  Therefore, $N(z w) = N(z) N(w)$.
]

==

#proof[
  Suppose there exists $x, y in ZZ[i]$ such that $x dot y = 2 + i$.

  Then:
  $
    N(x) N(y) &= N(2 + i) \
    &= 5
  $
  So $N(x)$ (or $N(y)$) can only be $1$ or $5$ as $5$ is prime in $ZZ$. But because the norm of $2+i$ can only be factored into two terms, we conclude that $2 + i$ is prime in $ZZ[i]$. We can complete the same steps for $2 - i$ because it has the same norm as $2 + i$ to show that $2-i$ is prime in $ZZ[i]$.

  Because $2 + i | 5$ but $N(2 + i) = 5 != 1$ or $N(5)$, we conclude that $5$ is not prime in $ZZ[i]$.
]

==

#proof[
  $p in ZZ$ is prime.

  Choose $x dot y = p$.
  Then:

  $
    N(x) N(y) &= N(p) \
    N(x) N(y) &= p^2
  $

  So $N(x) = 1, p, "or" p^2$ since $p$ is prime. We choose $N(x)$ instead of $N(y)$ (without loss of generality), but the same cases apply to $N(y)$.

  If $N(x) = 1, p^2$ then we have satisfied the requirements $p$ being prime in $ZZ[i]$.

  If $N(x) = p$ and $x = a + b i$, then $N(x) = a^2 + b^2$. Since $p = a^2 + b^2 equiv 3 mod 4$, we know that such an $a$ and $b$ cannot exist to give congruence mod 4, so $N(x)$ is never equal to $p$.

  So... $N(x) = 1$ or $N(x) = p^2 = N(p)$. So $p$ is prime in $ZZ[i]$
]

==

$
  13 = (2 + 3 i) (2 - 3i)
$

If $x y = 2 + 3 i$, then $N(x) = 1$ or $13$, so $2 plus.minus 3 i$ is prime in $ZZ[i]$.

