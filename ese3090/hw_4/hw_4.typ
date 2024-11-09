#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 4")


= Dispute Resolution I

Envy-free. Let $a_i$ be the items given to $A$ and $b_i$ the items to $B$. Also, let $V_(A)(x)$ be the valuation of item $x$ to entity $A$.

Then for an allocation to be envy-free:

$
  sum V_(A)(a_i) >= sum V_(A)(b_i) \
  sum V_(B)(b_i) >= sum V_(B)(a_i) \
$

In the case of 2 parties, each person must get at least $1/2$ of their total valuation for the above equations to hold.

For more than 2 parties, each person's total valuation of all items must be equal, let's say that it sums to $1$. Because the valuation of their items must be larger than their valuation of the items allocated to any other person, we can guarantee that, according to their own valuation, at least $1 / n$ of their valuation is in their possession.

For example, if everyone had the same valuation, they would end up with $1 / n$ of the items (equally split). This is the minimum case, normally they will get more than $1 / n$ (while still being envy-free).

= Beatpath

== Pareto

Suppose $A$ is always preferred to $B$. Then, the strength of the path from $B -> A$ is $n$ where $n$ is the number of voters. Therefore, we can guarantee that the strongest path $B -> A$ is $n$ because you cannot have a stronger path than $n$.

Then, it is impossible for $B$ to win because it must lose to $A$, which is the Pareto condition.

== Reversal Symmetry

Suppose $A$ is the unique winner. Then, reversing the ballots is equivalant to reversing all of the arrows on the graph. When we reverse the arrows, we can guarantee that $A$ will lose because another party will be guaranteed to beat it (as $A$ was unique winner before).

If $A$ was not a unique winner (winner but not unique), then when we reversed the arrows the path strength could stay constant (if they tied with everyone else originally).