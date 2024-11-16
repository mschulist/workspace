#import "../template.typ": *
#import "@preview/plotst:0.2.0": *

#show: project.with(title: "Problem Set 9")

#set math.equation(numbering: "(1)")

=

$
  psi(x) = A(e^(i k x) + e^(-i k x))
$

Well-defined $p$ means that $Delta p approx 0$. We need to solve for $Delta p$.

$
  hat(p) = - i planck.reduce dif / (dif x)
$

$
  expval(p) &= - i planck.reduce A^2 integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) dif / (dif x) (e^(i k x) + e^(-i k x))
  dif x \
  &= - i planck.reduce A^2 integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) (i k e^(i k x) - i k e^(-i k x)) dif x \
  &= planck.reduce A^2 k integral_(-infinity)^infinity
  (e^(i k x) + e^(-i k x)) (e^(i k x) - e^(-i k x)) dif x \
  &= planck.reduce A^2 k integral_(-infinity)^infinity [e^(2 i k x) - e^(-2 i k x)] dif x \
$

This integral evaluates to $infinity$, so the momentum is not well-defined. This function is essentially just two opposite moving plane waves (with 2 momenta, so not well-defined).

When we apply the $hat(p)$ operator, the function is not just a scalar of the original function. Being an eigenfunction and well-defined are equivalent statements, and in this case $hat(p)$ is not an eigenfunction because there are two opposite-moving plane waves.

=

$
  Psi(x, t) = a_n psi_(n)(x) e^(- i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(- i (E_m / planck.reduce) t)
$

Here we have $a_n$ and $a_m$ which correspond the coefficients of the superposition of wave functions.

We want to show that the frequency of oscillation still only depends on the time. We can start by multiplying by the complex conjugate.

$
  [a_n psi_(n)(x) e^(-i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(- i (E_m / planck.reduce) t)][
    a_n psi_(n)(x) e^(i (E_n / planck.reduce) t) + a_m psi_(m)(x) e^(i (E_m / planck.reduce) t)
  ] \
  ==> a_n^2 psi_(n)^2 + a_m^2 psi_(m)^2 + a_n a_m psi_n^2 psi_n^2 e^(-i t / planck.reduce (
    E_m - E_n
  )) + a_n a_m psi_n^2 psi_n^2 e^(-i t / planck.reduce (E_n - E_m)) \
  ==> a_n^2 psi_(n)^2 + a_m^2 psi_(m)^2 + a_n a_m psi_n^2 psi_n^2 (
    e^(-i t / planck.reduce (E_m - E_n)) + e^(-i t / planck.reduce (E_n - E_m))
  ) \
  ==> a_n^2 psi_(n)^2 + a_n a_m psi_n^2 psi_n^2 [
    cos(t / planck.reduce (E_m - E_n)) - i sin(t / planck.reduce (E_m - E_n)) + cos(t / planck.reduce (E_n - E_m)) - i sin(t / planck.reduce (E_n - E_m))
  ] \
  ==> a_n^2 psi_(n)^2 + 2 a_n a_m psi_n^2 psi_n^2 [cos(t / planck.reduce (E_n - E_m))]
$

We can see that the frequency is determined by $Delta E$, just like in the case where we added the wave functions in equal amounts.

We can see that $omega = (E_n - E_m) / planck.reduce$, which is the angular frequency. Therefore, the oscillation frequency only depends on $Delta E$, just like in the case where we added the two wave functions in equal amounts.

=

$
  psi(x, 0) = C[psi_1(x) + psi_2(x)]
$

==

$
  1 &= C^2 integral_(-infinity)^infinity [psi_1^*(x) psi_1(x) + psi_2^*(x) psi_2(x)] dif x \
  1 &= C^2 [
    integral_(-infinity)^infinity psi_1^*(x) psi_1(x) dif x + integral_(-infinity)^infinity psi_2^*(x) psi_2(x) dif x
  ] \
  "orthonormal" ==> quad 1 &= 2 C^2 \
  C &= 1 / sqrt(2)
$

==

We know that the Hamiltonian $hat(H) = hat(T) + hat(U)$. We want to show the following:

$
  hat(H) psi(x, 0) &= lambda psi(x, 0)
$

In the S.E.:

$
  diff^2 / (diff x^2) psi(x, 0) &prop E psi(x, 0)
$

We know that because this is a superposition of wave functions, the value of $E$ depends on $x$ (it can either be $E_1$ or $E_2$, but we don't know which one), so it cannot be an eigenfunction.

Because the Hamiltonian is not an eigenfunction, we can conclude that energy is not well-defined (it can either take $E_1$ or $E_2$, but we don't know which).

// We also know that $hat(T) = - planck.reduce^2 / (2 m) diff^2 / (diff x^2)$ and $hat(U)(x) = U(x)$.

// When we take the second derivative of $psi(x, 0)$,


==

We know that the time component $phi.alt(t) = e^(-(i E n) / planck.reduce t)$. We can plug this into our wave function to get the time component.

$
  Psi(x, t) &= 1 / sqrt(2) [psi_1(x) e^(-(i E_1) / planck.reduce t) + psi_2(x) e^(-(i E_2) / planck.reduce t)]
$

==

We can use the energy operator on $Psi(x, t)$ to find the average energy $expval(E)$.

$
  hat(H) = - diff^2 / (diff x^2) planck.reduce / (2m) + hat(U)(x)
$

$
  expval(H) &= 1 / 2 integral_(-infinity)^infinity (
    psi^*_1(x) e^((i E_1) / planck.reduce t) + psi^*_2(x) e^((i E_2) / planck.reduce t)
  ) (hat(H) psi_1(x) e^(- (i E_1) / planck.reduce t) + hat(H) psi_2(x) e^(- (i E_2) / planck.reduce t)) dif x \
  &= 1 / 2 integral_(-infinity)^infinity [
    psi_1^*(x) hat(H) psi_1(x) + psi_2(x) hat(H) psi_2^*(x) + psi_1^*(x) hat(H) psi_2(
      x
    ) e^((i E_1) / planck.reduce t) + psi_2^*(x) hat(H) psi_1(x) e^(- (i E_1) / planck.reduce t)
  ] dif x \
  &= 1 / 2 (E_1 + E_2)
$



We can simplify like this because of orthonormality and the fact that the Hamiltonian is an eigenfunction of each of the wave functions individually, where all of the other terms will either integrate to 0 or 1.

When we solve the terms with the exponential parts, the orthonormality will make the "coefficient" evaluate to $0$. For the other terms, they are equal to $E_1$ or $E_2$ because of orthonormality (after we apply the Hamiltonian operator, which is just the energy corresponding to each of the two wave functions).

==

$
  expval(x) &= integral_(-infinity)^infinity x abs(Psi(x, t))^2 dif x \
  &= 1 / 2 integral_(-infinity)^infinity x (
    psi_1^*(x) e^(i E_1 / planck.reduce t) + psi_2^*(x) e^(i E_2 / planck.reduce t)
  ) (psi_1(x) e^(- i E_1 / planck.reduce t) + psi_2(x) e^(- i E_2 / planck.reduce t)) dif x \
  &= 1 / 2 integral_(-infinity)^infinity x(
    psi_1^* psi_1 + psi_2^* psi_2 + psi_1^* psi_2 e^(-i t / planck.reduce (
      E_2 - E_1
    )) + psi_2^* psi_1 e^(-i t / planck.reduce (E_1 - E_2))
  ) dif x \
  &= 1 / 2 expval(x_(psi_1)) + 1 / 2 expval(x_(psi_2)) + 1 / 2 integral_(-infinity)^infinity x psi_1^* psi_2 e^(- i t / planck.reduce (E_2 - E_1))dif x + 1 / 2 integral_(-infinity)^infinity x psi_2^* psi_1 e^(- i t / planck.reduce (E_1 - E_2)) dif x
  // &= 1 / 2 integral_(-infinity)^infinity [
  //   x (psi_1^* psi_1 + psi_2 psi_2^*) + cos(2 t / planck.reduce (E_1 - E_2))
  // ] dif x integral_(-infinity)^infinity x(psi_1^* psi_2 + psi_2^* psi_1) dif x
$

If is just so happens that $psi$ is real-valued, then we can do some additional simplification.

$
  expval(x) &= 1 / 2 expval(x_(psi_1)) + 1 / 2 expval(x_(psi_2)) + 1 / 2 integral_(-infinity)^infinity x psi_1^* psi_2^* e^(- i t / planck.reduce (
    E_2 - E_1
  ))dif x + 1 / 2 integral_(-infinity)^infinity x psi_2^* psi_1 e^(- i t / planck.reduce (E_1 - E_2)) dif x \
  &= 1 / 2 expval(x_(psi_1)) + 1 / 2 expval(x_(psi_2)) + cos(2 (E_1 - E_2) / planck.reduce t) integral_(-infinity)^infinity x psi_1 psi_2 dif x
$

=

$
  U_0 = 5 / 4 E
$

$
  psi_"inc" = e^(i k x)
$

==

We know that $E < U_0$, so we can use the equations that correspond to that relationship. We will call region $1$ the region to the left of the step and region $2$ "inside" the step.

$
  k &eq.triple sqrt((2 m E) / planck.reduce^2) \
  K &eq.triple sqrt((2m (U_0 - E)) / planck.reduce^2)
$

$
  psi_1(x) &= underbrace(e^(i k x), psi_"inc") + B e^(- i k x)
$

// We know that the coefficients must be the same as $A^2 / B^2 = 1$, where $A, B$ are the coefficients in front of the two exponential terms in $psi_1(x)$. Therefore, $psi_(1)(x)$ takes the form shown above (the reflected wave is the same as the incident wave, except with a negative "direction").

$
  psi_2(x) &= C e^(- K x)
$

We can enforce continuity of the functions at $x = 0$.

$
  e^0 + B &= C \
  ==> quad 1 + B &= C
$ <eq-for-c>

We can enforce continuity of the derivatives at $x = 0$.

$
  i k - i k B &= -K C \
  i k (1 - B) &= -K C
$

We can substitute in from @eq-for-c to solve for $B$.

$
  i k (1 - B) &= - K (1 + B) \
  i k - B i k &= - K - B K \
  i k + K &= B i k - B K \
  i k + K &= B (i k - K) \
  B &= (i k - K) / (i k + K)
$

We know the relationship between $U_0$ and $E$, so we can plug that into $K$ and $k$.

$
  K &= sqrt((2m (5 / 4 E - E)) / planck.reduce^2) \
  &= sqrt((1 / 2 m E) / planck.reduce^2)
$

$
  B &= (i sqrt((2m E)) / planck.reduce - sqrt((m E) / (2 planck.reduce^2))) / (i sqrt((2m E)) / planck.reduce + sqrt((m E) / (2 planck.reduce^2))) \
  &= (i + 1 / 2) / (i - 1 / 2) \
  &= 3 / 5 + i 4 / 5
$ <eq-for-b>

We can plug in @eq-for-b into @eq-for-c to find $C$.

$
  C &= 1 + B \
  &= 1 + 3 / 5 + i 4 / 5 \
  &= 8 / 5 + i 4 / 5
$

Finally plugging into our equation for $psi_"refl"(x)$.

$
  psi_"refl"(x) &= (3 / 5 + i 4 / 5)e^(- i k x)
$

And for the wave in region 2.

$
  psi_2(x) = (8 / 5 + i 4 / 5) e^(- K x)
$

// We know that $A + B = C$ (for the coefficients), so $C = 2$. From this, we can determine the wave function inside the potential.

// $
//   psi_2(x) = 2 e^(- K x)
// $

==

Because $U_0 < E$, we know that the entire wave must be reflected (none of it will classically go past $x = 0$). Therefore, the reflection coefficient is $1$.

We can also find the magnitude of $B$ (which is the reflection coefficient) and recover $1$.

$
  B^* B &= (3 / 5 + i 4 / 5) (3 / 5 - i 4 / 5) \
  &= 9 / 25 + 16 / 25 \
  &= 1
$