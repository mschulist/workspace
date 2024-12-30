#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *
#import "../relation_diagrams.typ": relation_diagram

#show: project.with(title: "Homework 8")



=

$
  a in NN
$

==

Want to show: each $a in NN$ is either even or odd

#proof[
  Suppose $a != 2 k$ or $a != 2l + 1$ $forall a in NN$.

  Base case: $a = 0$. $0$ is trivially even.

  If $a = 2 k$ is even, then $S(a)$ is odd.

  $
    S(a) &= S(2k) \
    S(a) &= 2 k + 1
  $

  If $a = 2 k + 1$ is odd, then $S(a)$ is even.

  $
    S(a) &= S(2k + 1) \
    S(a) &= 2 k + 2 \
    S(a) &= 2 underbrace((k + 1), in NN)
  $

  So therefore, we have shown that irregardless of the value of $n in NN$, $n$ will be odd or even.
]

==

#proof[
  Want to show: $forall a in NN, a$ is not even *and* odd.

  To be even and odd, $a$ must be equal to $2 k$ and $2 l + 1$ for some $k, l in NN$.

  $
    2 l + 1 &= 2 k \
    S("even") &= "even" arrow.zigzag
  $

  So therefore, $a$ cannot be both an even and odd number.
]

==

Want to show: $a^2$ is even iff $a$ is even.

#proof[
  Let $a = 2 k$. Proof that iff $a$ is even, $a^2$ is even.
  $
    (2k)(2k) &= 2(2k k) \
    &= 2 l quad l in NN
  $

  Let $a = 2k + 1$
  $
    (2k + 1) (2k + 1) &= 4k^2 + 4k + 1 \
    &= 2underbrace((2k^2 + 2k), l) + 1 \
    &= 2l + 1
  $
]

// #proof[
//   We can first prove that if $a$ is even, then $a^2$ must also be even. From the definition of an even number, we know that $a = 2 k$.

//   We can use induction to show that this must be true for all elements of $NN$.

//   Base case: $a = 0, a^2 = 0$, both of which are trivially even.

//   THIS LOGIC IS WRONG AS n $n+1$ is odd if $n$ is even!

//   Inductive step: Assume that $a^2 = 2 l$. We know that $a = 2 p$ for some $p in NN$. Want to show that $(a + 1)^2 = 2 k$ for some $k in NN$.

//   $
//     (a + 1)^2 &= 2 k \
//     a^2 + 2a + 1 &= 2 k \
//     2 l + 2 a + 1 &= 2 k \
//   $
// ]

=

Want to show: there does not exist $r in QQ$ such that $r^2 = 2$.

#proof[
  Suppose there exists an $r = p / q in QQ$ such that $r^2 = 2$. We know that $p$ and $q$ do not share any factors because then the fraction could be reduced.

  $
    p^2 / q^2 &= 2 \
    p^2 &= 2 q^2
  $

  Therefore, $p$ must be even because $p^2$ must be even and that implies that $p$ is even.

  Let $p = 2h$ because $p$ is even.

  $
    4 h^2 &= 2 q^2 \
    2 h^2 &= q^2
  $

  Therefore, $q$ must also be even. But that means that $q$ and $p$ share a factor of $2$, which they cannot. $arrow.zigzag$

  Therefore, there does not exist a $r in QQ$ such that $r^2 = 2$.
]

=

Want to show: every subset of $RR$ that is bounded below has a greatest lower bound.

#proof[
  Suppose that $A subset RR$ that has a lower bound. Also suppose that we define $RR$ to be the right sides of the dedekind cuts.

  $
    M = union.big_(G in A) G
  $

  $M$ consists of all dedekind cuts that are greater than $A$.

  Claim: $M$ is greatest lower bound for $A$.

  Given lower bound $L$ for $A$.

  $
    G subset U forall G in A ==> union.big_(G in A) G subset U ==> M <= U
  $
]

=

$
  lim a_n = a \
  lim b_n = b
$

==

Want to show: $lim(a_n + b_n) = a + b$

#proof[
  We need to show the following hold true
  $
    abs((a_n+b_n)-(a+b)) < epsilon
  $
  for any $epsilon > 0$ and for all $n > N$.

  $
    abs(a_n - a) < epsilon / 2 \
    abs(b_n - b) < epsilon / 2
  $

  We know that each sequence individually holds true for an $N_a$ and $N_b$ that corresponds to each sequence. If we take $N = max(N_a, N_b)$, then we know that the both sequences must individually be within $epsilon / 2$ of their corresponding limits.

  $
    "triangle ineq" ==> quad abs(a_n - a + b_n - b) &<= abs(a_n - a) + abs(b_n - b) \
    &< epsilon / 2 + epsilon / 2 = epsilon
  $
]

==

Want to show: $lim a_n / b_n = a / b$

