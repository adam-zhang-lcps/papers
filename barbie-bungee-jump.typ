#import "@preview/tablex:0.0.6": tablex, rowspanx
#import "aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
    title: "Barbie Bungee Jump [TODO]",
    course: "AET AP Physics C: Mechanics",
    teacher: "Mr. Matthew Hilsdorf",
    date: datetime(year: 2024, month: 01, day: 30),
    doc,
)

= Introduction
== Purpose
Determine the mass $m$ required to stretch a 2.5m length of thin surgical
tubing exactly to the floor when dropped from a height of 6.0m.

== Hypothesis

== Background

= Methods
== Materials
- 3m of thin surgical tubing
- Meter stick
- Tape measure
- Mass set
- Materials Tester
- Tape
- Video recording device
- Barbie
- Scale

== Procedure
This experiment has two procedures. The first procedure will use the materials
tester to empirically calculate a force of distance function, $F(x)$, for the
surgical tubing. The second procedure will use the calculated function to
hypothesize a mass which, when dropped, will stretch 2.5m of thin surgical
tubing exactly 6.0m.

=== Part 1 <procedure-1>
+ Cut out 0.10m of thin surgical tubing.
+ [insert material testing steps here]
+ Using the obtained CSV data, calculate strain data ($epsilon_x$) with the load
    and distance columns.
+ Fit a second-degree polynomial regression to strain vs. force ($epsilon_x$ vs $F$).
+ Using the calculated function, evaluate $integral_0^(y-L) F(x) dif x$.
+ With the resulting value for energy, solve for the needed mass $m$ as shown in
    Equation 4.

=== Part 2
+ Using the leftover surgical tubing, measure out 2.5m using the tape measure,
    and indicate the exact length using tape. Ensure there is extra space on both
    ends of the tubing to tie knots.
+ Measure Barbie's mass using the scale.
+ Attach the calculated mass from #link(label("procedure-1"), [Part 1]) minus
    Barbie's mass to Barbie.
+ Tie one end of the surgical tubing to Barbie.
+ Tie the other end of the surgical tubing to the drop platform.
+ Place a meter stick on the ground to use as a frame of reference.
+ Drop Barbie from rest. Use a device to record the drop to determine how close
    to the ground Barbie reached.

= Results
== Data

== Calculations
=== Part 1

= Discussion
== Conclusion
== Errors
== Applications/Extensions
