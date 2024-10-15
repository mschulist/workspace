#import "../template.typ": *
#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ctheorems:1.1.2": *

#let proof = thmproof("proof", "Proof")
#show: thmrules.with(qed-symbol: $square$)

#show: project.with(title: "Homework 3")
=

==

$
  e: ZZ -> ZZ \
  e(n) = 2n + 1
$

Injective:

#proof([
  $
    a, b in ZZ \
    e(a) = e(b) \
    2a + 1 = 2b + 1 \
    2a = 2b \
    a = b
  $
  We have shown that for any two values $a, b in ZZ$, in order for them to map to the same output they must be equal. Therefore, $e$ is injective.
])

Not Surjective:


#proof([
  $0 in ZZ$, but there does not exist a value $a in ZZ$ such that $e(a) = 0$.

  $
    e(a) = 0 \
    2a + 1 = 0 \
    2a = -1 \
    a = -1 / 2
  $
  $a in.not ZZ$, so we have shown that there is a value in the cod($e$) that $e$ does not map a value from dom($e$) to.
])

==

$
  f: ZZ -> ZZ times ZZ \
  f(n) = (2n, n + 3)
$

Injective:

#proof([
  $
    a, b in ZZ \
    f(a) = f(b) \
    (2a, a + 3) = (2b, b + 3)
  $
  We can show that if the first component equals the other first component and the second component equals the other second component, then the two sides are equal.
  $
    2a = 2b \
    a = b \
    \
    a + 3 = b + 3 \
    a = b
  $
  The two sides are equal, therefore for any $a,b in ZZ$ we are will only get the same output if the two inputs are equal.
])

Not surjective:

#proof([
  $(0, 0) in ZZ^2$ but there does not exist an $a in ZZ$ such that $f(a) = (0, 0)$.

  $
    2n = 0 \
    n = 0
  $
  But $f(0) = (0, 3)$ which is not $(0,0)$.
])

==

$
  g: ZZ times ZZ -> ZZ \
  g(m, n) = 3n - 4m
$

Not injective:

#proof([
  $
    g(3,4) = 12 - 12 = 0 \
    g(0,0) = 0
  $
  We have shown that there are 2 inputs ${(0,0), (3,4)}$ that get mapped to the same value ($0 in ZZ$).

])

Surjective:

#proof([
  $
    g(2,3) = 9 - 8 = 1
  $
  We want to show that there exists a value $(a, b) in ZZ^2$ such that $g(a, b)$ can equal any value in $ZZ$.
  $
    c in ZZ \
    g(2c, 3c) = c \
    9c - 8c = c
  $
])

==

$
  h : ZZ times ZZ -> ZZ \
  h(m, n) = 2n - 4m
$

Not injective:

#proof([
  $
    h(0,0) = 0 \
    h(1,2) = 0
  $
  We have shown that two different inputs map to the same value in $h$.
])

Not surjective:

#proof([
  There does not exist $(a, b) in ZZ^2$ such that $h(a, b) = 1$.
  $
    h(a,b) = 1 \
    2b - 4a = 1 \
    b - 2a = 1 / 2
  $
  It is not possible for the sum (or difference) of two integers to equal $1/2$. $b$ is an integer and $2a$ is also an integer.
])

==

$
  i: ZZ times ZZ -> ZZ times ZZ \
  i(m, n) = (m + n, 2m + n)
$

$$

Injective:

#proof([
  To prove $i$ is injective, we must show that any two inputs $(a, b), (c, d) in ZZ^2$ must output the same value if and only if $(a, b) = (c, d)$.
  $
    &i(a, b) = i(c, d) \
    &(a + b, 2a + b) = (c + d, 2c + d) \
    &a + b = c + d &2a + b = 2c + d \
    &a - c = d - b &2a - 2c = d - b \
    & &2(a - c) = d - b \
    & &2(d - b) = d - b \
    & &2d - 2b = d - b \
    & &d = b \
    &a - c = 0 \
    &a = c \
  $
  We have shown that $a = c$ and $d = b$, which is the same as $(a, b) = (c, d)$.
])

Surjective:

#proof([
  We want to show that we can get to any value $(a, b) in ZZ^2$ with $i$.
  $
    &i(m, n) = (a, b) \
    &a = m + n &b = 2m + n \
    &n = a - m \
    & &b = 2m + a - m \
    & &b = m + a \
    & &m = b - a \
    &n = a - b + a \
    &n = 2a - b
  $
  We can get to any value $(a, b) in ZZ^2$ using the equations above for $n$ and $m$.

  For example, if we want to get to $(4, 5)$, we can do the following:
  $
    i(b - a, 2a - b) \
    i(5 - 4, 8 - 5) \
    i(1, 3) = (4, 5)
  $
])

$i$ is injective and surjective $==> i$ is bijective.


=

$
  f: A -> B \
  g: B -> C
$

Given: $g compose f$ is bijective.

Want to show: $g compose f$ is bijective $=> f$ is injective, $g$ is surjective.

// If $f$ is not injective, show that $g compose f$ is not injective.

// If $g$ is not surjective, show that $g compose f$ is not surjective.

// $
// g compose f "bijective" => f "inj" and g "surj"
// $

#proof([
  We can prove the contrapositive:

  // Not true that $f$ injective and $g$ surjective $=> g compose f$ not bijective
  $
    f "not injective OR" g "not surjective" => g compose f "not bijective"
  $

  Prove that $f$ not injective $=> g compose f$ not bijective:

  Suppose $f$ not injective, then $exists a_1, a_2 in A$ distinct such that $g(f(a_1)) = g(f(a_2))$.

  // $g$ is not surjective because then we could not hit every element of $C$.

  Prove that $g$ is not surjective $=> g compose f$ not bijective:

  $
    exists c in C "such that" exists.not g(b) = c "and" exists.not g(f(a)) = c in C
  $
  In other words, if $g$ is not surjective, then we cannot "hit" every element $c in C$, which is required for $g compose f$ to be bijective.
])

// #figure(
//   canvas(length: 1cm,{
//     import draw: *
//     let colors_mapping = (
//       str(-2): blue,
//       str(0): green,
//       str(2): red
//     )

//     circle((-2,0), radius: (0.5,2))
//     content((-2,2.3), [$A$])
//     circle((0,0), radius: (0.5,2))
//     content((0,2.3), [$B$])
//     circle((2,0), radius: (0.5,2))
//     content((2,2.3), [$C$])
//     for x in (-2, 0, 2) {
//       for y in (-1.5, -0.5, 0.5, 1.5) {
//         circle((x,y), radius: 0.1, fill: colors_mapping.at(str(x)))
//         if x != 2 {
//           line((x,y), (x + 1.95, y), mark: (end: ">"))
//         }
//       }
//     }
//     circle((0,-1), radius: 0.1, fill: green)
//     line((0,-1),(1.95,-1.42), mark: (end: ">"))

//     line((-1.8,2.3),(-0.2,2.3), mark: (end: ">"))
//     content((-1, 2.6), [$f$])
//     line((0.2,2.3),(1.8,2.3), mark: (end: ">"))
//     content((1, 2.6), [$g$])
//   }),
//   caption: [Example function disproving "want to show"]
// )<2false>

// In @2false, we can see that $g compose f$ is bijective. Despite it being bijective, $f$ is not surjective and $g$ is not injective.

=

$
  f : A -> B \
  g : B -> C \
  h : B -> C
$

==

Given: $f$ is surjective and $g compose f = h compose f$

Want to show that $g = h$.

#proof([
  Because $f$ is surjective, $forall a in A, exists b in B$ such that $f(a) = b$. Therefore, $g$ and $h$ must map every element $b in B$ to the same element $c in C$ because $g compose f = h compose f$.

  In symbols, if $f(a) = b forall b in B => g(b) = h(b) => g(f(a)) = h(f(a))$.

  If an element $b in B$ was mapped to different elements by $h$ and $g$, it is not possible for $g compose f = h compose f$ because $g(f(a)) eq.not h(f(a))$.
])

==

$
  f: NN -> NN \
  f(n) = 2n - 1 \
  g: NN -> NN \
  g(n) = n \
  h: NN -> NN \
  h(n) = cases(
  n "if" n "is odd",
  2 "if" n "is even",
)
$

$f$ only outputs odd values, so we can send all of the even values to wherever and still have $g compose f = h compose f$.


=

==

$
  S: cal(F)(A, {0, 1}) -> cal(P)(A)
$

#proof([
  We can define $S(f) = {a in A|f(a) = 1}$. In this case, $A = "domain"(f)$. We know the following is true by the definition of $cal(F)(A, {0,1})$:
  $
    f: A -> {0,1}
  $
  We can show that $S$ is injective. Two functions of the form $(f: A -> {0,1})$ are unique if they map at least one input to a different output. When applied to our function declaration $f$, two different functions (let's say $g$ and $g'$) are distinct if ${a in A | g(a) = 1} eq.not {a in A | g'(a) = 1}$. That is exactly what our function $S$ does, meaning that the only way for $S(h) = S(h')$ is when $h = h'$.

  We can also show that $S$ is surjective. Given a set $A$ (the same set as used above) and a set $B subset.eq A$, we can construct a function $F$ that will return a function $f in cal(F)(A, {0,1})$.
  $
    F: cal(P)(A) -> cal(F)(A, {0,1}) \
    F(X) = cases(
      1 "if" a in X,
      0 "if" a in.not X
    )
  $
  This function is the inverse of $S$, showing that $S$ is surjective, and by extension, bijective.
])

// Notes below:

// $
// F: cal(P)(A) -> cal(F)(A, {0,1})
// $

// $
// cal(P)(X) arrow.bar F(X): A -> {0,1} \
// F(X) = cases(
//   1 "if" a in X,
//   0 "if" a in.not X
// )
// $

// Now we need to show $S$, which is the opposite of $F$.

// $
// f:A arrow {0,1} arrow.bar S(f) = {a in A | f(a) = 1}
// $

// #proof([
//   The cardinality of $cal(F)(A, {0, 1})$ is $2^(|A|)$ and the cardinality of $cal(P)(A)$ is $2^(|A|)$. Because the domain and codomain of $S$ have the same cardinality, we can always find a bijection between them.
// ])

==

// The cardinality of $cal(F)(A, {0, 1})$ is $2^(|A|)$. We know that there are only two possibilities for where each element in the domain goes, so we end up with $2^(|A|)$.

We showed that there is a bijection between $cal(F)(A, {0, 1})$ and $cal(P)(A)$ so their cardinalities must be equal. We know $|cal(P)(A)| = 2^(|A|)$, so the cardinality of $cal(F)(A, {0, 1}) = 2^(|A|)$.

==

The cardinality of $cal(F)(A, B) = |B|^(|A|)$. Each $a in A$ has $|B|$ possibilities to go to, so we end up with $|B| dot |B| dot |B| dot dots$, where there are $|A|$ $|B|$'s being multiplied together.

=

==

$
  {0,1} times NN -> NN
$

We can map all of the elements in the codomain that have $0$ as their first term to the even numbers, and all of the elements that have $1$ as their first term to the odd numbers.

$
  f(n) = cases(
  2n "if first term is" 0,
  2n - 1 "if first term is" 1,
)
$

==

$
  {0,1} times NN -> ZZ
$

We can do something similar, but we need to be careful because $0 in.not NN$.

$
  g(n) = cases(
  n "if first term is 0",
  1 - n "if first term is 1"
)
$


$
  |overline(cal(F))_(n-1)| <= n! \
  1 \/ 2 \
  lr(x^2 / 2 |)_(x=1)^2 \
$
