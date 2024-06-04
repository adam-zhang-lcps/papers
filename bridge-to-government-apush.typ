#set page(
  paper: "us-letter",
  margin: 1in,
  header: context if counter(page).get().first() > 1 {
    // HACK: There's probably a better way to do this…
    align(right, str(counter(page).get().first() - 1))
  },
)
#set text(font: "Liberation Serif", size: 12pt)
#set par(leading: 1.3em, first-line-indent: 0.5in)

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

Although it existed in earlier forms, the NSA in its modern form was formed in 1952 following a directive from President Truman @Britannica2024NationalSecurityAgency. The goal of the various incarnations of the agency before its formal inception was to break the encryption of communications, especially during wartime, to support national intelligence.

#set bibliography(style: "chicago-fullnotes")
#show bibliography: it => {
  show heading: it => {
    set align(center) 
    set text(weight: "regular", size: 12pt)
    it
    v(2em)
  }

  pagebreak()
  it
}
#bibliography("refs.bib")
