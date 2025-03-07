#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 6")


=

==

Baryons: 3 quarks, spin $1/2$, $l = 0$.

For the first 2: $s_a = 0,1$. Now we add the third into the combinations.

$
  s &= (1 / 2 + s_a), abs(1 / 2 - s_a) \
  s &= 1 / 2, 3 / 2, 1 / 2, 1 / 2
$

So the total possible values of $s$ are $1/2, 3/2$.

==

Mesons: 2 quarks, $s = 1 / 2$, $l = 0$.

$s = s_1 + s_2, abs(s_1 - s_2)$.

So $s = 1, 0$.

=

$l = 1, m_l = 0, s = 1 / 2, m_s = - 1 / 2$. We can look up in the table to find which uncoupled states correspond to this coupled state.

We can see that this state is a sum of $sqrt(2 / 3) ket(3 / 2 #h(1mm) 1 / sqrt(3)) + sqrt(1 / 3) ket(1 / 2 " -"1/2)$ by looking in the Clebsch-Gordan table.

The first ket has $j = 3 / 2$, so we get $J^2$ with $j(j+1)hbar^2$. So in this case, $J^2 = 15/4 hbar^2$, and this occurs with probability $2/3$.

The second ket has $j = 1/2$, so $J^2 = 3/4 hbar^2$. This occurs with probability $1/3$.

// So the possible total angular momentum squared of the electron could be $3/2 hbar^2$ with probability $2/3$ or $1/2 hbar^2$ with probability $1 / 3$.


=

$s_1 = 1, m_1 = 1, s_2 = 2, m_2 = 2$

The total spin $m = 3$. $s_z = hbar$.

If we look int the Clebsch-Gordan table for total spin = 3 with $s_z = hbar$, we find that there are three possible values for the $z$ component of angular momentum.

$ket(2 1)$ has a $z$ component of angular momentum of $2 hbar$, and this occurs with probability $1 / 15$.

$ket(1 0)$ has a $z$ component of angular momentum of $hbar$, and this occurs with probability $8 / 15$.

$ket(0 1)$ has a $z$ component of angular momentum of $0 hbar$, and this occurs with probability $6 / 15$.

= 11.16

$
  I = 1, g_D = 0.857
$

$j_1 = 1, j_2 = 1 / 2$.

$
  F^2 ket(F M_F) = F(F+1) hbar^2 ket(F M_F)
$ <f2-def>

We know that $m_1 in {-1, 0, 1}$ and $m_2 in {-1/2, 1/2}$.

So now we can fill out the $F^2$ matrix using @f2-def.

$
  F^2 eq^. hbar^2
  #table(
    columns: 6,
    stroke: none,
    $ket(3/2 #h(2mm) 3/2)$, $ket(3/2 #h(2mm) 1/2)$, $ket(3/2 " -"1/2)$, $ket(3/2 " -"3/2)$, $ket(1/2 #h(2mm) 1/2)$, $ket(1/2 " -"1/2)$,
    $15/4$, [0], [0], [0], [0], [0],
    [0], $15/4$,[0], [0], [0], [0],
    [0], [0], $15/4$,[0], [0], [0],
    [0], [0], [0], $15/4$, [0], [0],
    [0], [0], [0], [0], $3/4$, [0],
    [0], [0], [0], [0], [0], $3/4$
  )
$

We know that $S^2 eq^dot 3 / 4 hbar^2 "Id"$ and $I^2 =^. 2 hbar^2 "Id"$.

$
  H'_(h f) &= A / (2 hbar^2) (F^2 - S^2 - I^2) \
  &= A / 2 mat(1, 0, 0, 0, 0, 0;0,1,0,0,0,0;0,0,1,0,0,0;0,0,0,1,0,0;0,0,0,0,-2,0;0,0,0,0,0,-2)
$

So we can see $Delta E = 3 / 2 A$.

To compute $A$ we need to use the version for hydrogen and then replace the $g_p$ with $g_D$.

$
  A_p / A_D &= g_p / g_D \
  ==> quad A_D &= (A_p g_D) / g_p = 217.7 "MHz"
$

$
  3 / 2 A_D = 326.5 "MHz"
$

So the split is less compared to H.

#figure(
  image("e_split.png", width: 70%),
  caption: [Energy Split of Deuterium Atom with Hyperfine Structure],
) <e-split>

In @e-split, the top line refers to when $F = 3/2$ and the bottom when $F = 1 / 2$.
