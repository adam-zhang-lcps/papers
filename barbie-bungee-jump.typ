#import "@preview/tablex:0.0.6": tablex, rowspanx
#import "aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
    title: "Barbie Bungee Jump",
    course: "AET AP Physics C: Mechanics",
    teacher: "Mr. Matthew Hilsdorf",
    date: datetime(year: 2024, month: 01, day: 30),
    doc,
)

= Introduction
== Purpose
Determine the mass $m$ required to stretch a [insert elastic material] bungee
cord of length 2.5m exactly to the floor when dropped from a height of 6.0m.

== Hypothesis

== Background

= Methods
== Materials
- [elastic material]
- Meter stick
- Tape measure
- Mass set
- Materials Tester
- Tape

== Procedure
This experiment has two procedures. The first procedure will use the materials
tester to empirically calculate a force of distance, $F(x)$, function. The
second procedure will use the calculated function to hypothesize a mass which,
when dropped, will stretch 2.5m of [elastic material] exactly 6.0m.

=== Part 1 <procedure-1>
+ Cut out 0.10m of [elastic material].
+ [insert material testing steps here]
+ Using the obtained CSV data, calculate strain data ($epsilon_x$) with the load
    and distance columns.
+ Fit a second-degree polynomial regression to strain vs. force ($epsilon_x$ vs $F$).
+ Using the calculated function, evaluate $integral_0^(y-L) F(x) dif x$.
+ With the resulting value for energy, solve for the needed mass $m$ as shown in
    Equation 4.

=== Part 2
+ Cut out a length of elastic material slightly greater than the calculated value
    from #link(label("procedure-1"), "Part 1") (leaving room to tie two knots).
+ Measure out the calculated length using the tape measure, and indicate the

= Results
== Data
== Calculations

= Discussion
== Conclusion
== Errors
== Applications/Extensions
