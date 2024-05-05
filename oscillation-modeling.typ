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
              r.at(0),
              [#round(digits: 14, float(r.at(i * 3 + c + 1)))]
            )
          }
        },
      )

      [
        #figure(
          caption: [Raw Data from #captions.at(i) Trials],
          table(
            columns: 6,
            fill: (x, y) => if calc.even(y) and y > 1 { luma(240) } else { white },
            align: aligning,
            header(
              ..range(1, 4).map(i => cell(colspan: 2)[Trial #i]),
              ..([Time (s)], [Position (m)]) * 3,
            ),
            ..trials.flatten(),
          ),
        )
        #label("raw-data-" + str(i))
      ]
    }

    #figure(
      caption: [GNU Octave Script Used for Nonlinear Regression],
      raw(
        lang: "octave",
        block: true,
        read("assets/oscillation-modeling/regressions.m")
      )
    ) <octave-regression-script>
  ], doc,
)

= Introduction
== Purpose
Investigate what and how factors of a vibrating spring system affect the respective parameters of a simple harmonic motion model.

== Hypothesis <hypothesis>
Starting displacement ($x_0$) and starting velocity ($v_0$) are correlated with
the amplitude ($A$) and phase shift ($Phi$) of the model. Mass ($m$) is
inversely proportional to period ($omega$). Spring stiffness ($k$) is
proportional to period ($omega$).

== Background <background>
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
Graphs showing the three sets of data collected for each trial as well as a line of best fit for each trial were created. @control-graph shows the results from the control trials. @initial-position-graph shows the results from the trials with a further initial position graph. @heavier-mass-graph shows the results from the trials with a heavier mass hanging from the spring. @stiffer-spring-graph shows the results from the trials with a stiffer spring.

The full raw data is available in the appendix in @raw-data-0, @raw-data-1, @raw-data-2, and @raw-data-3.

#let data = csv("assets/oscillation-modeling/data.csv").slice(1).map(r => r.map(float))
#let params = csv("assets/oscillation-modeling/parameters.csv").map(r => r.map(float))
#let captions = ([Control], [Further Initial Position], [Heavier Mass], [Stiffer Spring])
#let labels = ("control", "initial-position", "heavier-mass", "stiffer-spring")

#for i in range(0, 4) [
  #figure(
    caption: [Time vs. Position for #captions.at(i) Trials],
    cetz.canvas({
      import cetz.draw: *
      import cetz.plot: *

      let data_offset = i * 3 + 1
      let colors = (green, blue, red)

      plot(
        size: (15, 8), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
          for j in range(0, 3) {
            add(
              style: (stroke: none),
              mark: "o",
              mark-size: .15,
              mark-style: (stroke: none, fill: colors.at(j)),
              label: [Trial #(j + 1)],
              data.map(r => (r.at(0), r.at(data_offset + j))),
            )

            let ps = params.at(i * 3 + j)
            add(
              domain: (0, 5),
              samples: 250,
              style: (stroke: (paint: colors.at(j), dash: "dashed")),
              x => ps.at(0) * calc.cos(ps.at(1) * x + ps.at(2)),
            )
          }
        },
      )
    }),
  )
  #label(labels.at(i) + "-graph")
]

== Calculations
#let averages = range(0, 4).map(i => {
  import calc: round
  
  params.slice(i * 3, count: 3)
    .fold((0, 0, 0), (acc, cur) => {
      acc.zip(cur).map(((a, b)) => a + b)
    })
    .map(x => x / 3)
    .map(x => round(digits: 14, x))
})

The above figures included lines of best fit from a nonlinear regression calculated using the model of simple harmonic motion. The values for the parameters for each regression, as well as the averages per each set of trials, are shown in @parameters. A graph showing the model for each set of trials using the average parameters is shown in @average-parameters-graph.

Regressions were calculated using a GNU Octave#footnote([https://octave.org]) script as well as the `optim` package#footnote([https://octave.sourceforge.io/optim]). The full script is available in the appendix in @octave-regression-script.

#figure(
  caption: [Simple Harmonic Motion Regression Parameter Values],
  table(
    columns: 5,
    align: (x, y) => if y > 0 and x > 1 { right } else { center },
    table.header([], [], $A$, $omega$, $Phi$),
    ..range(0, 4).map(i => {
      import calc: round
      
      (
        table.cell(rowspan: 4, inset: (top: 20pt), captions.at(i)),
        ..range(0, 3).map(j => {
          (
            [Trial #(j + 1)],
            ..params.at(i * 3 + j)
              .map(f => round(digits: 14, f))
              .map(str)
          )
        }),
        [Average],
        ..averages.at(i).map(str)
      )
    }).flatten()
  )
) <parameters>

#figure(
  caption: [Models Using Average Parameters],
  cetz.canvas({
    import cetz.plot: *

    plot(
      size: (15, 8), axis-style: "scientific-auto", legend: "legend.north", legend-style: (orientation: ltr, stroke: none), x-label: [Time (s)], y-label: [Position (m)], x-grid: "both", y-grid: "both", {
        import calc: cos
        
        for i in range(0, 4) {
          let ps = averages.at(i)
          add(
            domain: (0, 5),
            samples: 250,
            label: captions.at(i),
            x => ps.at(0) * cos(ps.at(1) * x + ps.at(2)))
        }
      }
    )
  })
) <average-parameters-graph>

= Discussion
== Conclusion
The purpose of the experiment was partially accomplished. While it was successfully determined which parameters of a simple harmonic motion model are affected by corresponding factors in a simple spring system, the exact relationship between values was not successfully proven.

By looking at the results of varying factors in @parameters and @average-parameters-graph in comparison to the control trial, relationships can be inferred. A further initial position increased the amplitude ($A$) by a significant amount. A heavier mass and stiffer spring decreased and increased the frequency of oscillation ($omega$), respectively, by a significant amount. This lines up with the predictions in #link(label("hypothesis"), [the hypothesis]) and principles discussed in #link(label("background"), [the background]).

Notably, calculated values for phase shift ($Phi$) were not consistent throughout trials. However, this can be attributed to multiple factors. The phase shift is only affected by the initial conditions of the system---the initial position and velocity. Due to inconsistencies in both the initialization of data collection and human error in holding the spring at a perfectly consistent length, these initial conditions were not constant throughout trials. Additionally, due to phase shift being a value with infinite possible values (since the model of simple harmonic motion repeats with its period), nonlinear regressions struggle to converge to a consistent value. See #link(label("background"), [the background]) and #link(label("errors"), [the errors]) sections for more details.

== Errors <errors>
#lorem(50)

== Extensions
#lorem(50)

== Applications
#lorem(50)
