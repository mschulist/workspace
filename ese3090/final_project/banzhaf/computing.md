# Computing the Conditional Probability for Each Voter

Computing $S_2$ means that we take the sum of all probabilities of winning coalitions. We first need to loop through every coalition and find the indices that correspond to a winning coalition. Then we can go through the probabilities of each index and sum them up.

To compute $S_1 subset.eq S_2$ for a given voter $v$ we need to first discard all of coalitions in $S_2$ where $v$ is not present. Then, we go through the remaining coalitions and test to see if removing $v$ (flipping their value in the index from 1 to 0) makes the coalition no longer win. If it does make them no longer win, then we add that probability to a running accumulator.

Finally, we divide the accumulator by the sum of all probabilities in $S_2$ to get the conditional probability that $v$ is pivotal.
