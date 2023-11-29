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
#show figure.caption: it => [
  #set align(left)
  #set par(first-line-indent: 0in)
  *#it.supplement #it.numbering*

  #emph(it.body)
]

#block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #block(below: 4em)[*Descriptive Title*]

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
Determine the model of drag that most accurately represents the motion of a coffee filter falling from rest. Determine the effect of mass on terminal velocity.
== Hypothesis
The model of drag that will most accurately represent the motion of the coffee filter is laminar flow, or $F_"drag" = -b v$. Laminar flow more closely models objects moving at relatively slow velocities, such as the coffee filter.

Assuming a laminar flow ($n = 1$ in $-b v^n$; see #link(label("background"), "Background")), mass will have a directly proportional relationship with terminal velocity. The derivation for this conclusion is as follows: beginning with Newton's 2nd Law, the coffee filter experiences a downward force of gravity, and a drag force in the opposite direction.
$ a = (m g - b v^n)/m $
Since terminal velocity is reached when acceleration is equal to zero, the equation can be solved for velocity as follows.
$ 0 = (m g - b v^n)/m $
$ 0 = m g - b v^n $
$ m g = b v^n $
$ v^n = (m g)/b $
Again, assuming a laminar flow, $n = 1$, resulting in velocity being directly proportional to mass.
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

#figure(image("assets/dragon.jpg"), caption: "Experimental Setup")<setup>
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

#pagebreak()
#set par(first-line-indent: 0in)
#bibliography("refs.bib", title: "References", style: "apa")
