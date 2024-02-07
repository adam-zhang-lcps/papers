#import "@preview/tablex:0.0.6": tablex, rowspanx
#import "aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
    title: "Calculating the Mass Needed to Stretch an Elastic Material",
    course: "AET AP Physics C: Mechanics",
    teacher: "Mr. Matthew Hilsdorf",
    date: datetime(year: 2024, month: 01, day: 30),
    appendix: [
        #let data = csv("assets/barbie-bungee-jump/data.csv")

        #show figure: set block(breakable: true)
        #figure(caption: [Raw Data from Materials Tester])[
            #table(columns: (auto, auto, auto, auto, auto), ..data.flatten())
        ]
    ],
    draft: true,
    doc,
)

= Introduction
== Purpose
Determine the mass $m$ required to stretch a 2.5m length of thin surgical
tubing exactly to the floor when dropped from a height of 6.0m.

== Hypothesis
0.515kg of mass will be needed to be attached to the end of the elastic
surgical tubing in order to stretch it 6.0m when dropped.

== Background <background>
// TODO: do this properly, with citations
Elastic materials exhibit relationships between force ($F$) and displacement ($x$).
While many materials obey Hooke's Law and demonstrate relationships that are
linear, others instead exhibit more complicated relationships.

Work done on a system is equal to the change in energy of that system, and can
be found by integrating force with respect to distance.

$ W = integral F(x) dif x $

Therefore, if the displacement vs. force graph for an elastic material is
known, the work done by that material can be calculated
@Hilsdorf2024BarbieBungeeJump. Part one of this experiment will use a material
testing device to empirically calculate a displacement vs. force function via
regression.

Part two of this experiment considers a bungee jump scenario. In such a
scenario, an elastic material with length $L$ is attached to a mass, which is
then dropped. The material stretches a distance $y$ until, for a moment in
time, the mass comes to rest. Since the elastic material exerts no force until
the mass has fallen its length, it will begin to do work once the mass reaches
a distance of $L$ @Hilsdorf2024BarbieBungeeJump.

$ W_"elastic" = -integral_L^y F(x - L) dif x $
$ W_"elastic" = -integral_0^(y-L) F(x) dif x $

Additionally, gravity also does work on the mass, equal to $m g y$. Since the
motion considered begins and ends at rest, the change in the kinetic energy of
the mass must be zero, which means that the work done by the elastic material
and the work done by gravity must be equal and opposite.

$ -W_"elastic" = W_g $
$ -integral_0^(y-L) F(x) dif x = m g y $

This experiment aims to calculate the mass required to stretch a 2.5m length
of thin surgical tubing 6.0m using the above equation.

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
// TODO: setup pictures
This experiment has two procedures. The first procedure will use the materials
tester to empirically calculate a force of distance function, $F(x)$, for the
surgical tubing. The second procedure will use the calculated function to
hypothesize a mass which, when dropped, will stretch 2.5m of thin surgical
tubing exactly 6.0m.

=== Part 1 <procedure-1>
+ Cut out 0.10m of thin surgical tubing.
// TODO: Perhaps detail this?
+ Use the materials tester to obtain force vs. distance data for the surgical
    tubing.
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
+ Tie one end of the surgical tubing to Barbie, ensuring that the knot ends
    where the tape indicates.
+ Tie the other end of the surgical tubing to the drop platform, again ensuring
    the knot ends where the tape indicates.
+ Place a meter stick on the ground to use as a frame of reference.
+ Drop Barbie from rest. Use a device to record the drop to determine how close
    to the ground Barbie reached.

= Results
== Data
The graph of strain vs. load obtained from the data collected using the
Materials Tester is shown in @strain-graph, along with a third-degree
polynomial regression. @summary shows a summary of the other values measured
or calculated (see #link(label("calculations"), "Calculations")) throughout
this experiment.

// TODO: this doesn't need a title, it's already in the caption
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

$ F_"strain" (epsilon) = 4.772epsilon^3 - 15.251epsilon^2 + 21.320epsilon + 0.419 $
$ F(x) = F_"strain" (x/L) = F_"strain" (x/2.5) = 0.305408x^3 - 2.44016x^2 + 8.528x + 0.419 $

Then, $F(epsilon)$ can be substituted into the left side of the equation from
the #link(label("background"), "Background"), and then solved for $m$.

$ integral_0^(y-L) F(x) dif x = m g y $
$ integral_0^(6.0-2.5) F(x) dif x = m (9.8) (6.0) $
$ integral_0^3.5 F(x) dif x = 58.8m $
$ 58.8m = 30.284 $
$ m = 0.515"kg" $

=== Part 2
The expected stretch length was 6.0m, while the experimental stretch length
was only 5.47m. This results in a percent error of 8.83%.

$ "% error" &= (|"experimental" - "theoretical"|)/"theoretical" dot 100 \
&= (|5.47 - 6.0|)/6.0 dot 100 \
&= 8.83% $

= Discussion
== Conclusion
The experiment was successful in accomplishing its purpose. The hypothesis
proved to be reasonably close to a real value, only off by 53cm (an error of
8.83%). This demonstrates that conservation of energy is a reasonable way to
predict motion.

== Errors
There are many sources of error throughout this experiment that could have
resulted in an 8.83% error. One such source of error is the inaccuracy of tied
knots in retaining the length of the tubing. Since extra tubing had to be left
in order to allow knots to be tied, it is likely that these knots did not
perfectly retain the length between them. However, it is difficult to know
whether the knots increased or decreased the true length of elastic material,
so it is uncertain how measurements were affected.

Another source of error in this experiment is the failure to account for
external forces acting upon the system. Energy is only conserved within an
isolated system; however, in this experiment, there are forces originating
from outside the system. The most notable is air resistance, which would
decrease the velocity of Barbie as she fell. Therefore, it would result in a
decrease in measured values, which is what was observed in the experiment.

== Applications
Conservation of energy is a well-established law in physics. Therefore,
understanding how to apply it to solve real-world problems is a key skill and
essential in dealing with real-world systems. For example, hydropower plants
convert the gravitational potential energy of the falling water into
mechanical and then electrical energy using generators.

