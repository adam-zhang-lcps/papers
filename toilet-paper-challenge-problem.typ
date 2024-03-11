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

= Calculations
== Part 1
=== Rotational Inertia
First, the rotational inertia of the toilet paper roll must be calculated for
the next part. For a partially-hollow cylinder, rotational inertia is as
follows:
$ I = 1/2 m (r_1^2 + r_2^2) $

Plugging in the measured numbers yields the following:
$ I = "??" $ // TODO get measurements (why did I not write this down…)

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

Finally, substituting measured values results in the following:
// TODO I need these numbers 😭
$ a = 6.274 "m/s"^2 $

== Part 2
Since the falling toilet paper roll experiences uniform acceleration and
begins falling from rest, the time which it takes to reach the ground can be
calculated using the following basic kinematic equation.
$ Delta y = 1/2 g t^2 $

Substituting in known values yields the following: // TODO
$ 1"m " = 1/2 dot 9.81"m/s"^2 dot t^2 $ // HACK for some reason a single character in a string stays in math font, but adding a space makes it text ¯\_(ツ)_/¯
$ t &= sqrt(2 / 9.81) \
    &= 0.452"s " $

Since the drop height of the held roll also experiences near-uniform acceleration, the drop height can be calculated using the same equation as above.
$ Delta y &= 1/2 g t^2 \
    &= 1/2 dot 6.274"m/s"^2 dot 0.452^2"s "^2 \
    &= 0.641"m " $
= Results
