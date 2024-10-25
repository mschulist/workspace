#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *
#import "../relation_diagrams.typ": relation_diagram

#let proof = thmproof("proof", "Proof")
#show: thmrules.with(qed-symbol: $square$)

#show: project.with(title: "Homework 5")

=

#align(
  center,
  [
    If $A subset.eq B$ and there is an injection $f: B -> A$, then $|A| = |B|$
  ],
)

#proof([
  If there exists an injection $f: B arrow.hook A$, then we know that $|A| >= |B|$. Similarly, we know that if $A subset.eq B$, then $|B| >= |A|$. This is because if $A subset.eq B$, then there exists an injection $g: A arrow.hook B$. By the Cantor-Schroeder-Bernstein theorem, if there is an injection in both directions between $A$ and $B$, then there exists a bijection between $A$ and $B$. Because there is a bijection between $A$ and $B$, $|A| = |B|$.
])

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

A relation is a subset of $A times A$, and the set of all subsets of $A times A$ is $cal(P)(A times A)$. This has a cardinality of $2^(|A times A|) = 2^(|A|^2)$.

== Reflexive Relations

A relation $R$ is reflexive if $(a, a) in R$ for all $a in A$.

// We know that there are $2^(|A|) - 1$ ways to _not_ have a reflexive relation. For each $a in A$, $(a, a)$ must be in $R$, and there are $|A|$ _times_ that we have these reflexive tuples in $R$. Therefore, the number of ways to turn each of them "on" and "off" is $2^(|A|)$. Of course, one of those ways is having all of the reflexive tuples in $R$, so we need to subtract that.

// So therefore, the number of reflexive relations is $2^(|A|^2) - 2^(|A|) - 1$.

We need to make sure that the middle diagonal is in the set, and then turn on and off all other elements in the relation. There are $(|A|^2) - |A|$ total elements that can be turned on and off, so we just raise 2 to that value.

$
  2^(|A|^2 - |A|)
$

== Symmetric Relations

A relation $R$ is symmetric if $(a, b) in R$ implies $(b, a) in R$ for all $a, b in A$.

Here, we just need to find the number of ways that we can turn on and off half of the elements including the diagonal. Essentially, we just need to add back the other half of the diagonal $((|A|) / 2)$ to $(|A|^2) / 2$. So we get $(|A|) / 2 + (|A|^2) / 2$ possible items to turn on and off, which corresponds to the following number of symmetric relations.

$
  2^((|A|^2 + |A|) / 2)
$

== Transitive Relations

A relation $R$ is transitive if $(a, b) in R$ and $(b, c) in R$ implies $(a, c) in R$ for all $a, b, c in A$.

It has been shown that there is no polynomial function that generates the number of transitive relations, and nobody has found a general function for the number of transitive relations. So our hope of finding one is...minimal...

=

$
  A = {a, b, c}
$

1. Reflexive, symmetric, and transitive relation on $A$:

// $
//   R_1 = {(a, a), (b, b), (c, c), (a, b), (b, a), (a, c), (c, a)}
// $

#relation_diagram((
  ("a", "a"),
  ("b", "b"),
  ("c", "c"),
  ("a", "b"),
  ("b", "a"),
  ("b", "c"),
  ("c", "b"),
  ("a", "c"),
  ("c", "a"),
))

// Here, $a$ is related to itself, $b$ is related to itself, and $c$ is related to itself. $a$ is related to $b$, and $b$ is related to $a$. This relation is reflexive, symmetric, and transitive.

2. Reflexive, non-symmetric, non-transitive relation on $A$:

#relation_diagram((
  ("a", "a"),
  ("b", "b"),
  ("c", "c"),
  ("a", "b"),
  ("b", "c"),
))

// $
//   R_2 = {(a, a), (b, b), (c, c), (a, b), (b, c)}
// $

// This is reflexive because each element is related to itself. However, it is not symmetric because $(a, b) in R_2$ but $(b, a) in.not R_2$. It is also not transitive because $(a, b) in R_2$ and $(b, c) in R_2$ but $(a, c) in.not R_2$.

3. Reflexive, symmetric, non-transitive relation on $A$:

// $
//   R_3 = {(a, a), (b, b), (c, c), (a, b), (b, a), (b, c), (c, b)}
// $

// This is reflexive because each element is related to itself. It is symmetric because if $(a, a) in R_3$, then $(a, a) in R_3$. It is not transitive because there are no instances of $a R_3 b$ where $a, b$ are distinct.

#relation_diagram((
  ("a", "a"),
  ("b", "b"),
  ("c", "c"),
  ("a", "b"),
  ("b", "a"),
  ("b", "c"),
  ("c", "b"),
))

4. Non-reflexive, non-symmetric, transitive relation on $A$:

// $
//   R_4 = {(a, b), (b, c), (a, c)}
// $

// Here, no element is related to itself so $R_4$ is not reflexive. It is not symmetric because $(a, b) in R_4$ but $(b, a) in.not R_4$. It is transitive because $(a, b) in R_4$ and $(b, c) in R_4$ implies $(a, c) in R_4$.

#relation_diagram((
  ("a", "b"),
  ("b", "c"),
  ("a", "c"),
))

5. Non-reflexive, non-symmetric, non-transitive relation on $A$:

// $
//   R_5 = {(a, b), (b, c), (c, a)}
// $

// This is not reflexive because no element is related to itself. It is not symmetric because $(a, b) in R_5$ but $(b, a) in.not R_5$. It is not transitive because $(a, b) in R_5$ and $(b, c) in R_5$ but $(a, c) in.not R_5$.

#relation_diagram((
  ("a", "b"),
  ("b", "c"),
))

6. Non-reflexive, symmetric, transitive relation on $A$:

// $
//   R_6 = {(a, b), (b, a), (b, c), (c, b), (a, c), (c, a)}
// $

// Again, no element is related to itself so this is not reflexive. It is symmetric because if $(a, b) in R_6$, then $(b, a) in R_6$. It is transitive because $(a, b) in R_6$ and $(b, c) in R_6$ implies $(a, c) in R_6$.

#relation_diagram(())

This is where $R = emptyset$.

7. Non-reflexive, symmetric, non-transitive relation on $A$:

// $
//   R_7 = {(a, b), (b, a), (b, c), (c, b)}
// $

// There are no elements related to themselves so this is not reflexive. It is symmetric because if $(a, b) in R_7$, then $(b, a) in R_7$. It is not transitive because $(a, b) in R_7$ and $(b, c) in R_7$ but $(a, c) in.not R_7$.

#relation_diagram((
  ("a", "b"),
  ("b", "a"),
  ("b", "c"),
  ("c", "b"),
))

8. Reflexive, non-symmetric, transitive relation on $A$:

#relation_diagram((
  ("a", "a"),
  ("b", "b"),
  ("c", "c"),
  ("a", "b"),
  ("b", "c"),
  ("a", "c"),
))

// $
//   R_8 = {(a, a), (b, b), (c, c), (a, b), (b, c), (a, c)}
// $

// Here all elements are related to themselves so $R_8$ is reflexive. It is not symmetric because $(a, b) in R_8$ but $(b, a) in.not R_8$. It is transitive because $(a, b) in R_8$ and $(b, c) in R_8$ implies $(a, c) in R_8$.