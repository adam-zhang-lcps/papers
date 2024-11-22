#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart
#import "aet-lab-report-template.typ": aet-lab-report

#show "Ecoli": [_E. coli_]
#show "Coagulans": [_B. coagulans_]
#show "Halo": [_Halobacterium sp._ NRC-1]

#show: doc => aet-lab-report(
  // TODO Technically Halo isn't a bacterium, does it matter?
  title: [Evaluating and Comparing Radiation Resistance of Model Bacteriums],
  partners: ([Cole Strickland], [Eva Ulreich], [Luz Lazo]),
  course: "AET AP Biology",
  date: datetime(year: 2024, month: 11, day: 22),
  draft: true,
  doc,
)

#let CN = super[[citation needed]]

= Introduction
== Purpose
Evaluate and compare the radiation resistance of Ecoli, Coagulans, and Halo.

== Hypothesis
Since Halo has shown exceptional radiation resistance in previous research#CN, it should show greater radiation resistance compared to both Ecoli and Coagulans, model organisms with no significant demonstrated radiation resistance.

== Background
#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

= Experimental Method
#lorem(100)

= Results
== Data
#let process_data(data) = {
  let data_parsed = ()

  for row in data {
    let row_parsed = (:)
    for (key, value) in row {
      row_parsed.insert(key, float(value))
    }
    data_parsed.push(row_parsed)
  }

  // Remove wavelengths with garbage data.
  data_parsed.filter(r => r.at("WL(nm)") >= 390)
}

#let coag_control = process_data(
  csv(
    "assets/high-balloon-bacteria/coag-control.csv",
    row-type: dictionary,
  ),
)
#let coag_group1 = process_data(
  csv(
    "assets/high-balloon-bacteria/coag-group1.csv",
    row-type: dictionary,
  ),
)
#let coag_group2 = process_data(
  csv(
    "assets/high-balloon-bacteria/coag-group2.csv",
    row-type: dictionary,
  ),
)
#let ecoli_group1 = process_data(
  csv(
    "assets/high-balloon-bacteria/ecoli-group1.csv",
    row-type: dictionary,
  ),
)
#let ecoli_group2 = process_data(
  csv(
    "assets/high-balloon-bacteria/ecoli-group2.csv",
    row-type: dictionary,
  ),
)
#let halo_control = process_data(
  csv(
    "assets/high-balloon-bacteria/halo-control.csv",
    row-type: dictionary,
  ),
)
#let halo_group1 = process_data(
  csv(
    "assets/high-balloon-bacteria/halo-group1.csv",
    row-type: dictionary,
  ),
)
#let halo_group2 = process_data(
  csv(
    "assets/high-balloon-bacteria/halo-group2.csv",
    row-type: dictionary,
  ),
)

// Iterate over datasets backwards so I can simply accounting for the missing control data for E. coli
#for (species, data) in (
  (species: [Ecoli], data: (ecoli_group2, ecoli_group1)),
  (species: [Coagulans], data: (coag_group2, coag_group1, coag_control)),
  (species: [Halo], data: (halo_group2, halo_group1, halo_control)),
) {
  figure(
    caption: [Absorbance Levels for #species],
    cetz.canvas({
      plot.plot(
        size: (15, 8),
        axis-style: "scientific-auto",
        legend: "north",
        legend-style: (
          orientation: ltr,
          stroke: none,
          item: (spacing: 0.25, preview: (width: 0.5)),
        ),
        x-label: [Wavelength (nm)],
        x-grid: true,
        y-label: [Absorbance],
        y-grid: true,
        {
          for (row, label) in data
            .zip((
                [Trial Group 2],
                [Trial Group 1],
                [Control],
              ))
            .rev() {
            plot.add(
              label: label,
              row.map(r => (r.at("WL(nm)"), r.at("Abs."))),
            )
          }
        },
      )
    }),
  )
}

== Calculations
#lorem(60)

= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)


