#let aet-lab-report(
  title: none,
  course: none,
  teacher: none,
  partners: none,
  date: datetime.today(),
  appendix: none,
  draft: false,
  doc,
) = [
  #set document(title: title, author: "Adam Zhang", date: date)
  
  #set page(paper: "us-letter", margin: 1in, header: align(right)[
    #counter(page).display()
  ], background: if draft {
    rotate(45deg, text(144pt, fill: luma(230), tracking: 12pt, "DRAFT"))
  })
  
  #set par(leading: 1.5em, first-line-indent: 0.5in)
  #set text(font: "New Computer Modern", size: 11pt)
  #set outline(indent: 0.25in)
  
  #show heading.where(level: 1): it => [
    #set text(size: 11pt, weight: "bold")
    #set align(center)
    #block(it.body, spacing: 1.5em)
  ]
  #show heading.where(level: 2): it => [
    #set text(size: 11pt, weight: "bold")
    #block(it.body, spacing: 1.5em)
  ]
  #show heading.where(level: 3): it => [
    #set text(size: 11pt, weight: "bold", style: "italic")
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

  #set table(
    fill: (x, y) => if calc.odd(y) and y > 0 { luma(240) } else { white },
    align: center + horizon
  )

  #set math.equation(numbering: "(1)")
  // Without this, equations in CeTZ diagrams have labels all over them.
  #show figure: set math.equation(numbering: none)
  
  #set bibliography(style: "apa", title: "References")
  #show bibliography: it => [
    #set par(first-line-indent: 0in)
    #pagebreak()
    #it
  ]

  #block(
    width: 100%,
    height: 100%,
  )[
    #align(
      center + horizon,
    )[
      #block(below: 4em)[*#title*]

      Adam Zhang

      #if (partners != none) [
        Lab Partner#if partners.len() > 1 [s]: #partners.join(", ")
      ]
      
      Academy of Engineering and Technology,
      #box(image("assets/acl-logo.png", height: 0.9em)) Academies of Loudoun

      #course

      #teacher

      #date.display("[month repr:long] [day], [year]")

      On my honor, I will not accept nor provide any unauthorized aid on this
      assignment.
    ]
  ]

  #outline()
  #pagebreak()

  #doc

  #bibliography("refs.bib")

  #if appendix != none [
    #pagebreak()
    = Appendix
    #appendix
  ]
]

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
