#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 5")


= 10.22

#figure(
  table(
    stroke: white,
    columns: 10,
    table.header(
      [],
      [even],
      table.cell([odd], colspan: 3),
      table.cell([even], colspan: 5),
    ),

    $n$, $3$, $3$, $3$, $3$, $3$, $3$, $3$, $3$, $3$,
    $cal(l)$, $0$, $1$, $1$, $1$, $2$, $2$, $2$, $2$, $2$,
    $m$, $0$, $0$, $-1$, $1$, $0$, $-2$, $-1$, $1$, $2$,
  ),
)

To be nonzero, $m' = m$ and the parity must be different.

$
  H' = e epsilon r cos theta
$

Nonzero integrals:

$
  &braket(300, H', 300) \
  &braket(311, H', 321) = braket(31 "-"1, H', 32"-"1) \
  &braket(310, H', 320)
$

We will do each one methodically (as they are very long).

$
  braket(300, H', 310)
$

$
  psi_300 &= 1 / (3a_0)^(3 / 2) 1 / sqrt(4 pi) (2 - (4r) / (3a_0) + (4r^2) / (27a_0)) e^(-r \/ (3a_0)) \
  psi_310 &= 1 / (3a_0)^(3 / 2) (4 sqrt(2) r) / (9a_0) (1 - r / (6a_0)) e^(-r \/ (3a_0)) sqrt(3 / (4pi)) cos theta
$

$
  e epsilon 1 / (3a_0)^2 (4 sqrt(2)) / (9a_0) sqrt(3 / (4pi)) underbrace(integral_0^(2pi) dif phi.alt, 2pi) underbrace(integral_0^pi cos^2 theta sin theta dif theta, 2 / 3) underbrace(integral_0^infinity r(1 - r / (6a_0)) r^3 e^(2r\/(3a_0)) dif r, -2187 / 4 a_0^5) \
  = -3 sqrt(6) e epsilon a_0
$

$
  braket(310, H', 320)
$

$
  psi_310 &= 1 / (3a_0)^(3 / 2) (4 sqrt(2) r) / (9a_0) (1 - r / (6a_0)) e^(-r \/ (3a_0)) sqrt(3 / (4pi)) cos theta \
  psi_320 &= 1 / (3a_0)^(3 / 2) (2 sqrt(2)r^2) / (27 sqrt(5) a_0^2) e^(-r \/ (3a_0)) sqrt(5 / (16 pi)) (3 cos^2 theta - 1)
$

$
  1 / (27 a_0^3) (2 sqrt(2)) / (27 sqrt(5) a_0^2) sqrt(5 / (16pi)) (4 sqrt(2)) / (9 a_0) sqrt(3 / (4pi)) underbrace(integral_0^(2pi) phi.alt, 2pi) underbrace(integral_0^pi cos^2 theta sin theta (3 cos^2 theta - 1) dif theta, 8 / 15) underbrace(integral_0^infinity r^6 (1 - r/(6a_0) e^(-(2r)/(3a_0))dif r), -295245/32 a_0^7) \
  = -3 sqrt(6) e epsilon a_0
$

$
  braket(311, H', 321)
$

$
  psi_311 &= 1 / (3 a_0)^(3 / 2) (4 sqrt(2)r) / (9 a_0) (1 - r / (6a_0)) e^(-r \/ (3a_0)) sqrt(3 / (8pi)) sin theta e^(i phi.alt) \
  psi_321 &= 1 / (3a_0)^(3 / 2) (2 sqrt(2) r^2) / (27 sqrt(5) a_0^2) e^(-r \/ (3a_0)) sqrt(15 / (8pi)) cos theta sin theta e^(i phi.alt)
$
$
  1 / (27a_0^3)sqrt(45 / (64pi^2)) (8 dot 2) / (26 dot 9 sqrt(5)) 1 / (a_0^3) underbrace(integral_0^(2pi) e^(i phi.alt - i phi.alt) dif phi.alt, 2pi) underbrace(integral_0^pi sin^3 theta cos^2 theta dif theta, 4 / 15) underbrace(integral_0^infinity e^(-2r \/ (3a_0)) r^6 (1 - r / (6a_0))dif r, -295245 / 32 a_0^7) \
  = - 9 / 2 a_0 e epsilon
$

Now that we have the three integrals, we can create a matrix to hold the expectation values. We will also take out the factor of $-3 a_0 e epsilon$ in each term.

$
  #table(
    columns: 10,
    stroke: none,
    [], [300], [310], [320], [311], [321], [31-1], [32-1], [32-2], [322],
    [300], [0], $sqrt(6)$, [0], [0], [0], [0], [0], [0], [0],
    [310], $sqrt(6)$, [0], $sqrt(3)$, [0], [0], [0], [0], [0], [0],
    [320], [0], $sqrt(3)$, [0], [0], [0], [0], [0], [0], [0],
    [311], [0], [0], [0], [0], $3 / 2$, [0], [0], [0], [0],
    [321], [0], [0], [0], $3 / 2$, [0], [0], [0], [0], [0],
    [31-1], [0], [0], [0], [0], [0], [0], $3 / 2$, [0], [0],
    [32-1], [0], [0], [0], [0], [0], $3 / 2$, [0], [0], [0],
    [32-2], [0], [0], [0], [0], [0], [0], [0], [0], [0],
    [322], [0], [0], [0], [0], [0], [0], [0], [0], [0],
  )
$

As we can see, there are 3 (although 2 unique) submatrices that we can diagonalize to get the eigenvalues for the 9 degenerate states.

Let's first do the 3x3 matrix.

#set math.mat(delim: "|")
$
  0 &= mat(-lambda, -a_0 e epsilon 3 sqrt(6), 0; -a_0 e epsilon 3 sqrt(6), -lambda, -a_0 3 epsilon 3 sqrt(3); 0, -a_0 e epsilon 3 sqrt(3), -lambda) \
  &= -lambda (lambda^2 - a_0^2 e^2 epsilon^2 27) + a_0 e epsilon 3 sqrt(6) (lambda e epsilon 3 sqrt(6)) \
  &= -lambda^3 + lambda a_0^2 e^2 epsilon^2 27 + lambda a_0^2 e^2 epsilon^2 54 \
  &= -lambda(lambda^2 - (a_0 e epsilon 9)^2)
$

Hence $lambda = 0, plus.minus 9 e a_0 epsilon$. Now we can find the eigenvectors.

We will first do $lambda = 0$.

We know that $a^2 + b^2 + c^2 = 1$ by normalization. We also know (by plugging in $lambda = 0$) that $b = 0$ and $a sqrt(6) + c sqrt(3) = 0$, so $c = sqrt(1 - a^2)$.

$
  a sqrt(6) + sqrt(1 - a^2) sqrt(3) &= 0 \
  -a sqrt(6) &= sqrt(3 - 3a^2) \
  3 - 3a^2 &= -a sqrt(6) \
  3 - 3 a^2 &= a^2 6 \
  3 &= a^2 (6 + 3) \
  a &= - 1 / sqrt(3) quad "choose minus here" \
  ==> quad c &= sqrt(2 / 3)
$

Hence $ket(1) = - 1 / sqrt(3) ket(300) + sqrt(2 / 3) ket(320)$.

Now we can do $lambda = 9e a_0 epsilon$.

We can see (by row reducing) that $a = sqrt(2)c, b = sqrt(3)c$ and that $a^2 + b^2 + c^2 = 1$. We find that $a = 1 / sqrt(3), b = 1 / sqrt(2), c = 1 / sqrt(6)$.

Hence $ket(2) = 1 / sqrt(3) ket(300) + 1 / sqrt(2) ket(310) + 1 / sqrt(6) ket(320)$.

Now we do $lambda = -9e a_0 epsilon$.

From row reduction we see that $a = sqrt(2)c, b = - sqrt(3)c$ and normalization as above. We find that $a = 1/sqrt(3), b=-1/sqrt(2), c = 1 / sqrt(6)$.

Hence $ket(3) = 1 / sqrt(3) ket(300) + - 1 / sqrt(2) ket(310) + 1 / sqrt(6) ket(320)$.

Now we look at the two other submatrices that look like this:

$
  mat(-lambda, -9/2 a_0 e epsilon; -9/2 a_0 e epsilon, -lambda) = 0
$

Solving for $lambda$ gives us $lambda = plus.minus 9/2 a_0 e epsilon$.

We can solve for the eigenvectors, and we can see that because it is a 2x2 matrix that is symmetric we will have coefficients of $plus.minus 1 / sqrt(2)$ for each term.

Hence $ket(4) = 1 / sqrt(2) ket(311) + 1 / sqrt(2) ket(321), ket(5) = 1 / sqrt(2) ket(311) - 1 / sqrt(2) + ket(321)$.

And using similar reasoning we can see that $ket(6) = 1 / sqrt(2) ket(31"-"1) + 1 / sqrt(2) ket(32"-"1), ket(7) = 1 / sqrt(2) ket(31"-"1) - 1 / sqrt(2) ket(32"-"1)$.

Because the final two states do not have any nonzero values in their rows/columns, we know that $ket(8) = ket(322), ket(9) = ket(32"-"2)$ (they do not change with the dipole).


Now we can see how the dipole moment changes with this electric field.

We know that the dipole moment $arrow(d) = - e arrow(r)$.

$
  H' &= - arrow(d) dot arrow(E) \
  &= -d_z E_z = e epsilon r cos theta \
  ==> quad d_z &= - (e epsilon r cos theta) / E_z \
  d_z &= - H' / epsilon
$

So:

$
  braket(n l m, d_z, n' l' m') &= - 1 / epsilon underbrace(braket(n l m, H', n' l' m'), "new eigenvalues")
$

So the change to the dipole moment is $1 / epsilon E_n^((1))$.

For the changes to the energies that are zero, that means that the dipole is orthogonal with the magnetic field. For the others, they are all negative which means that it is aligned (because we have the $-1$ in $d_z$).

$
  ket(1) &= - 1 / sqrt(3) ket(300) + sqrt(2 / 3) ket(320) quad &lambda &= 0\
  ket(2) &= 1 / sqrt(3) ket(300) + 1 / sqrt(2) ket(310) + 1 / sqrt(6) ket(320) quad &lambda &= 9e a_0 epsilon \
  ket(3) &= 1 / sqrt(3) ket(300) + - 1 / sqrt(2) ket(310) + 1 / sqrt(6) ket(320) quad &lambda &= -9e a_0 epsilon \
  ket(4) &= 1 / sqrt(2) ket(311) + 1 / sqrt(2) ket(321) quad &lambda &= - 9 / 2 a_0 e epsilon\
  ket(5) &= 1 / sqrt(2) ket(311) - 1 / sqrt(2) + ket(321) quad &lambda &= 9 / 2 a_0 e epsilon \
  ket(6) &= 1 / sqrt(2) ket(31"-"1) + 1 / sqrt(2) ket(32"-"1) quad &lambda &= -9 / 2 a_0 e epsilon \
  ket(7) &= 1 / sqrt(2) ket(31"-"1) - 1 / sqrt(2) ket(32"-"1) quad &lambda &= 9 / 2 a_0 e epsilon \ \
  ket(8) &= ket(322) quad &lambda &= 0 \
  ket(9) &= ket(32"-"2) quad &lambda &= 0
$

The states that have negative eigenvalues (the perturbed energy) align with the dipole and the ones which have positive are anti-aligned. If the state has a 0 change to its energy, then it is orthogonal to the dipole.

This is because the eigenvalues correspond to $- 1 / epsilon$ of the dipole moment.
