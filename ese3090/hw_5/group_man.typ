#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 5")


= Condorcet is $cancel(bold("not"))$ Group-manipulable

Let $X$ be the group of voters attempting to manipulate, with sincere profile $B$ and insincere profile $B'$.

All voters $in.not X$ has same ballots $in B, B'$. Voters $in X$ prefer $B'$ to $B$.

Say we have the following ballot $B$:

#figure(
  table(
    columns: 5,
    stroke: white,
    $v_1$, $v_2$, $v_3$, $v_4$, $v_5$,
    $a$, $a$, $b$, $c$, $c$,
    $b$, $c$, $c$, $b$, $b$,
    $c$, $b$, $a$, $a$, $a$,
  ),
  caption: [Profile $B$],
)

Pairwise competitions:

a vs. b: (2, 3) so b wins \
b vs. c: (2, 3) so c wins \
c vs. a: (3, 2) so c wins

c is undefeated, so c is the Condorcet winner.

Let's manipulate the last 2 voters.

#figure(
  table(
    columns: 5,
    stroke: white,
    $v_1$, $v_2$, $v_3$, $v_4$, $v_5$,
    $a$, $a$, $b$, $b$, $b$,
    $b$, $c$, $c$, $c$, $c$,
    $c$, $b$, $a$, $a$, $a$,
  ),
  caption: [Profile $B'$],
)

Pairwise competitions:

a vs. b: (2, 3) so b wins \
b vs. c: (3, 2) so b wins \
c vs. a: (3, 2) so c wins

So we have shown that Condorcet is in fact group manipulable by constructing a counterexample.