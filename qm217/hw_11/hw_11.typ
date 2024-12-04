#import "../template.typ": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0"

#show: project.with(title: "Problem Set 11")

#set math.equation(numbering: "(1)")

=

$
  planck.reduce omega < E < 3 planck.reduce omega
$

$
  expval(E) = 11 / 6 planck.reduce omega
$

We can use the following equation to solve for the different components of the wave function (it is a superposition of multiple).

$
  E &= (n + 1 / 2)planck.reduce omega
$

$
  1 < n + 1 / 2 < 3 \
  0.5 < n < 2.5
$

So therefore $n in {1, 2}$. We want to construct a superposition of two wave functions with $n = 1, 2$ so that the expectation value of the energy (using Hamiltonian) is $11 / 6 omega planck.reduce$.

$
  11 / 6 &= A^2 1.5 + B^2 2.5
$

We can't yet determine the coefficients $(A, B)$, but with normalization we can.

$
  psi(x) &= A psi_1(x) + B psi_2(x)
$

$
  1 &= A^2 integral_(-infinity)^infinity psi^*_1(x) psi_1(x) dif x + B^2 integral_(-infinity)^infinity psi^*_2(x) psi_2(
    x
  ) dif x \
  "orthonormality" ==> quad 1 &= A^2 + B^2
$

Now we can solve for $A$ and $B$.

$
  11 / 6 &= 1.5A^2 + (1 - A^2) (2.5) \
  11 / 6 &= 1.5A^2 + 2.5 - 2.5A^2 \
  0 &= (2.5 - 11 / 6) - A^2 \
  ==> quad A &= sqrt(2 / 3)
$

$
  B^2 &= 1 - A^2 \
  B^2 &= 1 / 3 \
  B &= sqrt(1 / 3)
$

We can plug these coefficients into the known solutions for the harmonic oscillator from the book.

$
  psi(x) &= sqrt(2 / 3) (b / (2 sqrt(pi)))^(1 / 2) (2b x)e^(-1 / 2 b^2 x^2) + sqrt(1 / 3) (b / (8 sqrt(pi)))^(1 / 2) (
    4b^2 x^2 - 2
  ) e^(-1 / 2 b^2 x^2 )
$

=

==

$
  (n_x, n_y, n_z) = (5, 1, 1)
$

$
  5^2 + 1^2 + 1^2 &= 27
$

So we need to find all possible combinations of three numbers so the sum of their squares equals $27$.

Solutions:

$
  (5, 1, 1) \
  (1, 5, 1) \
  (1, 1, 5) \
  (3, 3, 3)
$ <energies-27>

==

If one side $(L_x)$ were to be increased by $5%$, then we would have the following equation for the energy:

$
  E prop n_x^2 / (1.05L)^2 + n_y^2 / L^2 + n_z^2 / L^2
$

For all of the previous combinations in @energies-27, there would now be 3 energy levels:

$(5, 1, 1)$ is no longer equal to $(1, 5, 1) = (1, 1, 5)$ because the first length is longer. $(3, 3, 3)$ also separates from the other two levels because of the length increase in the $x$ dimension.

==

#cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *
  plot.plot(
    y-label: [Energy],
    x-label: none,
    size: (15, 5),
    x-min: 0,
    x-max: 11,
    y-min: 0.5,
    y-max: 3,
    x-tick-step: none,
    y-tick-step: none,
    {
      plot.add(((1, 2), (1.5, 2)), style: (stroke: white))
      plot.annotate(
        content((1.25, 1.75), [511]),
      )
      plot.add(((2, 2), (2.5, 2)), style: (stroke: white))
      plot.annotate(
        content((2.25, 1.75), [151]),
      )
      plot.add(((3, 2), (3.5, 2)), style: (stroke: white))
      plot.annotate(
        content((3.25, 1.75), [115]),
      )
      plot.add(((4, 2), (4.5, 2)), style: (stroke: white))
      plot.annotate(
        content((4.25, 1.75), [333]),
      )

      plot.add(((6, 1.5), (6.5, 1.5)), style: (stroke: white))
      plot.annotate(
        content((6.25, 1.25), [333]),
      )
      plot.add(((7, 1.25), (7.5, 1.25)), style: (stroke: white))
      plot.annotate(
        content((7.25, 1), [511]),
      )
      plot.add(((8, 1.75), (8.5, 1.75)), style: (stroke: white))
      plot.annotate(
        content((8.25, 1.5), [115]),
      )
      plot.add(((9, 1.75), (9.5, 1.75)), style: (stroke: white))
      plot.annotate(
        content((9.25, 1.5), [151]),
      )
    },
  )
})

CHECK THE PLOT! The last 2 might be wrong...



==

Yes, there still is degeneracy. To destroy it we would need to make all 3 lengths different (now 2 of them are still the same).

=

$
  lambda = 450 "nm"
$

$
  E_"photon" = c h / lambda
$ <photon-energy>

$
  E &= (pi^2 planck.reduce^2) / (2 m L^2)
$ <box-energy>

We can set @box-energy and @photon-energy equal to each other and solve for the length $(L)$. We know that because it is the lowest energy, we are transitioning from the case when one of the quantum numbers goes from $2 -> 1$ and the other 2 have a quantum number of $1$.

$
  c planck / lambda &= (pi^2 planck.reduce^2) / (2 m L^2) (6 - 3) \
  L &= sqrt((3 pi^2 planck.reduce^2 lambda) / (2 m h c)) \
  L &= sqrt((3 pi planck.reduce lambda) / (4 m c)) \
  L &= sqrt((3 pi planck.reduce (450 times 10^(-9)" m")) / (4 m_e c))
$

Plugging in for known values:

$
  L &= 6.40 times 10^(-10)" m" \
  L &= 6.40 "nm"
$

=

$
  V(x, y, z) &= 1 / 2 m omega^2 (x^2 + y^2 + z^2)
$

==

$
  H &= - planck.reduce^2 / (2m) diff / (diff x^2) + 1 / 2 m omega^2 x^2 - planck.reduce^2 / (2m) diff / (diff y^2) + 1 / 2 m omega^2 y^2 - planck.reduce^2 / (2m) diff / (diff z^2) + 1 / 2 m omega^2 z^2 \
  &= -planck.reduce^2 / (2m) [diff / (diff x^2) + diff / (diff y^2) + diff / (diff z^2)] + 1 / 2 m omega^2 [
    x^2 + y^2 + z^2
  ]
$

==

$
  psi(x, y, z) = psi_1(x) psi_2(y) psi_3(z)
$

$
  hat(H) psi(x, y, z) &= hat(H) psi_1(x) psi_2(y) psi_3(z) \
  &= [- planck.reduce^2 / (2m) psi''_1(x) + 1 / 2 m omega^2 x^2 psi_1(x)]psi_2(y) psi_3(z) \
  &+ [ - planck.reduce^2 / (2m) psi''_2(y) + 1 / 2 m omega^2 y^2 psi_2(y) ]psi_1(x) psi_3(z) \
  &+ [- planck.reduce^2 / (2m) psi''_3(z) + 1 / 2 m omega^2 z^2 psi_3(z)]psi_1(x) psi_2(y)
$

We can divide by $psi_1 psi_2 psi_3$:

$
  E &= underbrace([-planck.reduce^2 / (2m) (psi''_1(x)) / (psi_1(x)) + 1 / 2 m omega^2 x^2], E_1) + underbrace([
    -planck.reduce^2 / (2m) (psi''_2(y)) / (psi_2(y)) + 1 / 2 m omega^2 y^2
  ], E_2) + underbrace([
    -planck.reduce^2 / (2m) (psi''_3(z)) / (psi_3(z)) + 1 / 2 m omega^2 z^2
  ], E_3)
$

Each of these three terms has a unique energy that only depends on the dimension that they are a function of.

$
  E_1 &= planck.reduce omega (n_1 + 1 / 2) \
  E_2 &= planck.reduce omega (n_2 + 1 / 2) \
  E_3 &= planck.reduce omega (n_3 + 1 / 2)
$

==

The ground state is when $n_1 = n_2 = n_3 = 0$.

$
  E &= planck.reduce omega (3 / 2) \
  &= 3 / 2 planck.reduce omega
$

$
  (b / sqrt(pi))^(1 / 2) e^(-1 / 2 b^2 x^2) + (b / sqrt(pi))^(1 / 2) e^(-1 / 2 b^2 y^2) + (
    b / sqrt(pi)
  )^(1 / 2) e^(-1 / 2 b^2 z^2)
$

==

The first excited state is when two of the quantum numbers are $0$ and the other one is $1$. There are three degenerate states because the $omega$ is the same for all three dimensions.

We will solve for the energy when $n_1 = 1, n_2 = n_3 = 0$

$
  E &= planck.reduce omega (3 / 2 + 1 / 2 + 1 / 2) \
  &= 5 / 2 planck.reduce omega
$

$
  (b / sqrt(pi))^(1 / 2) e^(-1 / 2 b^2 y^2) + (b / sqrt(pi))^(1 / 2) e^(-1 / 2 b^2 z^2) + (b / (2 sqrt(pi)))^(1 / 2) (
    2b x
  ) e^(-1 / 2 b^2 x^2)
$

==

$
  E psi &= -planck.reduce^2 / (2m) [
    1 / r^2 diff / (diff r) (r^2 diff / (diff r) psi) + 1 / r^2 1 / (sin theta) diff / (diff theta) (
      sin theta diff / (diff theta) psi
    ) + 1 / (r^2 sin^2theta (diff^2 / (diff phi.alt^2)))
  ] \
  &quad + 1 / 2 m omega^2 r^2(sin^2(theta) sin^2(phi.alt) + sin^2(theta) cos^2(phi.alt) + cos^2(theta)) \
  E psi &= -planck.reduce^2 / (2m) [
    1 / r^2 diff / (diff r) (r^2 diff / (diff r) psi) + 1 / r^2 1 / (sin theta) diff / (diff theta) (
      sin theta diff / (diff theta) psi
    ) + 1 / (r^2 sin^2theta (diff^2 / (diff phi.alt^2)))
  ] \
  &quad + 1 / 2 m omega^2 r^2
$

==



=


$
  Psi(r, theta, phi.alt) = A f(r) sin theta cos theta e^(i phi.alt)
$

==

// We can use the angular momentum operator $hat(L_z)$ to find the z component of the angular momentum of the atom.

// $
//   hat(L_z) = - i planck.reduce (diff) / (diff phi.alt)
// $

// $
//   hat(L_z)^2 Theta Phi &= l(l + 1) planck.reduce^2 Theta Phi
// $

We know that $m_l$ is the $z$ component of the angular momentum. From our general equation of $Phi(phi.alt) = e^(i m_l phi.alt)$ and our given equation of $Psi(phi.alt) = e^(i phi.alt)$, we can conclude that $m_l = 1$.

$
  L_z &= m_l planck.reduce \
  ==> quad L_z &= planck.reduce
$



// $
//   hat(L_z) A f(r) sin theta cos theta e^(i phi.alt) &= A f(r) sin theta cos theta e^(i phi.alt) (
//     - i planck.reduce phi.alt
//   )
// $

==

We know that $l in {-1, 0, 1}$ but we do not know which.

$
  Theta(theta) &= sin theta cos theta
$

$
  sin theta diff / (diff theta) (
    sin theta (diff Theta(theta)) / (diff theta)
  ) - C sin^2 theta Theta(theta) &= m_l^2 Theta(theta) \
  sin theta diff / (diff theta) (sin theta (cos^2(theta) - sin^2(theta))) - C sin^3(
    theta
  ) cos theta &= m_l^2 sin theta cos theta \
  sin theta diff / (diff theta) (sin theta cos^2(theta)- sin theta sin^2(theta)) - C sin^3(
    theta
  ) cos(theta) &= m_l^2 sin theta cos theta \
  cos^3(theta) - 2 cos theta sin^2(theta) + 3 cos theta sin^2(theta) - C sin^2(theta) cos theta &= m_l^2 cos theta \
  cos^2(theta) - 2 sin^2(theta) + 3 sin^2(theta) - m_l^2 &= C sin^2(theta) \
  cos^2(theta) + sin^2(theta) - m_l^2 &= C sin^2(theta) \
  C &= -m_l^2 / (sin^2(theta))
$

=

==

$
  n &= 4 \
  l &= 3 \
  m &= 3 \
$

$
  psi_(4, 3, 3) (r, theta, phi.alt) &= R_(4, 3) (r) Y_l^m_l (theta, phi.alt)
$

Let's solve for the radial part:

Things to know:

$
  k &eq.triple sqrt((-2m E) / planck.reduce^2) \
  rho &eq.triple k r \
$

Actually solving:

$
  R_(4, 3)(r) &= 1 / r rho^4 e^(-rho) v(rho)
$

Solve for $v(rho)$:

$
  v(p) &= sum_(j = 0)^0 c_j rho^j \
  &= c_0 rho^0 \
  &= c_0
$

Plugging back in:

$
  R_(4, 3)(r) &= 1 / r rho^4 e^(-rho) c_0 \
  &= c_0 k^4 r^3 e^(-k r)
$

Now we can do the angular part...

$
  Y_3^3 (theta, phi.alt) &= Theta(theta) Phi(phi.alt)
$

$
  Phi(phi.alt) &= e^(i m_l phi.alt) \
  &= e^(3i phi.alt)
$

$
  Theta(theta) &= A P_3^3 (cos theta) \
  &= 1 / 8 sqrt(70) sin^2(theta)
$

// We will use $x = cos theta$ for now until we have the polynomial.

// $
//   P_3(cos theta) &= 1 / (8 dot 6) dif^3 / (dif theta^3) (cos^2(theta) - 1)^3 \
//   &= 1 / 48
// $

// $
//   P_3^3 (cos theta) &= (-1) (1 - cos^2 theta)^(3 / 2) (dif) / (dif theta) P_3(cos theta)
// $

Combining radial and angular parts:

$
  psi_(4, 3, 3)(r, theta, phi.alt) &= c_0 k...
$

=

==

$
  P(r_1 < r < r_2) &= integral_(r_1)^(r_2) R^*(r) R(r) dif r \
$

==

$
  R_(1 0)(r) &= c_0 / a_0 e^(-r \/ a_0)
$

We can normalize to find $c_0$:

$
  1 / c_0^2 &= 1 / a_0^2 integral_0^infinity e^(-2 r \/ a_0) dif r \
  1 / c_0^2 &= 1 / a_0^2 (- a_0 / 2) lr(e^(- 2 r \/ a_0)|)_(r = 0)^infinity \
  1 / c_0^2 &= 1 / (2 a_0) \
  c_0 &= sqrt(2 a_0)
$

$
  P(r < 10^(-15) " m") &= integral_0^(10^(-15)) 2 / a_0 e^(- 2r \/ a_0) dif r \
  &= -1 (e^(- 2 dot 10^(-15)) - 1) \
  &= 1 - exp(-2 dot 10^(-15)) \
  &approx 2 times 10^(-15)
$

So basically a zero probability, which makes sense... The electron should not be _inside_ of the proton.

==

