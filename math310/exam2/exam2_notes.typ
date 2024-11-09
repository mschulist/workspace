#import "../template.typ": *

#set page("us-letter", columns: 2, numbering: "1", number-align: center, margin: 0.5in)
#set text(size: 10pt)
#set par(justify: true)
#set math.equation(numbering: "(1)")

#let proof = thmproof("proof", "Proof", inset: (top: 0em, left: 0em, right: 0em))
#show: thmrules.with(qed-symbol: $square$)

== Inj. one way, surj. other way

$
  A, B "sets", A eq.not emptyset \
  exists "inj" A arrow.hook B <==> exists "surj" B arrow.twohead A
$

#proof[
  $(==>)$ Suppose we have inj $i: A arrow.hook B$. We can restrict the cod($i$) to get a bij.

  $
    i': A arrow.hook "range"(i)
  $

  $i'$ has an inverse $i'^(-1): "range"(i) -> A$.

  $
    f: B -> A \
    f(b) = cases(
      i'^(-1) &"if" b in "range"(i),
      a &"otherwise"
    )
  $

  $(<==)$ Suppose we have surj $s: B arrow.twohead A$.

  For each $a in A$, pick $f(a) in s^(-1)(a)$. This defines $f: A arrow.hook B$.
]

== Cantor-Schröder-Bernstein

$
  "If" &exists "inj" A arrow.hook B \
  "and" &exists "inj" B arrow.hook A \
  "then" &exists "bij" A -> B
$

== Finiteness

A is finite when $|A| = |underline(n)|$, $n in NN$.
$underline(0) = emptyset$.

== Infiniteness

1. $A$ is infinite if $A$ is not finite.

$
  |A| eq.not |underline(n)| forall n in NN union {0}
$

2. $A$ is _Dedekind infinite_ if there exists a proper subset $A_1 subset.neq A$ such that $|A| = |A_1|$.

3. $A$ is infinite if $|NN| <= |A|$. In other words, if it is at least as big as the natural numbers, which is the smallest infinite set.

=== Shifting Formula

$
  "bij" f: (a, b) -> (c, d) \
  f(x) = (x - a) / (b - a) (d - c) + c
$

== Induction

If $A subset.eq NN$ is inductive and $1 in A$, then $A = NN$.

== Contrapositive

$
  P ==> Q <==> not Q ==> P
$

== Contradiction

To prove $P$, assume $not P ==>$ something impossible.

=== Example with primes

There are $infinity$ many primes.

#proof[
  Suppose there are finite primes. Then, we can list them $p_1, p_2, ..., p_n$.

  Consider $a = p_1 dot p_2 dot ... dot p_n + 1$. Then (with assumptions of finite primes) $a$ is not prime because $a$ is larger than any of the finite number of primes we have. In other words, $a / p_k in ZZ$ for some $k$.

  $
    a / p_k &= underbrace(p_1 dot p_2 dot p_3 dot ... dot p_(k - 1) dot p_(k + 1) dot ..., "integers") + underbrace(1 / p_k, "not int") \
    &= a / p_k: "must not be an int"
  $

  But we said that $a / p_k$ must be an integer, which leads to a contradiction $arrow.zigzag$.
]

== Countable Sets

$A$ is countable if $|A| = |underline(n)|$ or $|A| = |NN|$. Same as $|A| <= |NN|$.

$A, B$ countable $==> A union B$ countable.

$
  |underline(n)| <= |underline(m)| <==> n <= m
$

$
  forall n in NN union {0}, |underline(n)| < |NN|
$

== Bigger Sets

$A eq.not emptyset, |scr(P)(A)| > |A|$.

#proof[
  $|A| <= |scr(P)(A)|$ means we have an injection $A arrow.hook scr(P)(A)$, where $a arrow.bar {a}$.

  WTS that $exists.not$ surj. $A arrow.twohead scr(P)(A)$.

  Let $f: A -> scr(P)(A)$.

  Let $X = {a in A | a in.not f(a)} in scr(P)(A)$

  Claim: $X in "range"(f)$.

  Let $a in A$.

  If $a in X ==> a in.not f(a) ==> X eq.not f(a)$.

  If $a in.not X ==> a in f(a) ==> x eq.not f(a)$.

  So $X eq.not f(a) forall a in A$. $X in "range"(f)$, so there does not exists a surjection $A -> scr(P)(A)$.
]

== Number of Relations

For a finite set $A$, the cardinality of the number of relations on $A$ is $2^(|A|^2)$.

Relations from $A$ to $B$:

${"relations"} arrow.hook {"subsets of" A times B} = scr(P)(A times B)$

so the number of relations from $A$ to $B$ is $2^(|A|dot|B|)$

== Properties of Relations

- Reflexive: $forall x in X, x R x$
- Symmetric: $x R y <==> y R x$
- Antisymmetric: $x R y$ & $y R x ==> x = y$
- Transitive: $x R y$ & $y R z ==> x R z$

=== Partial Ordering

- Reflexive, antisymmetric, transitive

Ex: $subset.eq, supset.eq, |...| = |...|$


=== Total Ordering

Same things as partial ordering, except everything must be related to each other.

$
  forall x, y in X "either" x R y "or" y R x
$

Eg: $<=, >=$ on $RR$.

=== Equivalence

- Reflexive, symmetric, transitive.

$
  x eq.triple y (mod n) \
  arrow.t.b.double \
  x eq.triple_n y <==> x = y + n k "for some" k
$

This is an equivalence relation.

#proof[
  Reflexive:
  $
    a in ZZ \
    a - a = n k quad k = 0 \
    0 = 0 n ==> a eq.triple_n a
  $

  Symmetric:
  $
    a, b in ZZ \
    a eq.triple_n b quad a - b &= n k \
    b eq.triple_n b quad b - a &= n k
  $

  Transitive:
  $
    & &a, b, c in ZZ \
    a &eq.triple_n b &quad b &eq.triple_n c \
    a - b &= n k &quad b - c &= n l \
    & a - c &= n underbrace((k + l), in ZZ) & \
    & & ==> a eq.triple_n c
  $
]

== Equivalence Classes

$X$ a set, $~$ an equivalence relation on $X$, $x in X$. An equivalence class of $x$ is a subset of $X$.

$
  [x]_~ := {y in X | y ~ x} subset.eq X
$

Ex:

$
  [0]_(eq.triple_2) = {...-4,-2,0,2,4,...} \
  [1]_(eq.triple_2) = {...-1,-1,1,3,...} \
$

$
  x ~ y <==> [x] = [y] \
  x tilde.not y <==> [x] sect [y] = emptyset
$

== Quotient Set

$
  (X \/ ~) #h(5pt) = {"equiv of " ~}
$

Ex:

$
  (ZZ \/ eq.triple_3) #h(5pt) = {[a] | a in ZZ} = {[0],[1],[2]} \
  (ZZ \/ eq.triple_n) #h(5pt) = {[0],[1],[2], ..., [n - 1]} \
$

== Modular Arithmetic

$
  (ZZ \/ eq.triple_n) #h(5pt) = ZZ_n
$

$
  [a] + [b] := [a + b] \
  [a] dot [b] := [a dot b]
$

We can do this because addition and multiplication makes sense and keeps us in the "correct" equivalence class.

Claim:

$
  a eq.triple_n a' quad b eq.triple_n b' \
  ==> a + b eq.triple_n a' + b' \
  a b eq.triple_n a' b'
$

#proof[
  (1)
  Suppose $a eq.triple_n a', b eq.triple_n b'$.
  $
    &==> a a' = n k quad b b' = n l quad "for some" k, l in ZZ \
    &==> a - a' + b - b' = n(k + l) \
    &==> (a + b) - (a' + b') = n(k + l) \
    &==> a + b eq.triple_n a' + b'
  $

  (2) Suppose $a eq.triple_n a', b eq.triple_n b'$.

  // $
  //   a - a' = n k quad b - b' = n l \
  //   (a - a')(b - b') = n k l \
  //   a = a' + n k quad b = b ' + n l
  // $
  $
    a = a' + n k &quad b = b' + n l \
    a b &= (a' + n k) (b' + n l) \
    &= a' b + n^2 l k + b' n k + a' n l \
    a b - a' b' &= underbrace(n(n k l + b' k + a' l), ZZ) \
    a b &eq.triple_n a' b'
  $
]