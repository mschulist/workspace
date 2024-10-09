#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Homework 3")

= Power Indices

$
  A = 5 quad B = 3 quad C = 3 quad D = 2 \
  q = 8
$

== Shapley-Shubik

We can enumerate the possible orderings to see the number of orderings that each voter is pivotal.

```py
voter_map = {
    0: 5,  # A
    1: 3,  # B
    2: 3,  # C
    3: 2,  # D
}

voters = np.array([0, 1, 2, 3])

all_permutations = np.array(list(itertools.permutations(voters)))

quota = 8

pivotal = [0, 0, 0, 0]

for i in range(len(all_permutations)):
    sum = 0
    for j in range(4):
        sum += voter_map[all_permutations[i][j]]
        if sum >= quota:
            pivotal[all_permutations[i][j]] += 1
            break
```

After running the above code, we find that the number of pivotal orderings for each voter is as follows:

$
  A = 10 quad B = 6 quad C = 6 quad D = 2
$

Therefore, the Shapley-Shubik power index for each voter is:

$
  "SSI"(A) &= 10 / 24 approx 0.42 \
  "SSI"(B) &= 6 / 24 = 0.25 \
  "SSI"(C) &= 6 / 24 = 0.25 \
  "SSI"(D) &= 2 / 24 approx 0.08
$

== Banzhaf

I will use the Banzhaf power calculator I made in class to calculate the Banzhaf power index for each voter.

My calculator uses the method described in _Mathematics and Politics_ that involves finding all winning coalitions and doing row sums depending on if the voter is present or not in each of them.

My code outputs ```py array([0.41666667, 0.25 , 0.25 , 0.08333333])```, which is identical to the Shapley-Shubik power index.

$
  "BFI"(A) &= 0.42 \
  "BFI"(B) &= 0.25 \
  "BFI"(C) &= 0.25 \
  "BFI"(D) &= 0.08
$

= Hill-Huntington Method Lesson Plan

Ideally, this lesson would be performed interactively, where the students are the "representatives" and the spot they stand in are the "states" where each state will have a number corresponding to its population.

I would begin the lesson by motivating the idea that will eventually lead to the HH method. First, I would ask students to attempt to disperse themselves in a manner they believe is most fair. Once they settle, I will write the $"representative count" / "population"$ for each state in order to show who has more representatives than they _should_ have (if no rounding needed to take place).

Once the students see their "score" I will ask them to suggest ways that they can rearrange themselves to make the apportionment more fair. Some of the changes will be obvious, but eventually they will need to decide how to round.

I will introduce the idea of "f-rounding" where we construct a function $f$ that will take a real number and return an integer that has been rounded.

$
  f: RR^+ -> ZZ^+
$

After showing a few examples of "rounding up," "rounding down," and "rounding like a human," I will show that none of these guarantee it is impossible for "trading" a representative to decrease the deviations from the unrounded number of representatives.

I will ask the students if they have any ideas, which they may have but will probably not include the geometric mean f-rounding. If they are able to come up with it on their own I would be very impressed.

I will introduce the geometric mean f-rounding function and show WHY it works by arranging the students (who are acting as representatives) according to the function. Once they are arranged, I will demonstrate that moving someone would result in a higher deviation, and we are at the "best" apportionment with our scoring metric.

