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
#align(center)[NATIONAL SECURITY AGENCY (BRIDGE TO GOVERNMENT)]
#v(20%)
#align(center)[
  Adam Zhang

  AP US History

  #datetime(year: 2024, month: 06, day: 04).display("[month repr:long] [day], [year]")
]
#pagebreak()

Although it existed in earlier forms, the NSA in its modern form was formed in 1952 following a directive from President Truman. The goal of the various incarnations of the agency before its formal inception was to obtain information on foreign communication, especially during wartime, to support national intelligence. This primarily took the form of various types of crypt-analysis and code-breaking, especially during both World Wars. Following both global wars and the NSA's formal establishment, the mission of the NSA turned to providing global "signals intelligence" @Britannica2024NationalSecurityAgency, the interception of signals in communication, to support national security @NSASignalsIntelligenceOverview.

The NSA is currently among one of the largest and most-funded defense agencies. While exact funding is unknown, as the NSA falls under the "black budget" of the Department of Defense, estimates resulting from the Snowden leak in 2013 place the budget at the time around \$7 billion @GellmanMiller2023BlackBudget. The number of employees is also not publicly disclosed, but is estimated to be around 30--40 thousand. The modern-day responsibilities of the NSA mirror its original responsibilities, though its horizons have expanded; it is now responsible for global monitoring and aggregation of data for national intelligence, as well as protecting US information systems @NSAAbout.

Information provided by the NSA is extremely valuable in protecting US national security, and the NSA fills a unique role in digital signals intelligence (compared to other organizations such as the CIA). NSA services help in combating terrorism and other violent crime, especially after the advent of the September 11 attacks. However, the NSA has also come under repeated scrutiny for extending its powers beyond reason and invading personal privacy. The most notable case was the leaks by Edward Snowden, a former contractor, in 2013, which revealed the existence of many secret mass surveillance programs in use by the NSA that collected large amounts of personal data on American citizens @Britannica2024EdwardShowden. This has raised heated debate on where the balance between national intelligence and individual privacy lies.

An article from _The New York Times_ provides a recent example of this debate, detailing how the NSA purchases information from "data brokers". Commercial data brokers collect information about citizens from multiple sources---such as ISPs and online platforms---and then sell that data to other entities. By purchasing data from these brokers, the NSA can skirt the requirement of a search warrant to collect information about a single person. While the article details how the NSA emphasizes that it attempts to minimize the data collected on American individuals, it also provides the viewpoints of those who oppose surveillance of this nature, who argue that it should be illegal for the government to purchase data that would need a search warrant to obtain in other ways @Savage2024NSAInternetData.

#set bibliography(style: "chicago-fullnotes")
#show bibliography: it => {
  show heading: it => {
    set align(center) 
    set text(weight: "regular", size: 12pt)
    it
    v(2em)
  }
  set par(first-line-indent: 0in)

  pagebreak()
  it
}
#bibliography("refs.bib")
