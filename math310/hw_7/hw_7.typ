#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *
#import "../relation_diagrams.typ": relation_diagram

#let proof = thmproof("proof", "Proof")
#show: thmrules.with(qed-symbol: $square$)

#show: project.with(title: "Homework 7")

#let tru = [T]
#let fal = [F]

=

#figure(
  table(
    columns: 5,
    stroke: white,
    column-gutter: (auto, 2.2pt, 2.2pt, 2.2pt),
    $P$, $Q$, $P and Q$, $Q => (P and Q)$, $P => (Q => (P and Q))$,
    tru, tru, tru, tru, tru,
    tru, fal, fal, tru, tru,
    fal, tru, fal, fal, tru,
    fal, fal, fal, tru, tru,
  ),
)

=

#figure(
  table(
    columns: 6,
    stroke: white,
    column-gutter: (auto, auto, 2.2pt, auto, 2.2pt),
    $P$, $Q$, $R$, $P or Q$, $R and P$, $(P or Q) <=> (R and P)$,
    tru, tru, tru, tru, tru, tru,
    tru, tru, fal, tru, fal, fal,
    tru, fal, tru, tru, tru, tru,
    fal, tru, tru, tru, fal, fal,
    fal, tru, fal, tru, fal, fal,
    tru, fal, fal, tru, fal, fal,
    fal, fal, tru, fal, fal, tru,
    fal, fal, fal, fal, fal, tru,
  ),
)

=

==

$
  P and (Q or R) eq.triple (P and Q) or (P and R)
$

We need to show that the truth tables are identical on both sides for all inputs ($P, Q, R$).

#figure(
  table(
    columns: (auto, auto, auto, 4em, auto, auto, auto, auto),
    stroke: white,
    column-gutter: (auto, auto, 2.2pt, auto, auto, 2.2pt, auto),
    table.header[$P$][$Q$][$R$][$Q or R$][$P and Q$][$P and R$][$P and (Q or R)$][$(P and Q) or (P and R)$],
    tru, tru, tru, tru, tru, tru, tru, tru,
    tru, tru, fal, tru, tru, fal, tru, tru,
    tru, fal, fal, fal, fal, fal, fal, fal,
    tru, fal, tru, tru, fal, tru, tru, tru,
    fal, tru, tru, tru, fal, fal, fal, fal,
    fal, tru, fal, tru, fal, fal, fal, fal,
    fal, fal, tru, tru, fal, fal, fal, fal,
    fal, fal, fal, fal, fal, fal, fal, fal,
  ),
)

As we can see, the last 2 columns are the same, so we can say that the two statements are equal.


==

$
  P or (Q and R) eq.triple (P or Q) and (P or R)
$

#figure(
  table(
    columns: (auto, auto, auto, 4em, auto, auto, auto, auto),
    stroke: white,
    column-gutter: (auto, auto, 2.2pt, auto, auto, 2.2pt, auto),
    table.header[$P$][$Q$][$R$][$Q and R$][$P or Q$][$P or R$][$P or (Q and R)$][$(P or Q) and (P or R)$],
    tru, tru, tru, tru, tru, tru, tru, tru,
    tru, tru, fal, fal, tru, tru, tru, tru,
    tru, fal, fal, fal, tru, tru, tru, tru,
    tru, fal, tru, fal, tru, tru, tru, tru,
    fal, tru, tru, tru, tru, tru, tru, tru,
    fal, tru, fal, fal, tru, fal, fal, fal,
    fal, fal, tru, fal, fal, tru, fal, fal,
    fal, fal, fal, fal, fal, fal, fal, fal,
  ),
)

Same as above, we can see that the last 2 columns are the same, therefore they are equal statements.

=

$
  (a, b) ~ (c, d) <=> a + d = c + b
$

Reflexive:

We need to show that $(a, b) ~ (a, b)$. Substituting in values shows:

$
  a + b = a + b
$

Therefore, this relation is reflexive.

Symmetric:

We need to show that $(a, b) ~ (c, d) <=> (c, d) ~ (a, b)$.

$
  a + d = c + b <=> c + b = a + d
$

Because the equals sign on $NN$ is symmetric, we can say that $~$ is also symmetric.

Transitive:

We need to show that if $(a, b) ~ (c, d)$ and $(c, d) ~ (e, f)$, then $(a, b) ~ (e, f)$.

$
  a + d = c + b &quad c + f = e + d \
  &quad c = e + d - f \
  a + cancel(d) = e + cancel(d) - f + b&quad \
  a + f = e + b
$

The final line is the definition of $(a, b) ~ (e, f)$. Therefore, we have shown that $~$ is transitive.

=

$
  (a, b) ~ (c, d) <=> a d = b c
$

Reflexive:

$
  (a, b) ~ (a, b)\
  ==> quad a b = b a
$

Symmetric:

$
  (a, b) ~ (c, d) <=> (c, d) ~ (a, b) \
  ==> a d = b c <=> c b = d a
$

Multiplication is commutative, so this property holds.

Transitive:

Want to show:
$
  (a, b) ~ (c, d) and (c, d) ~ (e, f) => (a, b) ~ (e, f) \
$

We can use definition of the relation:

$
  a d = b c &quad c f = d e \
  &quad c = (d e) / f \
  a cancel(d) = b (cancel(d) e) / f &quad \
  a f = b e &quad
$

This last line is the definition of the relation we want to show, so we have proven that $~$ is transitive.