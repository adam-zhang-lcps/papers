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

    First Last

    Academies of Loudoun

    Course Name

    Professor Name

    Date
  ]
]

#outline(indent: 0.25in)
#pagebreak()

= Introduction
== Purpose
#lorem(20)
== Hypothesis
#lorem(20)
== Background
#lorem(100)

#lorem(100)


#lorem(100)

#lorem(100)

= Methods
== Materials
The following materials are required for this experiment.
- #lorem(4)
- #lorem(4)
- #lorem(4)
- #lorem(4)

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
