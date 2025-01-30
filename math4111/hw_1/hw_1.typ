#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"


#show: project.with(title: "Homework 1")

= 1.1

$
  r in QQ quad x in.not QQ
$

Show $r + x$ and $r dot x$ are not rational.

#proof[
  Suppose $r + x in QQ$, where $r = p / q$

  $
    p / q + x &= a / b \
    ==> quad x &= a / b + p / q \
    ==> quad x &= (a q - p b) / (b p) quad arrow.zigzag
  $

  This contradicts assumption that $x$ is not rational, hence $r + x in.not QQ$.

  Suppose $r dot x in QQ$, with $r = p / q$.

  $
    p / q x &= a / b \
    ==> quad x &= (a q) / (b p) quad arrow.zigzag
  $
  Contradicts assumption that $x$ is not rational, hence $r dot x in.not QQ$.
]

= 1.2

Show $exists.not r in QQ$ such that $r^2 = 12$.

#proof[
  Let $r = p / q$.

  $
    p^2 / q^2 &= 12 \
    p^2 &= 12 q^2
  $

  We can see that $3$ must divide both the LHS and RHS, so $3|p^2 ==> 3|p$.

  Therefore, we can write $p = 3a$.

  $
    9a^2 &= 12q^2 \
    ==> quad 3a^2 &= 4q^2
  $

  Now we can see that $3|3a^2$ so $3$ must divide $q$. But then if $3$ divides $q$ and $p$, the quotient cannot be in lowest terms. $arrow.zigzag$

  Hence, there does not exists a $r in QQ$ with $r^2 = 12$.
]

// =

// Proposition 1.15:

// (a): $x y = x z ==> y = z$ \
// (b): $x y = x ==> y = 1$ \
// (c): $x y = 1 ==> y = 1 / x$ \
// (d): $1 / (1 \/ x) = x$

// #proof[
//   (a)

//   Suppose $x y = x z$.

//   $
//     y &= 1 dot y quad& "(M4)" \
//     y &= (x / x) dot y quad& "(M5)" \
//     y &= (x dot y) / x quad& "(M3)" \
//     y &= (x dot z) / x quad& "(given)" \
//     y &= z quad& "(M5)"
//   $

//   (b)

//   Suppose $x y = x$.

//   $
//     y &= 1 dot y quad& "(M4)" \
//     y &= x / x dot y quad& "(M5)" \
//     y &= (x dot y) / x quad& "(M3)" \
//     y &= x / x quad& ("given") \
//     y &= 1 quad& ("M5")
//   $

//   (c)

//   Suppose $x y = 1$

//   $
//     y &= 1 dot y quad& "(M4)" \
//     y &= (x dot y) / x quad& "(M5, M4)" \
//     y &= 1 / x quad& "(given)"
//   $

//   (d)

//   $
//     x &= 1 dot x quad& "(M4)" \
//     x &= x / x dot x quad& "(M5)" \
//     x &= x / (x dot x / x) x quad& "(M5)" \
//     x &= x / x x / x 1 / (1 / x) quad& "(M5)" \
//     x &= 1 / (1 / x)
//   $
// ]

= 1.4

$E$ is nonempty subset of ordered set.

$alpha$ is lower bound of $E$

$beta$ is upper bound of $E$

Show $alpha <= beta$

#proof[
  $
    alpha <=& p forall p in E \
    beta >=& p forall p in E
  $
  Therefore if we combine the inequalities:

  $
    alpha <= p forall p in E <= beta \
    ==> quad a <= beta
  $
]

= 1.5

$A$ nonempty subset of $RR$, bounded below.

$-A = {-x | x in A}$

Show that $inf A = - sup(-A)$.

#proof[
  Suppose $y <= x forall x in A$, and $y$ is a lower bound of $A$.

  Then $-y >= -x forall -x in (-A)$

  So $-A$ is bounded above by $-y$ which is $- inf(A)$

  So:
  $
    -inf(A) &= sup(-A) \
    inf(A) &= - sup(-A)
  $
]

