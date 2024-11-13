#let mla(title: none, professor: none, class: none, date: none, doc) = [
  #set page(
    paper: "us-letter",
    margin: 1in,
    header: align(right)[Zhang #context counter(page).display()],
  )
  #set text(12pt, font: "Liberation Serif")
  #set par(spacing: 1.8em)
  #show heading: it => [
    #set text(12pt, weight: "regular")
    #block(spacing: 2em)[
      #upper(it.body)
    ]
  ]

  #set par(first-line-indent: 0in)
  Adam Zhang

  #professor

  #class

  #if date != none [#date] else [#datetime.today().display()]

  #set par(leading: 1.5em, first-line-indent: 0.5in)
  #align(center)[
    #title
  ]

  #doc

  #pagebreak(weak: true)
  #set bibliography(style: "mla", title: none)
  #show bibliography: it => [
    #align(center)[Works Cited]
    #it
  ]
  #bibliography("refs.bib")
]

While researching texts written about nineteenth century farming, I found a few
authors who published books about the literature of nineteenth century farming,
particularly agricultural journals, newspapers, pamphlets, and brochures. These
authors often placed the farming literature they were studying into an
historical context by discussing the important events in agriculture of the year
in which the literature was published (see Demaree, for example). However, while
these authors discuss journals, newspapers, pamphlets, and brochures, I could
not find much discussion about another important source of farming knowledge:
farming handbooks. My goal in this paper is to bring this source into the
agricultural literature discussion by connecting three agricultural handbooks
from the nineteenth century with nineteenth century agricultural history.

To achieve this goal, I have organized my paper into four main sections, two of
which have sub-sections. In the first section, I provide an account of three
important events in nineteenth century agricultural history: population and
technological changes, the distribution of scientific new knowledge, and
farming’s influence on education. In the second section, I discuss three
nineteenth century farming handbooks in connection with the important events
described in the first section. Special attention is paid to the role that these
handbooks played in the dissemination of agricultural knowledge (and the
creation of genuinely new knowledge). I end
