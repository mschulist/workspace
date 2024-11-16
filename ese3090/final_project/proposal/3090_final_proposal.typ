#import "../../template.typ": *

#show: project.with(title: [Final Project Proposal: \ Empirical Banzhaf Indices])

#set math.equation(numbering: "(1)")

= Inspiration

Over the past few elections, I have been disappointed in how few Americans vote. Most of them just seem to not care because their vote _doesn't matter_ (of course, this would be solved with a popular vote, but oh well _democracy_). I would like to be able to respond with "well actually, your vote matters $x$ amount relative to other people," but I've never been able to find a good way of phrasing my thoughts into a convincing argument.

When we talked about power indices in class, my immediate thought was to apply them to the US states and the electoral college. Upon learning about the time complexity of Banzhaf $(cal(O)(2^n))$, I became disappointed. Then, I learned about generating functions and was amazed. Of course, the paper talking about generating functions had already applied their method to the US electoral college, rendering my ideas useless...

But then I becane to ponder what the power indices really _measured_. Do they measure true power, or just power in an ideal world of equally likely outcomes? Does California really have more power than Pennsylvania? In our ideal world, yes, but there's a reason that the _AP_ calls the CA race immediately but can take days to call the PA race.

= Execution

My goal is to (using @heard_empirical_1998), determine the *empirical Banzhaf Indices* for each state in the US. Of course, the problem of the large sample space reappears (unless I discover a nice generating function, which I doubt I will).

To get over the large sample space problem, I will divide the US into "blocks" that represent psuedo-states that have always voted together. For example, New York and California have voted the same in every election since 1988, so they can (along with many other similar states) be grouped togther.

= Bayesian Statistics

We let $i_j in {0, 1}$ represent that voter $j$ votes yes/no and $p_(i_1 ... i_m)$ be the probability in a random election.

There are $m$ voting members (so in the case of the US without blocks, $m = 51$).

We let $n = sum x_(i_1 ... i_m)$ be the total number of past elections where all $m$ parties were present.

After much multiplication, we get the estimates for our voting probabilities.

$
  hat(p)_(i_1 ... i_m) = 1 / 2 (x_(i_1 ... i_m) + x_(i'_1 ... i'_m) + 1) / (n + 2^(m - 1))
$

$x_(i'_1 ... i'_m)$ represents the complement to $x_(i_1 ... i_m)$, in other words, the number of times the particular winning coaliation voted no ($0$).

For example, if we have $m = 2, n = 5$, we could have $x_(1 1) = 3, x_(0 0) = 1, x_(0 1) = 1, x_(1 0) = 0$. As we can see, the number of elements of $bold(x)$ grows as $2^m$, so this can get costly to compute for large values of $m$.

Computing $hat(p)_(0 0) = hat(p)_(1 1)$:

$
  1 / 2 (3 + 1 + 1) / (5 + 2^(2 - 1)) = 5 / 14
$

#bibliography("banzhaf.bib", style: "institute-of-electrical-and-electronics-engineers")