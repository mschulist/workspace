#import "../template.typ": *

#set page("us-letter", numbering: "1", number-align: center)
#set heading(numbering: "1.a)")
#set text(size: 12pt)
#set math.equation(numbering: "(1)")

#align(center)[
  #block(text(weight: 700, 1.75em, [Last-minute Exam 1 Review: QM217]))
  #block(text(weight: 400, 1.4em, [Friday, November 1, 2024]))
]

= EM Radiation as Particles (3.53)

An electron moving to the left at $0.8c$ collides with an incoming photon moving to the right. After the collision, the electron is moving to the right at $0.6c$ and an outgoing photon moves to the left. What was the wavelength of the incoming photon?

= EM Radiation as Particles (3.47)

A photon has the same momentum as an electron moving at $10^6 " " upright(m) / upright(s)$.

a.) Determine the photon's wavelength.

b.) What is the ratio of the kinetic energies of the two? (A photon is all kinetic energy.)

= Matter as Waves (4.71)

a. Find the wavelength of a proton whose kinetic energy is equal to its internal energy.

b. The proton roughly has a radius of $10^(-15)$ m. Would this proton behave as a wave or as a particle?

= Uncertainty Principle (4.61)

If a laser pulse is of short enough duration, it becomes rather superfluous to refer to its specific color. How short a duration must a light pulse be for its range of frequencies to cover the entire visible spectrum? (The visible spectrum is about $4.5 times 10^(14) "Hz" < f < 7.5 times 10^(14) "Hz"$).

= Fourier Transform (4.69:)

A signal is described by

$
  D(t) = C e^(-abs(t) / tau)
$

a.) Calculate the Fourier transform $A(omega)$.

b.) How are $D(t)$ and $A(omega)$ affected by a change in $tau$?

= Break Time to Look at Cool Picture

#figure(
  image("quantum_corral.jpg", width: 70%),
  caption: [A standing wave in a quantum corral],
)

"We used a scanning tunneling microscope, in which a metal needle under computer control is made to move along the contours of the surface being imaged. The height of the needle at each location on a square grid of points is recorded as a number in the computer. This sequence of numbers representing the height of the surface at each point on the grid is then rendered by the computer to look like a three-dimensional solid."

= Bound States (5.5)

Just what is stationary in a stationary state? The particle? Something else?

= Bound States: Delta Well (5.47)

Consider the delta well potential energy:

$
  U(x) = cases(
    0 &quad x eq.not 0 \
    -infinity &quad x = 0
  )
$

Although not completely realistic, this potential energy is often a convenient approximation to a _very_ strong, _very_ narrow attractive potential energy well. It has only one allowed bound-state wave function, and because the top of the well is defined as $U = 0$, the corresponding bound-state energy is negative. Call its value $-E_0$.

#figure(
  image("delta_well.png", width: 40%),
  caption: [Delta Well],
)

a. Applying the usual arguments and required continuity conditions (need it be smooth?), show that the wave function is given by

$
  psi(x) = ((2 m E_0) / planck.reduce^2)^(1 / 4) e^(-(sqrt(2 m E_0) \/ planck.reduce) abs(x))
$

b. Sketch $psi(x)$ and $U(x)$ on the same diagram. Does this wave function exhibit the expected behavior in the classically forbidden region?