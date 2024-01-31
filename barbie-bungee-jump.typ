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

== Background <background>

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
The graph of strain vs. load obtained from the data collected using the
Materials Tester is shown in @strain-graph, along with a third-degree
polynomial regression.

#figure(
    image("assets/barbie-bungee-jump/graph.svg"),
    caption: [Strain (m/m) vs. Load (N)],
) <strain-graph>

#figure(table(
    columns: (auto, auto),
    [$L$],
    [2.5m],
    [$m$],
    [0.515kg],
    [$y_"experimental"$],
    [5.47cm],
    [% Error],
    [8.83%],
), caption: [Summary of Values]) <summary>

== Calculations <calculations>
=== Part 1
The function obtained from regression is of strain; first, it must be adjusted
to use the specific trial distance (2.5m).

$ F_"strain" (epsilon) = 4.772x^3 - 15.251x^2 + 21.320x + 0.419 $
$ F(x) = F_"strain" (x/L) = F_"strain" (x/2.5) = 0.305408x^3 - 2.44016x^2 + 8.528x + 0.419 $

Then, $F(epsilon)$ can be substituted into the left side of the equation from
the #link(label("background"), "Background"), and then solved for $m$.

$ integral_0^(y-L) F(x) dif x = m g y $
$ integral_0^(6.0-2.5) F(x) dif x = m (9.8) (6.0) $
$ integral_0^3.5 F(x) dif x = 58.8m $
$ 58.8m = 30.284 $
$ m = 0.515"kg" $

= Discussion
== Conclusion
== Errors
== Applications/Extensions

