#import "../template.typ": *

#set page("us-letter", columns: 2, numbering: "1", number-align: center)
#set par(justify: true)
#set heading(numbering: "1.a)")
#set math.equation(numbering: "(1)")

= Constants

$
  c &= 2.99 times 10^8 [upright(m) / upright(s)] \
  G &= 6.67 times 10^(-11) [(upright(N) dot upright(m)^2) / "kg"^2] \
  planck &= 6.626 times 10^(-34) [upright(J) dot upright(s)] \
  &= 4.136 times 10^(-15) ["eV" dot upright(s)] \
  planck dot c &= 1.986 times 10^(-25) [upright(J) dot upright(m)] \
  &= 1240 ["ev" dot "nm"] \
  planck.reduce = planck / (2pi) &= 1.0546 times 10^(-34) [upright(J) dot upright(s)] \
  &= 6.582 times 10^(-16) ["eV" dot upright(s)] \
  e &= 1.602 times 10^(-19) [upright(C)] \
  m_e &= 9.101 times 10^(-31) ["kg"] \
  m_p &= 1.673 times 10^(-27) ["kg"] \
  m_n &= 1.675 times 10^(-27) ["kg"] \
  k_B &= 1.380649 times 10^(-23) [upright(J) / upright(K)]
$

= Electromagnetic Spectrum

$
  I_("avg") &= 1 / 2 epsilon_0 c E_0^2
$

== Blackbody

$
  lambda f = c
$

$
  E &= planck f = planck c / lambda
$

Red is cooler, so red light has a lower frequency. Red light has a bigger $lambda$, smaller $f$.

If $overline(E)$ is the average energy per wave, then:

$
  dif U(f) = overline(E) dot dif N(f)
$

New claim:

$
  E = n planck f quad n in NN italic("quantization")
$

$
  (dif N(f)) / (dif f) &= (8 pi V f^2) / (c^3) quad V = "volume" [upright(m)^3]
$

We will have standing waves in a region of length $L$, so only certain harmonics are allowed.

$
  f_1 &= v / (2 L) \
  f_n &= (n v) / (2 L)
$

== Compton Effect

Elastic scattering

$
  p &= planck / lambda
$

$
  E &= p c
$

$
  lambda' - lambda &= (planck) / (m c) (1 - cos(theta))
$ <compton-scattering>

@compton-scattering is the Compton Scattering equation showing how the wavelength of light changes when it "scatters" off something (like an electron).

The max increase $(Delta lambda)$ happens when $theta = 180 degree$.

