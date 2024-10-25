#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *
#import "../relation_diagrams.typ": relation_diagram

#let proof = thmproof("proof", "Proof")
#show: thmrules.with(qed-symbol: $square$)

#show: project.with(title: "Homework 6")

=

$
  R = {(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (2,3), (3,2), (4,5), (5,4), (4,6), (6,4), (5,6), (6,5)}
$

$
  [1] &= {1} subset R \
  [2] &= {2, 3} subset R \
  [4] &= {4, 5, 6} subset R
$

=

$
  A = {1,2,3,4,5,6}
$

#proof[
  We can first prove reflexivity. We know that $forall a in A, a = a dot 1$. Therefore, we have shown that $|$ is reflexive.

  To prove transitivity, we need to show that if $a|b$ and $b|c$, then $a|c$.

  $
    b = a dot n_1 quad &c = b dot n_2 \
    &c = a dot (n_1 dot n_2) \
    ==> &a|c
  $

  We have shown that divides is transitive.
]

=

$
  x R y <=> x^2 + y^2 "is even"
$

==

#proof[
  We can first prove that $R$ is reflexive. We know that $x^2 + x^2 = 2x^2$ is even because any number multiplied by 2 is even. Therefore, we have shown that $R$ is reflexive.

  To prove that $R$ is symmetric, we need to show that if $x R y$, then $y R x$.

  $
    x^2 + y^2 "is even" \
    ==> y^2 + x^2 "is even" \
  $

  Addition is commutative, so we have shown that $R$ is symmetric.

  To prove that $R$ is transitive, we need to show that if $x R y$ and $y R z$, then $x R z$.

  $
    x^2 + y^2 "is even and"& y^2 + z^2 "is even" \
    x^2 + y^2 &= 2n_1 quad y^2 + z^2 = 2n_2 "for some" n_1, n_2 in ZZ \
    x^2 + 2y^2 + z^2 &= 2n_1 + 2n_2 \
    x^2 + z^2 &= 2(n_1 + n_2 - y^2) \
    ==> x &R z
  $
]

==

This relation just compares the parity of $x, y in ZZ$. If $x, y$ are both even or both odd, then $x R y$. Otherwise, $x eq.not R y$.

Therefore, the two equivalence classes are:

$
  [0] &= {... ,-4 ,-2 ,0, 2, 4, ...}\
  [1] &= {..., -5, -3, -1, 1, 3, 5, ...}
$

=


==

#proof[
  We can construct a relation that is symmetric and transitive but not reflexive.

  #relation_diagram(())

  In this case, $R = emptyset$. This relation is symmetric because there are no tuples to check for symmetry. It is also transitive because there are no tuples to check for transitivity. However, it is not reflexive because not every element is related to itself.
]

==

#proof[
  Suppose $R, S$ are equivalence relations on $A$. We need to show that $R union S$ is also an equivalence relation on $A$.

  We can show that $R union S$ is reflexive. We know that $R, S$ are reflexive, so $forall a in A, a R a and a S a$. Therefore, $forall a in A, a (R union S) a$. $R$ and $S$ both contain the diagonal elements, so their union will also contain the diagonal elements.

  We can show that $R union S$ is symmetric. We know that $R, S$ are symmetric, so $forall a, b in A, a R b ==> b R a and a S b ==> b S a$. Therefore, $forall a, b in A, a (R union S) b ==> b (R union S) a$. $R$ and $S$ both contain the symmetric elements, so their union will also contain the symmetric elements.

  We can show that $R union S$ is transitive. We know that for each set individually, $a R b and b R c ==> a R c and a S b and b S c ==> a S c$. Therefore, $forall a, b, c in A, a (R union S) b and b (R union S) c ==> a (R union S) c$. $R$ and $S$ both contain the transitive elements, so their union will also contain the transitive elements.
]