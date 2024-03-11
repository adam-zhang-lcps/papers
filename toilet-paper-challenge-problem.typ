#set document(
    title: "Challenge Problem: Toilet Paper Roll",
    author: "Adam Zhang",
    date: datetime.today(),
)
#set text(font: "New Computer Modern")

#align(center)[
    #text(size: 24pt)[Challenge Problem: Toilet Paper Roll]
]

= Purpose
The purpose of this experiment is to predict the falling rate of an unrolling
toilet paper roll. The success of the calculations will be determined by a
video recording of an unrolling roll and a falling roll dropped from different
heights.

= Materials
In solving this problem, the following materials were used:
- Two toilet paper rolls
- Ruler
- Scale

= Procedure
// TODO
+ Measure the outer radius of the toilet paper roll.
+ Measure the inner (hollow) radius of the toilet paper roll.
+ Measure the mass of the toilet paper roll using the scale.

= Calculations
== Part 1
=== Rotational Inertia
First, the rotational inertia of the toilet paper roll must be calculated for
the next part.
$ I = integral x^2 dif m $

For a partially-hollow cylinder, rotational inertia can be calculated using
volumetric density:
$ phi = m/V $
$ I = integral x^2 phi dif V $

Substituting an expression for change in volumetric density is as follows:
$ I = integral x^2 phi dot 2 pi x h dif x $

Since the mass of a partially-hollow cylinder is contained within two rings,
the bounds of integration are from the inner ring to the outer ring.
$ I &= integral_r^R x^2 phi dot 2 pi x L dif x \
    &= 2 phi pi L integral_r^R x^3 dif x $

Integrating yields the following:
$ I &= 2 phi pi L dot (1/4 R^4 - 1/4 r^4) \
&= 1/2 dot m/V dot pi dot L dot (R^4 - r^4) \
    &= 1/2 dot m/(pi L (R^2 - r^2)) dot pi L dot (R^4 - r^4) \
    &= 1/2 m dot (R^4 - r^4)/(R^2 - r^2) \
    &= 1/2 m dot ((R^2 + r^2)(R^2 - r^2))/(R^2 - r^2) \
    &= 1/2 m (R^2 + r^2) $

Plugging in the measured numbers yields the following:
$ I = 1/2 dot 0.175"kg" dot (0.02^2"m "^2 + 0.054^2"m "^2) $
$ I = 0.000290 "kg m"^2 $

=== Acceleration Function
Applying Newton's 2nd Law for both the translational and rotational motion
yields the following two equations:
$ a = F_"net"/m "and" alpha = tau_"net"/I $

Linear acceleration can be solved from rotational acceleration:
$ alpha = a/R $
$ a = alpha R = (tau_"net" R)/I $

Since the tension force from the held toilet paper is the only torque exerted
on the rotating system, $tau_"net" = limits(T)^arrow R$. // TODO there has to be a better way to do vector notation?
$ a = (limits(T)^arrow R^2)/I $

The translational acceleration equation can then be solved for $limits(T)^arrow$.
$ a = F_"net"/m = (m g - limits(T)^arrow)/m $
$ limits(T)^arrow = m(g-a) $

$limits(T)^arrow$ can then be substituted into the earlier equation.
$ a = (m(g-a) R^2)/I $

Solving for $a$ yields the following:
$ a = (m g R^2)/(I + m R^2) $

Finally, substituting in rotational inertia results in the following:
$ a = (m g R^2)/(1/2 m (r^2 + R^2) + m R^2) $
$ a = (2 g R^2)/(r^2 + R^2 + 2R^2) $
$ a = (2 g R^2)/(r^2 + 3R^2) $

Finally, substituting measured values results in the following:
// TODO I need these numbers 😭
$ a = (0.175"kg" dot 9.8"m/s"^2 dot 0.054^2"m "^2)/(0.000290"kg m"^2 + 0.175"kg" dot 0.054^2"m "^2) $
$ a = 6.249 "m/s"^2 $

== Part 2
Since the falling toilet paper roll experiences uniform acceleration and
begins falling from rest, the time which it takes to reach the ground can be
calculated using the following basic kinematic equation.
$ Delta y = 1/2 g t^2 $

The equation can then be solved for $t$.
$ t = sqrt((2 Delta y)/g) $

Substituting in known values yields the following: // TODO
$ 1"m " = 1/2 dot 9.81"m/s"^2 dot t^2 $ // HACK for some reason a single character in a string stays in math font, but adding a space makes it text ¯\_(ツ)_/¯
$ t &= sqrt(2 / 9.81) \
&= 0.452"s " $

Since the drop height of the held roll also experiences near-uniform
acceleration, the drop height can be calculated using the same equation as
above, substituting in the time from the above drop.
$ Delta y &= 1/2 a t^2 \
    &= 1/2 a (sqrt((2 Delta y)/g))^2 \
    &= a/2 dot (2 Delta y)/g \
    &= (a Delta y)/g $

$ &= 1/2 dot 6.249"m/s"^2 dot 0.452^2"s "^2 \
&= 0.638"m " $

= Results
== Measurements
#figure(caption: [Toilet Paper Roll Measurements])[
    #table(
        columns: (auto, auto),
        align: (right, left),
        [Outer Radius ($R$)],
        [0.054m],
        [Inner Radius ($r$)],
        [0.020m],
        [Mass ($m$)],
        [0.175kg],
    )
]

== Calculations
