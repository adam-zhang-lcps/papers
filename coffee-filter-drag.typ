#import "@preview/tablex:0.0.6": tablex, rowspanx
#import "aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
    title: "Investigating Drag Forces on Falling Coffee Filters",
    course: "AET AP Physics C: Mechanics",
    teacher: "Mr. Matthew Hilsdorf",
    date: datetime(year: 2023, month: 12, day: 7),
    doc,
)

= Introduction
== Purpose
Determine the model of drag that most accurately represents the motion of a
coffee filter falling from rest. Determine the effect of mass on terminal
velocity.

== Hypothesis
The model of drag that will most accurately represent the motion of the coffee
filter is laminar flow, or $F_"drag" = -b v$. Laminar flow more closely models
objects moving at relatively slow velocities, such as the coffee filter.

Assuming a laminar flow ($n = 1$ in $-b v^n$; see #link(label("background"), "Background")),
mass will have a directly proportional relationship with terminal velocity. The
derivation for this conclusion is as follows: beginning with Newton's 2nd Law,
the coffee filter experiences a downward force of gravity, and a drag force in
the opposite direction.
$ a = (m g - b v^n)/m $
Since terminal velocity is reached when acceleration is equal to zero, the
equation can be solved for velocity as follows.
$ 0 = (m g - b v^n)/m $
$ 0 = m g - b v^n $
$ m g = b v^n $
$ v^n = (m g)/b $
Again, assuming a laminar flow, $n = 1$, resulting in velocity being directly
proportional to mass.

== Background <background>
Objects moving through fluids, including air, experience a resistive force
opposing the direction of their motion. The magnitude of this resistive force,
or drag force, is dependent upon the velocity of the object.
$ F_"drag" = -b v^n $
$b$ is a constant that depends upon many factors, such as the density of the
fluid and the cross-sectional area of the object. $n$ indicates the type of drag
relationship, of which there are commonly two: laminar flow, where $n = 1$, and
turbulent flow, where $n = 2$. Laminar flow is commonly experienced by objects
moving at relatively low velocities, whilst turbulent flow is experienced by
objects moving at relatively high velocities.

Since drag is dependent upon velocity, an accelerating object will eventually
reach a point where the drag force is equivalent to the force providing
acceleration. This state is known as terminal velocity, where the object will no
longer gain or lose speed @Hilsdorf2023CoffeeFilterDragHandout.

Objects that experience relatively high drag forces will reach terminal velocity
quickly. This experiment will measure the terminal velocity of a coffee filter,
a lightweight object with a large cross-sectional area, and will attempt to
determine which model of drag more accurately fits the motion---laminar or
turbulent. Additionally, this experiment will attempt to determine how the mass
of an object affects the terminal velocity by stacking multiple coffee filters
together.

= Methods
== Materials
The following materials are required for this experiment.
- Balance
- 5 large coffee filters
- Vernier#emoji.reg Motion Sensor
- Vernier#emoji.reg Graphical Analysis software

The setup for this experiment is shown in @setup.

#figure(
    image("assets/coffee-filter-setup.jpeg", width: 50%),
    caption: "Experimental Setup",
)<setup>
== Procedures
The following procedure was implemented during this experiment.
+ Open Vernier#emoji.reg Graphical Analysis and pair with the Vernier#emoji.reg Motion
    Sensor. Place the Motion Sensor on the ground, facing upwards.
+ Measure the mass of a single coffee filter using the balance. Record the mass in
    @data. <proc-outer-start>
+ Hold the coffee filter high above the motion sensor. Begin collecting data in
    Vernier#emoji.reg Graphical Analysis, then drop the coffee filter.
    <proc-inner-start>
+ Once the coffee filter reaches the ground, end the data collection.
+ Highlight the linear section of the position vs. time graph in Vernier#emoji.reg Graphical
    Analysis. Apply a linear fit curve. Record the slope in @data as terminal
    velocity. An example is shown in @vernier-example. <proc-inner-end>
+ Repeat steps #link(label("proc-inner-start"), "3")#sym.dash.en#link(label("proc-inner-end"), "5") to
    obtain data for a second trial. <proc-outer-end>
+ Repeat steps #link(label("proc-outer-start"), "2")#sym.dash.en#link(label("proc-outer-end"), "6") for
    2, 3, 4, and 5 filters stacked together.
+ Plot mass vs. terminal velocity. Fit a linear trendline, and record the slope
    and $R^2$ in @trendlines.
+ Plot mass vs. terminal velocity squared. Fit a linear trendline, and record the
    slope and $R^2$ in @trendlines.

#figure(
    image("assets/coffee-filter-vernier-screenshot.png", width: 70%),
    caption: [Example of Selecting and Fitting a Linear Trendline to Find Terminal Velocity],
) <vernier-example>

= Results
== Data
@data shows the determined terminal velocity and calculated terminal velocity
squared for each trial for each stack of filters, along with the mass for each
stack of filters.

#figure(tablex(
    align: center + horizon,
    columns: 5,
    [\# of Filters],
    [Mass (kg)],
    [Trials],
    [$V_T$ (m/s)],
    [$V_T^2$ (m#super([2])/s#super([2]))],
    rowspanx(2)[1],
    rowspanx(2)[0.03],
    [1],
    [0.8601],
    [0.7398],
    [2],
    [0.8377],
    [0.7017],
    rowspanx(2)[2],
    rowspanx(2)[0.07],
    [1],
    [1.244],
    [1.548],
    [2],
    [1.223],
    [1.496],
    rowspanx(2)[2],
    rowspanx(2)[0.10],
    [1],
    [1.521],
    [2.313],
    [2],
    [1.571],
    [2.468],
    rowspanx(2)[2],
    rowspanx(2)[0.14],
    [1],
    [1.652],
    [2.729],
    [2],
    [1.711],
    [2.928],
    rowspanx(2)[2],
    rowspanx(2)[0.17],
    [1],
    [2.075],
    [4.306],
    [2],
    [1.894],
    [3.587],
), caption: "Terminal Velocity per Filter Stack", kind: table) <data>
== Calculations
To determine whether laminar flow ($n = 1$) or turbulent flow ($n = 2$) was a
better fit for the motion of the coffee filter, two graphs were created;
@tv-vs-mass fits a linear equation to mass vs. terminal velocity, and
@tv2-vs-mass fits a linear equation to mass vs. terminal velocity squared.

#figure(
    image("assets/coffee-filter-drag-mass-vs-tm.png", width: 70%),
    caption: "Mass vs. Terminal Velocity",
) <tv-vs-mass>
#figure(
    image("assets/coffee-filter-drag-mass-vs-tm2.png", width: 70%),
    caption: "Mass vs. Terminal Velocity Squared",
) <tv2-vs-mass>

#figure(tablex(
    align: center + horizon,
    columns: (20%, 20%),
    [Data Range],
    [$R^2$],
    [$V_T$],
    [0.962],
    [$V_T^2$],
    [0.954],
), caption: [$R^2$ per Data Range], kind: table) <trendlines>
= Discussion
== Conclusion
The experiment was successful in accomplishing its purpose, and both hypotheses
were supported by the data collected.

As shown in @trendlines, a linear fit of mass vs terminal velocity ($V_T$) was a
better fit, indicating that the drag force in the motion of the coffee filter is
better modeled by a laminar flow, where $F_"drag" = -b v$.

As shown in @tv-vs-mass, an increase in mass correlated with an increase in
terminal velocity. Given the high accuracy of a linear fit to the data, the
correlation is likely linear as hypothesized.

== Errors
The primary source of error is the requirement for human judgement in
determining terminal velocity. To determine terminal velocity, the graph of
position vs. time for the falling coffee filter was manually observed, and the
linear-appearing section was selected, and applied with a linear curve fit. This
could cause random error in the data collected, since the judgement was
imprecise. Additionally, the time that the filter spent with terminal velocity
was small, making errors likely to be amplified. Further experimentation could
make use of more advanced equipment and instruments as well as a further fall
distance to eliminate this error.

Another possible source of error is the movement of the coffee filter while
falling. Given that the shape of the filter is not perfectly uniform, drag
forces would cause the filter to rotate, changing the cross-sectional area and
consequently the $b$ value which is assumed to be constant. Further
experimentation could attempt to reduce this error via carefully constructed
apparatus or account for the change in calculations.

== Extensions
Drag forces play a large role in everyday interactions, and understanding of
their behavior plays a key role in designing complex machinery such as vehicles.
One example are airplanes, which are heavily affected by drag forces, especially
at their high speeds. Another example of drag forces are within fluids, such as
water; submarines moving through the ocean are also subject to drag forces. In
both these cases, understanding of drag forces is crucial in making them
possible.