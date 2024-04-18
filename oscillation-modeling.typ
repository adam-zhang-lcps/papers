#import "@preview/cetz:0.2.2"
#import "./aet-lab-report-template.typ": aet-lab-report
#show: doc => aet-lab-report(
  title: "Investigating the Variables Affecting Simple Harmonic Motion", course: "AET AP Physics C: Mechanics", teacher: "Mr. Matthew Hilsdorf and Mr. Joseph Meyers", date: datetime(year: 2024, month: 04, day: 19), draft: true, doc,
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

The setup for this experiment is shown in @setup.

#figure()[
  #cetz.canvas(
    length: 20%, {
      import cetz.draw: *
      import cetz.decorations: *
        
      line(stroke: 2pt, (-2, 1), (1, 1))
      grid(step: 0.1,
        help-lines: true,
        (-1, -1), (1, 1))
      
      coil(
        name: "spring", amplitude: 0.25, start: 5%, end: 95%,
        line((0.6, 1), (rel: (0, -1))),
      )
      content((rel: (0.3, 0), to: "spring.mid"))[$ k $]
      
      rect(name: "mass",
        (rel: (-0.2, -0.01), to: "spring.end"),
        (rel: (0.4, -0.4)))
      content("mass")[$ m $]

      line(name: "x-axis", stroke: (dash: "dashed"), (rel: (-1.4, 0), to: "mass.west"), (rel: (0.2, 0), to: "mass.east"))
      content((rel: (-0.2, 0), to: "x-axis.start"))[$ x = 0 $]
    },
  )
] <setup>

// #figure(image("assets/dragon.jpg"), caption: "Experimental Setup")<setup>

== Procedures
The following procedure was implemented during this experiment.
+ #lorem(10)
+ #lorem(10)
+ #lorem(10)
+ #lorem(10)

= Results
== Data
#lorem(60)
== Calculations
#lorem(60)

= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)
