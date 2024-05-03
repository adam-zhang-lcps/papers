#import "@preview/cetz:0.2.2"
#import "@preview/unify:0.5.0": qty, unit
#import "./aet-lab-report-template.typ": aet-lab-report

#set table(
  fill: (x, y) => if calc.odd(y) and y > 0 { luma(240) } else { white }
)

#show: doc => aet-lab-report(
  title: "Investigating the Variables Affecting Simple Harmonic Motion", course: "AET AP Physics C: Mechanics", teacher: "Mr. Matthew Hilsdorf and Mr. Joseph Meyers", date: datetime(year: 2024, month: 05, day: 03), appendix: [
    Note that in the interest of printability, raw position data has been rounded to 14 digits after the decimal point.
    
    #import table: header, cell
    
    #let data = csv("assets/oscillation-modeling/data.csv").slice(1)
    #let captions = ([Control], [Further Initial Position], [Heavier Mass], [Stiffer Spring])
    
    #show figure: set block(breakable: true)

    #let aligning(x, y) = {
      if y > 1 {
        if calc.even(x) {
          left
        } else {
          right
        }
      } else {
        center
      }
    }

    #for i in range(0, 4) {
      let trials = data.map(
        r => {
          for c in range(0, 3) {
            import calc: round

            (
              r.at(i * 6 + c * 2),
              [#round(digits: 14, float(r.at(i * 6 + c * 2 + 1)))]
            )
          }
        },
      )

      [
        #figure(
          caption: [Raw Data from #captions.at(i) Trials],
          table(
            columns: (auto, auto, auto, auto, auto, auto),
            fill: (x, y) => if calc.even(y) and y > 1 { luma(240) } else { white },
            align: aligning,
            header(
              ..range(1, 4).map(i => cell(colspan: 2)[Trial #i]),
              ..([Time (s)], [Position (m)]) * 3,
            ),
            ..range(1, 3).map(i => table.vline(x: i * 2, stroke: 1pt)),
            ..range(1, 3).map(i => table.hline(y: i, stroke: 1pt)),
            ..trials.flatten(),
          ),
        )
        #label("raw-data-" + str(i))
      ]
    }
  ], doc,
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
- A computer capable of running Vernier Graphical Analysis#emoji.reg.
- A Vernier Motion Sensor#emoji.reg.

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
Graphs showing the three sets of data collected for each trial as well as a line of best fit were created. @control-graph shows the results from the control trials. @initial-position-graph shows the results from the trials with a further initial position graph. @heavier-mass-graph shows the results from the trials with a heavier mass hanging from the spring. @stiffer-spring-graph shows the results from the trials with a stiffer spring.

The full raw data is available in the appendix in @raw-data-0, @raw-data-1, @raw-data-2, and @raw-data-3.

#let data = csv("assets/oscillation-modeling/data.csv").slice(1).map(r => r.map(float))
#let params = csv("assets/oscillation-modeling/parameters.csv").map(r => r.map(float))
#let captions = ([Control], [Further Initial Position], [Heavier Mass], [Stiffer Spring])
#let labels = ("control", "initial-position", "heavier-mass", "stiffer-spring")

#for i in range(0, 4) [
  #figure(
    caption: [Time vs. Position for #captions.at(i) Trials], cetz.canvas(
      {
        import cetz.draw: *
        import cetz.plot: *

        let data_offset = i * 6

        plot(
          size: (15, 8), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
            for j in range(0, 3) {
              add(
                style: (stroke: none), mark: "o", mark-size: .1, label: [Trial #(j + 1)], data.map(r => (r.at(j * 2 + data_offset), r.at(j * 2 + data_offset + 1))),
              )

              let ps = params.at(j * 3 + i)
              add(
                domain: (0, 5), samples: 250, x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
              )
            }
          },
        )
      },
    ),
  )
  #label(labels.at(i) + "-graph")
]

== Calculations
The above figures included lines of best fit from a nonlinear regression calculated using the model of simple harmonic motion. The values for the parameters for each regression are shown in table @parameters.

#figure(
  caption: [Simple Harmonic Motion Regression Parameter Values],
  table(
    columns: 4,
    align: (x, y) => if y > 0 and x > 0 { left } else { center },
    table.header([], $A$, $omega$, $Phi$),
    // ..params.enumerate()
    //   .map(((i, r)) => (captions.at(i), ..r.map(str)))
    //   .flatten()
  )
) <parameters>

= Discussion
== Conclusion
#lorem(50)

== Errors
#lorem(50)
== Extensions
#lorem(50)
