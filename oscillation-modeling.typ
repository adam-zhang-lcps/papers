#import "@preview/cetz:0.2.2"
#import "@preview/unify:0.5.0": qty
#import "./aet-lab-report-template.typ": aet-lab-report

#set table(
  fill: (x, y) => if calc.odd(y) and y > 0 { luma(240) } else { white }
)

#show: doc => aet-lab-report(
  title: "Investigating the Variables Affecting Simple Harmonic Motion",
  course: "AET AP Physics C: Mechanics",
  teacher: "Mr. Matthew Hilsdorf and Mr. Joseph Meyers",
  date: datetime(year: 2024, month: 05, day: 03),
  appendix: [
    Note that in the interest of printability, raw position data has been rounded to 14 digits after the decimal point.
    
    #import table: header, cell
    
    #let data = csv("assets/oscillation-modeling/data.csv").slice(1)
    #let captions = ([control], [further initial position], [heavier mass], [stiffer spring])
    
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
          caption: [Raw data from #captions.at(i) trials],
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
      caption: [GNU Octave script used for nonlinear regression],
      raw(
        lang: "octave",
        block: true,
        read("assets/oscillation-modeling/regressions.m")
      )
    ) <octave-regression-script>
  ],
  doc,
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
#set math.equation(numbering: "(1)")

Simple harmonic motion refers to an oscillatory motion in which the force returning the system to equilibrium---the "restoring" force---is directly proportional to the displacement of the system from said equilibrium. In this case, by Newton's 2nd Law of motion, the acceleration is directly proportional to the displacement from equilibrium @MoebsEtAl2016UniversityPhysics.

A quintessential example of simple harmonic motion, and the one investigated in this experiment, is the oscillation of an ideal spring with a weight attached. At displacements small relative to the length of the spring, ideal springs obey Hooke's Law (@hookes-law), which states that the restoring force exerted by a spring is directly proportional to the spring's displacement from equilibrium @Dourmashkin2016HookesLaw.

$ F_s = -k x $ <hookes-law>

By using Newton's 2nd Law, @hookes-law can be used to derive the second-order differential equation shown in @acceleration-difeq. Solving this differential equation yields the model for position as a function of time presented in @basic-shm-model.

$ (dif^2 x)/(dif t^2) = -k/m x $ <acceleration-difeq>
$ x = A cos(omega t + Phi) $ <basic-shm-model>

As shown by @basic-shm-model, simple harmonic motion is modeled by a sinusoidal wave, where $A$ represents the amplitude of the oscillation, $omega$ represents the angular frequency, and $Phi$ represents the phase shift of the wave. As $A$ represents the amplitude of the oscillation, it represents the maximum distance away from equilibrium that the mass reaches (as $forall x in RR : cos(x) gt.not 1$), and depends solely upon the initial conditions (position and velocity). The angular frequency $omega$ is dependent upon the mass of the oscillating object and the stiffness of the spring, and is equal to $sqrt(k/m)$  @Meyers2024OscillatorKinematics. Finally, phase shift changes only the point at which the wave starts, and is also dependent solely upon initial conditions. Notably, a system with initial velocity is functionally equivalent to a system with no initial velocity and a further starting distance $x_1$, and results only in a phase shift @MoebsEtAl2016UniversityPhysics.

This experiment seeks to experimentally verify the theoretical models discussed above. To do so, a mass will be suspended from a vertical spring and allowed to oscillate from a starting position $x_0$. Motion will be recorded using a Vernier Motion Sensor#emoji.reg. Two differing masses, starting positions, and springs will be tested, each in isolation, to determine how each change affects the resulting simple harmonic motion model.

= Methods
== Materials
The following materials are required for this experiment.
- Two springs of different stiffness $k_1$ and $k_2$.
- A bar to hang a spring from.
- Two differing masses $m_1$ and $m_2$.
- A computer capable of running Vernier Graphical Analysis#emoji.reg.
- A Vernier Motion Sensor#emoji.reg.

The setup for this experiment is shown in @setup and @setup-2.

#figure(
  caption: [Setup of spring system in equilibrium],
)[
  #set math.equation(numbering: none)
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
  #set math.equation(numbering: none)
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
+ The mass was pulled down by #qty(5.0, "cm") ($Delta x$) to bring the system out
  of equilibrium (see @setup-2).
+ Data collection was initiated in Vernier Graphical Analysis#emoji.reg.
+ The mass was released and allowed to oscillate for the period of data
  collection. <proc-2>
+ Steps #link(label("proc-1"))[1] through #link(label("proc-2"))[4] were repeated two more times to collect three total trials of data. <proc-3>
+ Steps #link(label("proc-1"))[1] through #link(label("proc-3"))[5] were repeated three more times---once with the mass pulled down #qty(7.5, "cm"), once with the spring of constant $k_1$ and mass $m_1$, and once with the mass $m_2$ and spring of constant $k_1$.
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
    caption: [Time vs. Position for #lower(captions.at(i)) trials],
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
  caption: [Simple harmonic motion regression parameter values],
  table(
    columns: 5,
    align: (x, y) => if y > 0 and x > 1 { right } else { center },
    table.header([], [], $A$, $omega$, $Phi$),
    ..range(0, 4).map(i => {
      import calc: round
      
      (
        table.cell(rowspan: 4, align: horizon, captions.at(i)),
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
  caption: [Models using average parameters],
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
There were many sources of error present within this experiment that resulted in data not fully consistent with theoretical models.

As mentioned previously, the largest inconsistency throughout the collected data is the calculated phase shift $Phi$. This is largely attributable to inconsistencies in the starting condition of the spring system. Considering the model for simple harmonic motion (@basic-shm-model), the phase shift affects only where the sinusoidal wave begins. Thus, it is dependent only upon the starting position and velocity of the spring @MoebsEtAl2016UniversityPhysics. While every effort was made to keep the starting position at exactly #qty(5.0, "cm") or #qty(7.5, "cm") and starting velocity at exactly zero, due to the procedure being executed by humans, natural human error was present. This error is especially prevalent in @initial-position-graph and @stiffer-spring-graph. Further experimentation should attempt to minimize this error through a precise manner of controlling starting conditions.

Another source of experimental error is the failure to account for dampened motion. Simple harmonic motion accurately models an ideal system, where energy is fully conserved. Unfortunately, the real world is not an ideal system, and is subject to external factors---most notably friction and air resistance. Since the experiment was performed with a spring suspended vertically, friction is not a major concern---however, air resistance was undoubtedly present. This results in _damped_ harmonic motion. Since air resistance is dependent upon the current velocity of the object, @acceleration-difeq becomes @acceleration-damped-difq. Solving this equation yields @damped-shm-model @MoebsEtAl2016UniversityPhysics @Kreyszig1972EngineeringMathematics @Meyers2024DampedAndOtherOscillations.

$ (dif^2 x)/(dif t^2) = -k/m x - mu (dif x)/(dif t) $ <acceleration-damped-difq>
$ x = A_0 e^(-b/(2m) t) cos(omega t + Phi) $ <damped-shm-model>

As shown by @damped-shm-model, damped harmonic motion includes an exponential decay term, the speed of which is determined by the value $b$. This value represents properties of the system such as the fluid viscosity @Meyers2024DampedAndOtherOscillations. This decaying amplitude is visible in the graphs of the data collected, most visibly in @heavier-mass-graph.

Finally, an error in the design of this experiment restricted the ability to draw full conclusions. Data regarding how a change in the spring system affected the resultant model was only collected in one direction; e.g. a control mass $m_1$ and a heavier mass $m_2$ were tested, but not a lighter mass $m_3$. Additionally, the exact numerical values of the spring constants for the springs used, $k_1$ and $k_2$, were not recorded due to a lack of foresight. This restricts the conclusions that can be gathered, as a full theoretical model cannot be made.

== Extensions
Extensions to this experiment should primarily aim to fix the shortcoming discussed in the #link(label("errors"), "errors"). A more controlled environment can be used to ensure that the starting conditions of each trial are consistent so that the difference in phase shift can be accurately calculated---one way this could be accomplished is by using a reproducible mechanism to release the spring. Additionally, more trials should be performed with a larger number of variations of the characteristics of the spring system so the mathematical model for simple harmonic motion can be validated from experimental data. Finally, future experimenters may consider performing the experiment in a vacuum to reduce the effects of air resistance.

Alternatively, other facets of harmonic motion can be tested, such as dampening. While air resistance is one form of damped harmonic motion, there are many other systems that experience damping, such as a spring moving through a viscous fluid, friction within vibrating solids such as a tuning fork, and the suspension system of a car. Further experimentation could extend to include data to determine the factors that affect the model of damped harmonic motion.

== Applications
Harmonic motion is present in many places. Springs are a common example, such as the springs in a car's suspension system. Another common example is pendulums, such as the pendulum in a grandfather clock. 


