#import "@preview/cetz:0.2.2"
#import "@preview/unify:0.5.0": qty, unit
#import "./aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
  title: "Investigating the Variables Affecting Simple Harmonic Motion", course: "AET AP Physics C: Mechanics", teacher: "Mr. Matthew Hilsdorf and Mr. Joseph Meyers", date: datetime(year: 2024, month: 04, day: 19), doc,
)

= Introduction
== Purpose
Investigate what factors of a vibrating spring affect the respective simple
harmonic motion model.

== Hypothesis
Starting displacement ($x_0$) and starting velocity ($v_0$) are correlated with
the amplitude ($A$) and phase shift ($Phi$) of the model. Mass ($m$) is
inversely proportional to period ($omega$). Spring stiffness ($k$) is
proportional to period ($omega$).

== Background
#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

= Methods
== Materials
The following materials are required for this experiment.
- Two springs of different stiffness.
- A bar to hang a spring from.
- Two differing masses.
- A computer capable of running Vernier Graphical Analysis.
- A Vernier Motion Sensor.

The setup for this experiment is shown in @setup and @setup-2.

#figure(
  caption: [Setup of spring system in equilibrium],
)[
  #cetz.canvas(
    length: 20%, {
      import cetz.draw: *
      import cetz.decorations: *

      line(stroke: 3pt, (-1.6, -1.2), (rel: (0, 2.2)))
      line(stroke: 2pt, (-2, 1), (1, 1))

      line(name: "x-axis", stroke: (dash: "dashed"), (-0.2, -0.2), (rel: (1, 0)))
      content((rel: (-0.2, 0), to: "x-axis.start"))[$ x = 0 $]

      coil(
        name: "spring", amplitude: 0.25, start: 5%, end: 95%, line((0.4, 1), (rel: (0, -1))),
      )
      content((rel: (0.3, 0), to: "spring.mid"))[$ k $]

      rect(
        name: "mass", fill: white, (rel: (-0.2, -0.01), to: "spring.end"), (rel: (0.4, -0.4)),
      )
      content("mass")[$ m $]

      rect(name: "sensor", (0.3, -1), (0.5, -1.2))
      arc(
        (rel: (-0.08, 0), to: "sensor.north"), start: 180deg, stop: 360deg, radius: 0.08,
      )
      content((rel: (-0.6, 0), to: "sensor.east"))[Motion Sensor]
      line(stroke: (dash: "dotted"), "sensor.north", "mass.south")
    },
  )
] <setup>

#figure(
  caption: [Setup of spring system before release],
)[
  #cetz.canvas(
    length: 20%, {
      import cetz.draw: *
      import cetz.decorations: *

      line(stroke: 3pt, (-1.6, -1.2), (rel: (0, 2.2)))
      line(stroke: 2pt, (-2, 1), (1, 1))

      line(
        name: "x-axis", stroke: (dash: "dashed"), (-0.2, -0.2), (rel: (0.8, 0)),
      )
      content((rel: (-0.2, 0), to: "x-axis.start"))[$ x = 0 $]

      coil(
        name: "spring", amplitude: 0.25, start: 5%, end: 95%, line((0.4, 1), (rel: (0, -1.4))),
      )
      content((rel: (0.3, 0), to: "spring.mid"))[$ k $]

      rect(
        name: "mass", fill: white, (rel: (-0.2, -0.01), to: "spring.end"), (rel: (0.4, -0.4)),
      )
      content("mass")[$ m $]

      line(
        name: "dx", (rel: (0.05, 0), to: "x-axis.end"), (rel: (0.1, 0)), (rel: (0, -0.4)), (rel: (-0.1, 0)),
      )
      content((rel: (0.12, 0), to: "dx.mid"))[$ Delta x $]

      rect(name: "sensor", (0.3, -1), (0.5, -1.2))
      arc(
        (rel: (-0.08, 0), to: "sensor.north"), start: 180deg, stop: 360deg, radius: 0.08,
      )
      content((rel: (-0.6, 0), to: "sensor.east"))[Motion Sensor]
      line(stroke: (dash: "dotted"), "sensor.north", "mass.south")
    },
  )
] <setup-2>

== Procedures
The following procedure was implemented during this experiment.
+ The spring system was setup in equilibrium using the spring of constant $k_1$ and
  mass $m_1$ (see @setup). <proc-1>
+ The mass was pulled down by #qty(7.5, "cm") ($Delta x$) to bring the system out
  of equilibrium (see @setup-2).
+ Data collection was initiated in Vernier Graphical Analysis#emoji.reg.
+ The mass was released and allowed to oscillate for the period of data
  collection. <proc-2>
+ Steps #link(label("proc-1"))[1] through #link(label("proc-2"))[4] were repeated
  two more times to collect three total trials of data. <proc-3>
+ Steps #link(label("proc-1"))[1] through #link(label("proc-3"))[5] were repeated
  two more times---once with the spring of constant $k_1$ and mass $m_1$, and once
  with the mass $m_2$ and spring of constant $k_1$.
+ Data from Vernier Graphical Analysis#emoji.reg was saved as a CSV file.
+ Regressions were fit to each set of trials matching the model for simple
  harmonic motion.

= Results
== Data
#let data = csv("assets/oscillation-modeling/data.csv").slice(1).map(r => r.map(float))
#let params = csv("assets/oscillation-modeling/parameters.csv").map(r => r.map(float))

#figure(
  caption: [Time vs. Position for Control Trials], cetz.canvas(
    {
      import cetz.draw: *
      import cetz.plot: *

      let ps = params.at(0)
      let data_offset = 1

      plot(
        size: (15, 10), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
          for i in range(0, 3) {
            add(
              style: (stroke: none), mark: "o", mark-size: .1, label: [Trial #(i + 1)], data.map(r => (r.at(i * 2), r.at(i * 2 + data_offset))),
            )
          }
          add(
            domain: (0, 5), samples: 250, x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
          )
        },
      )
    },
  ),
)

#figure(
  caption: [Time vs. Position for Further Initial Position Trials], cetz.canvas(
    {
      import cetz.draw: *
      import cetz.plot: *

      let ps = params.at(1)
      let data_offset = 7

      plot(
        size: (15, 10), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
          for i in range(0, 3) {
            add(
              style: (stroke: none), mark: "o", mark-size: .1, label: [Trial #(i + 1)], data.map(r => (r.at(i * 2), r.at(i * 2 + data_offset))),
            )
          }
          add(
            domain: (0, 5), samples: 250, x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
          )
        },
      )
    },
  ),
)

#figure(
  caption: [Time vs. Position for Heavier Mass Trials], cetz.canvas(
    {
      import cetz.draw: *
      import cetz.plot: *

      let ps = params.at(2)
      let data_offset = 13

      plot(
        size: (15, 10), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
          for i in range(0, 3) {
            add(
              style: (stroke: none), mark: "o", mark-size: .1, label: [Trial #(i + 1)], data.map(r => (r.at(i * 2), r.at(i * 2 + data_offset))),
            )
          }
          add(
            domain: (0, 5), samples: 250, x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
          )
        },
      )
    },
  ),
)

#figure(caption: [Time vs. Position for Stiffer Spring Trials], cetz.canvas(
    {
      import cetz.draw: *
      import cetz.plot: *

      let ps = params.at(3)
      let data_offset = 19

      plot(
        size: (15, 10), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
          for i in range(0, 3) {
            add(
              style: (stroke: none), mark: "o", mark-size: .1, label: [Trial #(i + 1)], data.map(r => (r.at(i * 2), r.at(i * 2 + data_offset))),
            )
          }
          add(
            domain: (0, 5), samples: 250, x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
          )
        },
      )
    },
  ))

== Calculations
#lorem(60)

= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)
