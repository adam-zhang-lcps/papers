#import "@preview/tablex:0.0.6": tablex, rowspanx
#set page(paper: "us-letter", margin: 1in, header: align(right)[
    #counter(page).display()
])
#set par(leading: 1.5em, first-line-indent: 0.5in)
#set text(font: "New Computer Modern", size: 11pt)
#show heading.where(level: 1): it => [
    #set text(size: 11pt, weight: "bold")
    #set align(center)
    #block(it.body, spacing: 1.5em)
]
#show heading.where(level: 2): it => [
    #set text(size: 11pt, weight: "bold")
    #block(it.body, spacing: 1.5em)
]
#set list(indent: 0.5in)
#set enum(indent: 0.5in)
#set figure.caption(position: top, separator: "")
#show figure.caption: it => block(width: 100%)[
    #set align(left)
    #set par(first-line-indent: 0in)
    *#it.supplement #it.counter.display()*

    #emph(it.body)
]

#block(
    width: 100%,
    height: 100%,
)[
    #align(
        center + horizon,
    )[
        #block(below: 4em)[*Investigating Drag Forces on Falling Coffee Filters*]

        Adam Zhang

        Academy of Engineering and Technology, Academies of Loudoun

        AP Physics C: Mech, Block 2

        Mr. Matthew Hilsdorf

        November 29, 2023
    ]
]

#outline(indent: 0.25in)
#pagebreak()

= Introduction
== Purpose
Determine the model of drag that most accurately represents the motion of a
coffee filter falling from rest. Determine the effect of mass on terminal
velocity.== Hypothesis The model of drag that will most accurately represent the
motion of the coffee filter is laminar flow, or $F_"drag" = -b v$. Laminar flow
more closely models objects moving at relatively slow velocities, such as the
coffee filter.

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
#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

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
    velocity. <proc-inner-end>
+ Repeat steps #link(label("proc-inner-start"), "3")#sym.dash.en#link(label("proc-inner-end"), "5") to
    obtain data for a second trial. <proc-outer-end>
+ Repeat steps #link(label("proc-outer-start"), "2")#sym.dash.en#link(label("proc-outer-end"), "6") for
    2, 3, 4, and 5 filters stacked together.
+ Plot mass vs. terminal velocity. Fit a linear trendline, and record the slope
    and R^2 in @trendlines.
+ Plot mass vs. terminal velocity squared. Fit a linear trendline, and record the
    slope and R^2 in @trendlines.

= Results
== Data
@data shows the determined terminal velocity for each trial for each stack of
filters, along with the mass for each stack of filters.

#figure(tablex(
    align: center + horizon,
    columns: (auto, auto, auto, auto),
    [\# of Filters],
    [Mass (kg)],
    [Trials],
    [$V_T$ (m/s)],
    rowspanx(2)[1],
    rowspanx(2)[0.03],
    [1],
    [0.8601],
    [2],
    [0.8377],
    rowspanx(2)[2],
    rowspanx(2)[0.07],
    [1],
    [1.244],
    [2],
    [1.223],
    rowspanx(2)[2],
    rowspanx(2)[0.10],
    [1],
    [1.521],
    [2],
    [1.571],
    rowspanx(2)[2],
    rowspanx(2)[0.14],
    [1],
    [1.652],
    [2],
    [1.711],
    rowspanx(2)[2],
    rowspanx(2)[0.17],
    [1],
    [2.075],
    [2],
    [1.894],
), caption: "Terminal Velocity per Filter Stack", kind: table) <data>
== Calculations
#lorem(60)

#figure(table()) <trendlines>
= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)

#pagebreak()
#set par(first-line-indent: 0in)
#bibliography("refs.bib", title: "References", style: "apa")
