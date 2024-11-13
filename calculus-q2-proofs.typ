#import "@preview/equate:0.2.1": equate

#set document(
  title: [Quarter 2 Proofs],
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(
  paper: "us-letter",
  margin: 1in,
  header: [
    #grid(
      columns: (1fr, 1fr),
      align(left + top)[
        #set block(spacing: 0.6em)

        AET Multivariable Calculus

        *Quarter 1 Proofs*
      ],
      align(right + top)[Adam Zhang],
    )
  ],
)
#set text(font: "New Computer Modern")
#set enum(numbering: "1.a.")
#set math.equation(numbering: "(1.a)")
// Allows numbering only referenced equations.
#show: equate.with(sub-numbering: true, number-mode: "label")

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]
