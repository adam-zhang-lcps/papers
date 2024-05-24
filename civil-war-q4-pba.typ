#set document(
  title: "Civil War Sectionalism PBA",
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(paper: "us-letter")
#set text(font: "New Computer Modern")
#set par(first-line-indent: 0.25in)
#show par: set block(spacing: 0.65em)

One economic cause of sectionalism during the antebellum period was the differing economy between the North and the South. The North focused primarily on manufacturing and industry, while the South instead emphasized old-school agriculture. An example of sectionalism fueled by this divide was the publication of Hilton Helper's book _The Impending Crisis of the South_. Helper argued against the institution of slavery in the South as a cause of economic stagnation, limiting their ability to grow. This book was highly controversial after it was published, as it was a Southerner (Helper) arguing for abolition, rather than against it, while attempting to appeal to the South's rationals.

#show bibliography: it => {
  show heading: set align(center)

  pagebreak()
  it
}
#bibliography("refs.bib", title: [Works Cited], style: "mla")
