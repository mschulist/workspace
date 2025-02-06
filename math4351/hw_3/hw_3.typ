#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"
#import emoji: mango, banana, tangerine


#show: project.with(title: "Homework 3")
#set math.mat(delim: "[")

=

Show that $61 in (ZZ \/ 159ZZ)^times$. Same as showing $(61,159)=1$.

$
  159 &= 2 dot 61 + 37 \
  61 &= 37 + 24 \
  24 &= 13 + 11 \
  11 &= 2 dot 5 + 1 \
  5 &= 5 dot 1 + 0
$

So $(61,159) = 1$.

Now find the inverse of $61$ in $mod 159$.

$
  61 dot z &equiv 1 mod 159 \
  61 dot z + 159 k &= 1 \
$

Use extended Euclidean to find $k$ and $z$.

$
  1 &= 11 - 2 dot 5 \
  &= 11 - 5(13 - 11) \
  &= 11 - 5 dot 13 + 5 dot 11 \
  &= 6 dot 11 - 5 dot 13 \
  &= 6 (24 - 13) - 5 dot 13 \
  &= 6 dot 24 - 13 dot 6 - 5 dot 13 \
  &= 6 dot 24 - 11 dot 13 \
  &= 6 dot 24 - 11 (37 - 24) \
  &= 6 dot 24 - 11 dot 37 + 11 dot 24 \
  &= 17 dot 24 - 11 dot 37 \
  &= 17 (61 - 37) - 11 dot 37 \
  &= 17 dot 61 - 17 dot 37 - 11 dot 37 \
  &= 17 dot 61 - 28 dot 37 \
  &= 17 dot 61 dot 28(159 - 2 dot 61) \
  &= 17 dot 61 - 28 dot 159 + 56 dot 61 \
  &= underbrace(73, z) dot 61 underbrace(- 28, k) dot 159
$

So $61^(-1) = 73$ in $ZZ \/ 159ZZ$.

=

$p$ is prime. Show that $phi.alt(p^n) = p^(n-1)(p-1)$.

#proof[
  Because $p$ is prime, we know that $phi.alt(p) = p - 1$. In the number system $ZZ \/ p^n ZZ$, there are $p^n / p = p^(n-1)$ numbers that share a factor with $p^n$ (the multiples of $p$). So we need to subtract those from the total quantity of numbers in this number system, which gives us $p^n - p^(n-1)$ numbers that are coprime to $p^n$. Hence, $phi.alt(p^n) = p^n - p^(n-1) = p^(n-1)(p - 1)$.
]

=

==

We need to create a bijection between $(ZZ \/ m ZZ)_e$ and $(ZZ \/ d ZZ)^times$. We know $d | m, m = d e$.

$
  f:& (ZZ \/ m ZZ)_e -> (ZZ \/ d ZZ)^times \
  f(x) =& e x
$

We can show that $f$ is injective. Suppose $f(x_1) = f(x_2)$. Then

$
  e x_1 &= e x_2 \
  d e x_1 &= d e x_2 \
  m x_1 &= m x_2 \
  x_1 &equiv x_2 mod m
$

Now we show that $f$ is surjective. We need to show that given any $y in (ZZ \/ d ZZ)^times$, we can find an $x in (ZZ \/ m ZZ)_e$ such that $f(x) = y$.

We know that for any $y in (ZZ \/ m ZZ)_e, (y, m) = e$. Hence $(y, d e) = e$ and $(y,d) = 1$ as all common factors must come from $e$. This means that $y in (ZZ \/ d ZZ)^times$, and because $e | y$ and $m = d e$, we know that $y e^(-1) in (ZZ \/ d ZZ)^times$.

So the (two-sided) inverse of $f$ is $f^(-1)(y) = y e^(-1) in (ZZ \/ d ZZ)^times$.

==

We want to show that $m = sum_(d | m) phi.alt(d)$.

#proof[
  // Given an arbitrary $alpha in ZZ \/ m ZZ$, we know that $alpha$ is in some $(ZZ \/ m ZZ)_((alpha, m))$ by the previous problem (they are bijective). In other words:
  // $
  //   &alpha in union.big_(e | m) (ZZ \/ m ZZ)_e \
  //   <==> quad &alpha in union.big_(e | m) (ZZ \/ d ZZ)^times
  // $
  // Hence by the definition of $phi.alt(m)$:
  // $
  //   m &= sum_(d | m) abs((ZZ \/ d ZZ)^times)
  // $
  // TODO!
  Given an $a in (ZZ \/ m ZZ)_e$, then we know that $a$ is only in this particular set, and no other. If $e$ changes value, then $a$ will no longer be in the set. This is because $(m,a)$ is fixed and will only equal one $e$.

  Hence all of the $(ZZ \/ m ZZ)_e$ sets (for all possible $e$) will be pairwise disjoint.

  Because they are all pairwise disjoint (they partition the set of all values in $ZZ\/m ZZ$), the union of all $(ZZ
  \/ m ZZ)_e = ZZ \/ m ZZ$. 
  We can show this is true by showing containment in both directions. 
  
  First show that $ZZ\/m ZZ subset union.sq.big (ZZ \/ m ZZ)_e$. Suppose we have an $alpha in ZZ \/ m ZZ$. Then $alpha in (ZZ \/ m ZZ)_e$ for the value of $e$ that makes $(alpha, m) = e$. We know that there exists an $e$ where this is true because we are taking the union over all possible values of $e$ (the factors of $m$). 

  Now we show that $union.sq.big (ZZ \/ m ZZ)_e subset (ZZ \/ m ZZ)$. For any $beta in (ZZ \/ m ZZ)_e$, we know that $beta in ZZ \/ m ZZ$ as $beta$ must be in the set ${0, 1, ..., m-1}$ which is the same as $ZZ \/ m ZZ$. 
  
  Hence:
  $
    union.sq.big_(e) (ZZ \/ m ZZ)_e &= ZZ \/ m ZZ \
    ==> quad sum_e abs((ZZ \/ m ZZ)_e) &= m
  $

  We know that $(ZZ \/ d ZZ)^times arrow.tilde (ZZ \/ m ZZ)_e$ and that $phi.alt(d) = abs((ZZ \/ d ZZ)^times)$. Therefore, if we add $phi.alt(d)$ for all $d$ that divide $m$, we will get the same value as adding $abs((ZZ \/ m ZZ)_e)$ for all $e$, which is the same as $m$.

  Hence:
  $
    m = sum_(d | m) phi.alt(d)
  $
]

=

Given $p$ is an odd prime, show that

$
  1^2 dot 3^2 dot ... dot (p-2)^2 &equiv (-1)^((p+1) / 2) mod p \
  2^2 dot 4^2 dot ... dot (p-1)^2 &equiv (-1)^((p+1) / 2) mod p \
$


#proof[
  We can start with the odd case. By the definition of squaring numbers, we can rewrite the LHS as:
  $
    (1 dot 3 dot 5 dot dots dot (p-2)) (1 dot 3 dot 5 dot dots dot (p-2))
  $
  And then further rearranage as shown below, using the fact that $-p(-a) equiv a mod p$.
  $
    (1 dot 3 dot 5 dot dots dot (p-2))((-1)(p-1) dot (-1)(p-3) dot dots dot (-1) 4 dot (-1)2)
  $
  We can group the terms together to get in a form where we can apply Wilson's Theorem.
  $
    underbrace((1 dot 2 dot 3 dot dots dot (p-2)(p-1)), -1)) (-1)^((p-1) / 2) &equiv (-1)^((p-1) / 2) (-1) mod p \
    &equiv (-1)^((p+1) / 2) mod p
  $

  The even case is nearly identical:

  $
    (2 dot 4 dot 6 dot dots dot (p-3) (p-1)) ((-1)(p-2) dot (-1)(p-4) dot dots dot (-1)3 dot (-1)1) &equiv (-1)^((p-1) / 2) (-1) \
    &equiv (-1)^((p+1) / 2)
  $


  // The even case is the same:
  // $
  //   (2 dot 4 dot 6 dot dots dot (p-1)) (2 dot 4 dot 6 dot dots dot (p-1)) &equiv (-1)^((p-1) / 2) (p-1)! mod p \
  //   (2 dot 4 dot 6 dot dots dot (p-1))(-(p-2) dot -(p-4) dot dots dot (-1))) &equiv (-1)^((p+1) / 2) mod p
  // $
]

=

$p$ is an odd prime.

==

Show that $x^2 = 0$ has one solution in $ZZ \/ p ZZ$.

#proof[
  We know that $a^2$ has an inverse if and only if $a^2 eq.not 0$ in $ZZ \/ p ZZ$. We are given that $a^2 equiv 0 mod p$, so $a$ does not have an inverse. Because $a^2$ does not have an inverse, the only way to get $a^2 = 0$ is if $a = 0$, which is the single solution.
]

==

$a in (ZZ \/ p ZZ), a in {1, ..., p - 1}$. We want to show that if $x^2 = a$ has a solution mod $p$, then it has exactly $2$ solutions.

#proof[
  We can first show that $x$ has at least 2 solutions.

  If $x$ is a solution to $x^2 equiv a$, then $p-x$ is also a solution.

  $
    (p-x)^2 = p^2 - 2 p x + x^2 equiv x^2 mod p = a
  $ <5b-other-sol>

  Now we show that if there is a solution, there are only 2 solutions.

  Assume that $y eq.not x$ and $x^2 = y^2$. Then
  $
    x^2 - y^2 &= 0 \
    (x + y) (x - y) &= 0 \
    y eq.not x ==> quad x + y &= 0 \
    y &= p - x
  $
  Which is the other solution. This means that if we are given one solution, the only possible other solution is the one we showed above in @5b-other-sol.
]


==

$a in (ZZ \/ p ZZ)^times$ is square if $exists b in (ZZ \/ p ZZ)^times$ such that $b^2 = a$.

Show that half of the elements in $(ZZ \/ p ZZ)^times$ are squares.

$
  f:& (ZZ \/ p ZZ)^times -> (ZZ \/ p ZZ)^times \
  f(x) &= x^2
$

For all $x in (ZZ \/ p ZZ)^times$, $x^2 = (p-x)^2$. Therefore, there are two elements in the domain that get mapped to each element in the codomain.

Because the domain and codomain have the same size $phi.alt(p) = p - 1$, we can only _hit_ half of the elements in the codomain (both the domain and codomain are finite), meaning that the size of the image $f = (p - 1) / 2$.

==

$
  (ZZ \/ 7 ZZ)^times = {1,2,3,4,5,6}
$

The squares are ${1,2,4}$ (by squaring each element in the above set and seeing where it lands).

==

$
  (ZZ \/ 15 ZZ)^times = {1,2,4,7,8,11,13,14}
$

The squares are $2/8$ of the original elements, less than the 0.5 if we were working in a prime modulo.

=

==

$
  A = mat(5,5;2,7)
$

$
  a d - b c &= 25 \
$

Now find the inverse of 25 in mod 9.

$
  25 x &equiv 1 mod 9 \
  4 dot 25 x &equiv 4 mod 9 \
  x &equiv 4 mod 9
$

$
  A^(-1) &= 4 mat(7, -5; -2, 5) \
  &= mat(28, -20; -8, 20) \
  &= mat(1,7;1,2)
$

==

$
  mat(5,5;2,7) mat(x;y) &= mat(1;8) \
  mat(x;y) &= mat(1,7;1,2) mat(1;8) \
  mat(x;y) &= mat(57;17) \
  mat(x;y) &= mat(3;8)
$

==

$m = 26, n = 3$

$
  A = mat(1,2,3;0,4,3;3,5,3)
$

$
  b = mat(1;2;3)
$
I wrote the following code to compute the Hill Cipher. It finds the numeric value of the characters and goes 3 characters at a time, multiplying $A$ by the vector of characters and adding $b$.

```python
def encrypt_word(word: str, func: callable):
    res = ""
    for i in range(len(word) // 3):
        chars = word[i * 3 : i * 3 + 3]
        numeric_chars = np.array([ord(c) - 97 for c in chars])
        encrypted_numeric = func(numeric_chars)
        encrypted_chars = [chr(num_char + 97) for num_char in encrypted_numeric]
        for c in encrypted_chars:
            res += c

    return res

def f(x: np.ndarray):
    A = np.array(
        [
            [1, 2, 3],
            [0, 4, 3],
            [3, 5, 3],
        ]
    )
    b = np.array([1, 2, 3])

    return (A @ x + b) % 26

encrypt_word("banana", f)
```

This returns `pptbcq`.

==

I computed $A^(-1)$ and here is the result.

$
  A^(-1) = mat(15,7,4;7,4,15;8,21,6)
$

```python
def f_inv(x: np.ndarray):
    print(x)
    A_inv = np.array(
        [
            [15, 7, 4],
            [7, 4, 15],
            [8, 21, 6],
        ]
    )
    b = np.array([1, 2, 3])

    return (A_inv @ (x - b)) % 26

encrypt_word("xsammg", f_inv)
```
This returns `orange` #tangerine


==

We want to show that if $A$ is invertible mod $m$, then $det A in (ZZ \/ m ZZ)^times$.

#proof[
  Suppose $A$ is invertible mod $m$. Then $exists B$ such that $A B = B A = "Id"$. From determinant rules:
  $
    det(A B) = det(A) det(B) = 1 \
    ==> (det A)^(-1) = det(B)
  $
  Hence $det A$ has an inverse mod $m ==> (det A, m) = 1 ==> det A in (ZZ \/ m ZZ)^times$.
]
