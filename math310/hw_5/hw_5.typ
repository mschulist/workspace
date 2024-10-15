#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *

#let proof = thmproof("proof", "Proof")
#show: thmrules.with(qed-symbol: $square$)

#show: project.with(title: "Homework 3")

=

#align(
  center,
  [
    If $A subset.eq B$ and there is an injection $f: B -> A$, then $|A| = |B|$
  ],
)

=

$
  A = {1, 2, 3, 4, 5, 6}
$

==

$
  < = {
    &(1, 2), (1, 3), (1, 4), (1, 5), (1, 6) \
    &(2, 3), (2, 4), (2, 5), (2, 6) \
    &(3, 4), (3, 5), (3, 6) \
    &(4, 5), (4, 6) \
    &(5, 6)
  } subset A times A
$

==

$
  <= = {
    &(1,1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6) \
    &(2, 2), (2, 3), (2, 4), (2, 5), (2, 6) \
    &(3, 3), (3, 4), (3, 5), (3, 6) \
    &(4, 4), (4, 5), (4, 6) \
    &(5, 5), (5, 6) \
    &(6, 6)
  } subset A times A
$

==

$
  | = {
    &(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6) \
    &(1, 2), (1, 3), (1, 4), (1, 5), (1, 6) \
    &(2, 4), (2, 6) \
    &(3, 6)
  } subset A times A
$

=

==

$
  R = RR times RR \\ {(x, x) | x in RR}
$

This is the relation $eq.not$ for two real numbers. If we graph this set in the Cartesian plane, we get all points _except_ for points on the diagonal, which are the points where $x = y$.

==

$
  S = {(x, y) | x, y in RR, x > y}
$

This is the relation "greater than" for two real numbers. I changed the notation of $S$ to show the $>$ more clearly.

=

== All Relations

A relation is a subset of $A times A$, and the set of all subsets of $A times A$ is $cal(P)(A times A)$. This has a cardinality of $2^(|A times A|)$.

== Reflexive Relations

A relation $R$ is reflexive if $(a, a) in R$ for all $a in A$.

== Symmetric Relations

A relation $R$ is symmetric if $(a, b) in R$ implies $(b, a) in R$ for all $a, b in A$.

== Transitive Relations

A relation $R$ is transitive if $(a, b) in R$ and $(b, c) in R$ implies $(a, c) in R$ for all $a, b, c in A$.

=

$
  A = {a, b, c}
$

