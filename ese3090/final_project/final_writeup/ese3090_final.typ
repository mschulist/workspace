#import "../../template.typ": *

#show: project.with(title: [ESE3090 Final Project: \ Empirical Banzhaf Indices])


#set math.equation(numbering: "(1)")

= What is Power?

== Naive Approach

The notion of power in a status quo election is much more complex than first meets the eye. In a status quo election, each voter is assigned a _weight_, and the item being voted on passes if the sum of the weights of the voters voting _yes_ passes a threshold (_quota_).

On first thought, power seems like it must be proportional to the weight of each voter. For example, in the US electoral college, it seems reasonable that California's _power_ should be $55 / 538 approx 0.10$. If this were true, then what would be the interpretation of this number? From our formulation of power, it's not entirely clear what the significance of this number corresponds to.

This naive approach to power breaks down with the following example. Imagine we have three voters and their corresponding weights $a = 49, b = 50, c = 2$ with quota $q = 51$. If we go through all possible ways that these three voters can win (ie the _winning coalitions_), we will find that voter $b$'s $50$ votes are no more useful than voter $a$'s $49$ votes. In other words, it is clear the $a$ and $b$ should have the same amount of power despite having different weights.

== Banzhaf Power

From the above example, we can see that a more natural way of viewing power is as the _power to prevent_. Essentially, this boils down to "in how many winning coalitions is a voter pivotal?" Being pivotal means that if you take the voter out, that coalition would no longer win.

By reforming our notion of power to be _how often is a voter pivotal_ makes the interpretation of power easier, but makes the math much more challenging. For one, the number of total coaltions (which is on the same order as the number of winning coalitions) is $2^m$ where $m$ is the number of voters. This exponential growth means that computing power indices for large collections of voters (like the 51) is very difficult (we ignore generating functions as they will not help with the next step).

== But wait, is this the entire power picture?

From a purely theoretical point of view, yes. But, as is often the case in applied math, the real world is full of experiences not available in our theoretical models. Remember, our goal is to compute the _power_ in an election. Should power include prior information we have about an election? Does California really have as much power as a normal the normal Banzhaf indices say (about $11.4$)? While California might be large, it seems unreasonable to say that it has a large amount of power considering its vote is pretty much guaranteed to be blue.

= Empirical Power

== Adopting a probabilistic mindset

In traditional Banzhaf indices, the probability of any given coalition _existing_ is equal. This means that there is an equal chance of Texas and California voting the same as not voting the same. Of course, in reality there is a very unequal chance of this occurring.

To get a power index that relies on past election data, we need to _update_ the probabilities of coalitions existing. In practice this looks like a lot of statistics, which has thankfully been done by the authors of @heard_empirical_1998.

$
  hat(p)_(i_1 ... i_m) = 1 / 2 (x_(i_1 ... i_m) + x_(i'_1 ... i'_m) + 1) / (n + 2^(m - 1))
$ <posterior>

@posterior shows the posterior probability that a given coalition will exist. Each coalition is indexed by $i_1 ... i_m$, where $i_j = 1$ if voter $j$ is in the coalition and $0$ otherwise.

The $x_(i_1 ... i_m)$ (and its complement) represent our past data points. With $n$ prior elections, the sum of all of the $x_(i_1 ... i_m) = n$ because we have $n$ prior data points. Clearly, if $m$ is large and $n$ is small, these prior data points will have a minuscule impact on the probabilities that a given coalition will occur as (most of the time) $x_(i_1 ... i_m)$ will equal $0$.


In the case where $n = 0$, where $n$ is the number of past elections, all of the probabilities reduce to:

$
  hat(p)_(i_1 ... i_m) = 1 / 2^m
$ <posterior-reduced>

@posterior-reduced makes sense because without prior data (ie if we did not know that CA and TX will vote differently) every coalition should be equally likely to occur.

== Probabilities to Power

Now that we have the probabilities of each coalition occurring, we need to transform them into the same notion of _power to prevent_. We want to calculate the conditional probability that a voter is pivotal given that they are in a winning coalition

$
  P(v_i "pivotal" | "winning coalition")
$

To do this, we need to take the following sums

$
  (sum_S_1 p_(i_1 ... i_m)) / (sum_S_2 p_(i_1 ... i_m))
$

where $S_2$ is the set of all indices of winning coaltions and $S_1 subset.eq S_2$ such that the voter $v$ of interest is pivotal in each coalition in $S_2$.

$
  S_1(v) = {c in S_2|"voter" v "pivotal in" c}
$ <s_1>

@s_1 shows that $S_1$ depends on the voter, so we will need to calculate $S_1$ for each voter in our election.

= US Electoral College

== Reality strikes again

It would be very nice if we could apply this probabilistic technique to get the "empirical" power for each US state. Unfortunately, there does not exist a nice generating function to obtain these indices for large number of voters, unlike for the traditional Banzhaf index.

To "solve" (more like work around) this problem, I decided to group together "similar" states (they have voted the same since 2000) to reduce the number of voters. Of course, grouping states can completely ruin the indices due to the discreteness of the problem. Additionally, to collapse the 51 states (DC included) into 20 while ensuring the each group had voted the same since 2000 meant that many of the psuedo-states (groups of states) are quite large while others are quite small.

== Even sadder reality strikes again...

After building my psuedo-states and much debugging, I eventually was able to compute the empirical power indices for my 20 psuedo-states. Rather unfortunately, just 6 past elections was not enough to cause any significant change to the power indices.

Looking at @posterior, we can see that the probabilities only change (a significant amount, if we ignore the $n << 2^(m - 1)$) in a _very, very_ small percentage of the coalitions. Sadly, this means that @posterior essentially just reduces to @posterior-reduced if we ignore minuscile differences.

Table 2 in @heard_empirical_1998 shows the empirical banzhaf power for each provinces in the 10 Canadian provinces. With only 10 provinces and 17 previous elections (half the number of voters and about triple the number of prior data elections compared the this paper), the probabilities do not change more than 1.2%. It is no wonder that @empirical-indices shows such little change...

#let empirical_power = csv("../data/probs_to_change_both.csv")

#let _ = empirical_power.remove(0)

#set table(stroke: (x, y) => {
  (bottom: white)
})

#figure(
  table(
    columns: (250pt, auto, auto),
    table.header([States in Group], [Empirical Index], [Equally Likely Index]),
    ..empirical_power.flatten()
  ),
  caption: [Banzhaf Indices Computed Using @heard_empirical_1998 for Election Data from 2000-2020],
) <empirical-indices>

@empirical-indices does show something interesting (and somewhat unrelated): there are two very large blocks of US states that have always voted the same since 2000 (until 2020). While I was attempting to group states under the constraint of ensuring that they have voted the same in all previous elections, I was forced to create the 2 large psudeo-states in order to keep the number of "voters" to 20. In some sense, this grouping alone represents what it means to be a swing state (where any state outside of the 2 large groups could be considered a swing state).

== Effect of grouping states

While my idea of using prior election data may not be feasible (at least using the approach in @heard_empirical_1998), we can still compare the effect that grouping states had on their power.

We know the traditional power indices for each state, so we can see if the sum of the indices for each state in each psuedo-state aligns with the power for each psuedo-state.

#let grouped_comparison = csv("../data/electoral_college_banzhaf_all_data.csv")

#figure(
  table(
    columns: (250pt, auto, auto),
    table.header([States in Group], [Sum of Banzhaf], [Scaled Grouped Index]),
    ..grouped_comparison.flatten()
  ),
  caption: [Comparison of the sum of individual Banzhaf indices and the index from the entire group],
) <grouped-comparison>

The reason that the grouped index and the empirical Banzhaf indices are so different is that the sum of the empirical Banzhaf indices do not equal one (necessarily), so I have normalized them here so that the comparison with the sum of the traditional Banzhaf indices are comparable.

Most of the states stay somewhat constant, with the large blue group (with CA and NY) becoming much more powerful and the large red block (with Alabama and Mississippi) becoming far less powerful.

While I do not have a conclusive answer to why this is the case, I believe that because the large blue group has vastly more votes than any other group, they _almost_ have veto power in the election. Their (near) veto power allows them to have very high empirical Banzhaf score (around 0.9), which means that they are necessary in 90% of winning coalitions.

Attempting to group states changes the dynamics of this discrete system in unexpected ways, especially under the constraint that all states in a single group must have voted the same in past elections.



#bibliography("banzhaf.bib", style: "institute-of-electrical-and-electronics-engineers")

Code is available at #link("https://gist.github.com/mschulist/fa2d7a8e6beaf7ed0bf7bad4a85e0ad2")