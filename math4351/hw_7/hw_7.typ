#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 7")

=

==

===

$
  log_2(8) &= a \
  2^a &= 8 mod 11 \
  a &= 3
$

===

$
  log_6(3) &= a \
  6^a &= 3 mod 11 \
  a &= 2
$

===

$
  log_6(3) &= a \
  6^a &= 3 mod 13 \
  a &= 8
$

==

===

$
  x^7 &= 8 mod 11
$

2 is a primitive root mod 11. Let $g = 2$. We know that $log_2(8) = 3$, so let $x = 2^k$.

$
  (2^k)^7 &= 2^3 mod 11 \
  7k &= 3 mod 10 \
  k &= 9 mod 10
$

So $x = 2^9 = 6 mod 11$.

===

$
  x^4 = 3 mod 11
$

We know that $log_6(3) = 2$, and let $x = 6^k$.

$
  (6^k)^4 &= 6^2 mod 11 \
  4 k &= 2 mod 10 \
  k &= 3, 8
$

So $x = 6^3 = 7 mod 11$ and and $x = 6^8 = 4 mod 11$ are solutions.

===

$
  x^3 = 3 mod 13
$

We know $log_6(3) = 8$. Let $x = 6^k$.

$
  (6^k)^3 &= 6^8 mod 13 \
  3k &= 8 mod 12
$

There are no solutions, so there are no solutions to $x^3 = 3 mod 13$.

=

$g in (ZZ\/p ZZ)^times$, $g$ primitive root.

Suppose $log_(g)(b)$ is computable for $b in (ZZ\/p ZZ)^times$.

Show we can now solve $a^x = b mod p$ for any $a, b in (ZZ \/ p ZZ)^times$.

Let $a = g^k$ for some $k in ZZ$.

Then

$
  (g^k)^x &= b mod p \
  g^(k x) &= b mod p
$

Compute $log_(g)(b) = d$.

$
  k x &= log_(g)(b) mod p - 1 \
  k x &= d mod p - 1 \
  k^(-1) k x &= d k^(-1) mod p - 1 \
  x &= d k^(-1) mod p - 1
$


=

$p = 1373, g = 2, A = 974, b = 871$

$
  B = 2^871 = 805
$

$
  B' = A^b = 974^871 = 397
$

So the shared secret is 397.

=

==

$m = 583, B = 469, k = 877$.

$c_1 = g^k = 719, c_2 = m B^k = 623$

So send $(719, 623)$.

==

$a = 299$. $A = g^a = 34$.

$c_1 = 661, c_2 = 1325$.

$
  m &= c_2 c_1^(-299) \
  &= 1325 dot 661^(-299) \
  &= 1325 dot (661^(-1))^299 \
  &= 1325 dot 794 \
  &= 332 mod 1373
$


==

$B = 893 = g^b ==> b = 219$.

$c_1 = 693, c_2 = 793$.

$693 = g^k ==> k = 932$.

$
  793 &= (g^b)^k m \
  792 &= (2^219)^932 m \
  ==> m &= 365
$

=

$p, g, A$ public.

$c_(i, 1)$ will be the same for all $i$ so Eve can see that $k$ has not changed.

$
  c_(i, 2) dot c_(j, 2)^(-1) &= m_i m_j^(-1) (g^(a k)) (g^(a k))^(-1) \
  &= m_i m_j^(-1)
$

Taking the inverse of $c_(j, 2)$ is an _easy_ computation!

To decrypt all messages $m_i$ for $2 <= i <= n$, Eve does the following.

She can find $m_1$ and knows $m_1 g^(a k)$. So she easily finds $m_1^(-1)$ to compute $m_1 g^(a k) m_1^(-1) = g^(a k)$. Then she inverts this to get $g^(-a k)$.

She can use $g^(-a k)$ to find $m_i$ because $c_(i, 2) = m_i g^(a k)$, and all $k$ are the same regardless of $i$. She just does $c_(i, 2) g^(-a k) = m_i$.

=

If Eve has a DHP oracle, show she can break EP.

Goal: use DHP oracle to solve $m = c_2 c_1^(-a) = m(g^a)^k (g^k)^(-a)$ given $g^a, g^k, m(g^a)^k$.

We can use DHP to compute $g^(a k)$ and then invert using easy operations. So we have $g^(-a k)$. Then we can multiply this by $c_2$ to get $m$.

$
  c_2 dot g^(-a k) = m g^(a k) g^(- a k) = m
$

=

==

$
  u &= m^a \
  v &= u^b = m^(a b) \
  w &= v^a = m^(a b a') \
  m &= w^(b') = m^(a a' b b')
$

We can see that $a a' = 1 mod p - 1$ and $b b' = 1 mod p - 1$. So $a' = a^(-1)$ and $b' = b^(-1)$ in $ZZ \/ (p-1) ZZ$.

If we start with $m = m^(a a' b b') mod p$ and then take the $log_m$ of both sides, we get $1 = a a' b b' mod p-1$, so it makes sense that $a'$ is the inverse of $a$ mod $p - 1$ and same with $b'$ and $b$.

So the general version of this system involves Alice picking a message $m$ and private key $a$ (along with $a' = a^(-1) mod p - 1$). Then Bob picks private key $b$ (along with $b' = b^(-1) mod p - 1$). Using the scheme described in the problem set, we can get $m$ from Alice to Bob without anyone else knowing it. And above we have shown that this will work in general due to how the discrete log works (bring it from mod $p$ to mod $p - 1$).

==

Show if Eve can solve DLP she can solve this system.

Eve knows $u, v, w$. She can use the fact that $v = u^b$ to find $b$. Similarly, she can use $w = v^(a')$ to find $a'$. Then she can find $b'$ and $a$ using the inverse mod $p - 1$. Once she knows $a, a', b, b'$ she can break this system and solve for $m$ (by exponentiating the public terms, like doing $u^(a a' b b') = m$).

==

If Eve has a DHP oracle, then she does not necessarily have the ability to solve DLP. Hence she cannot necessarily solve for $m$.

Given $g^(a) mod p$ and $g^b mod p$, Eve can solve for $g^(a b) mod p$ because she has an DHP oracle. But in this problem, we want to solve for the value in the exponent, not multiply the exponents of two values. In this system, we continually multiply more values in the exponent, so combining exponents will never allow to find the inverse of the value in the exponent.

For example, given $v = m^(a b)$ and $u = m^a$, we can compute $m^(a a b)$, but that does not get us closer to inverting the values of the exponent to solve for $m$.


