#set document(
  title: "Civil War Sectionalism PBA",
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(paper: "us-letter")
#set text(font: "New Computer Modern", size: 11pt)
#set par(first-line-indent: 0.25in)
#show par: set block(spacing: 0.65em)

One economic cause of sectionalism during the antebellum period was the differing economy between the North and the South. The North focused primarily on manufacturing and industry, while the South instead emphasized old-school agriculture. An exa mple of sectionalism fueled by this divide was the publication of Hilton Helper's book _The Impending Crisis of the South_. Helper argued against the institution of slavery in the South as a cause of economic stagnation, limiting their ability to grow @Helper1857ImpendingCrisis. This book was highly controversial after it was published, as it was a Southerner (Helper) arguing for abolition, rather than against it, while attempting to appeal to the South's rationals.

One political cause of sectionalism during the antebellum period was the 1857 _Dred Scott v. Sandford_ Supreme Court decision. This decision was in response to a lawsuit from a slave arguing they should be freed as they lived in a free state. The court instead asserted that slaves were not citizens, and thus unable to sue; additionally, as they were property, they were protected under the Constitution, and thus the notion of "free states" versus "slave states" is unconstitutional, as the government cannot take away citizen's property (without just compensation) @DredScott1857.

One societal cause of sectionalism during the antebellum period was the issue of slavery and abolition. This is exemplified by Harriet Beecher Stove's _Uncle Tom's Cabin_, in which Stove portrays the horrors of slave life @Stowe1852UncleTomsCabin. This heavily fueled the abolitionist movement and further divided the nation over slavery.

#show bibliography: it => {
  show heading: it => {
    set align(center)
    set text(weight: "regular", size: 11pt)
    it
  }
  set par(first-line-indent: 0in, hanging-indent: 0.5in)

  pagebreak()
  it
}
#bibliography("refs.bib", title: [Works Cited], style: "mla")
