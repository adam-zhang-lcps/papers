#set page(
  paper: "us-letter",
  margin: 1in,
  header: context if counter(page).get().first() > 1 {
    // HACK: There's probably a better way to do this…
    align(right, str(counter(page).get().first() - 1))
  },
)
#set text(font: "Liberation Serif", size: 12pt)
#set par(leading: 1.3em)

#set page(numbering: none)
#v(30%)
#align(center)[BRIDGE TO GOVERNMENT]
#v(20%)
#align(center)[
  Adam Zhang

  AP US History

  #datetime.today().display("[month repr:long] [day], [year]")
]
#pagebreak()

