#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot
#import "aet-lab-report-template.typ": aet-lab-report

#show "Ecoli": [_E. coli_]
#show "Coagulans": [_B. coagulans_]
#show "Halo": [_Halobacterium sp._ NRC-1]

#let process_data(data) = {
  let data_parsed = ()

  for row in data {
    let row_parsed = (:)
    for (key, value) in row {
      row_parsed.insert(key, float(value))
    }
    data_parsed.push((row_parsed.at("WL(nm)"), row_parsed.at("Abs.")))
  }

  // Remove wavelengths with garbage data.
  data_parsed.filter(r => r.first() >= 390)
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

#show: doc => aet-lab-report(
  // TODO Technically Halo isn't a bacterium, does it matter?
  title: [Evaluating and Comparing Radiation Resistance of Model Bacteriums],
  partners: ([Cole Strickland], [Eva Ulreich], [Luz Lazo]),
  course: "AET AP Biology",
  date: datetime(year: 2024, month: 11, day: 22),
  draft: true,
  appendix: [
    // Allow tables to span pages.
    #show figure: set block(breakable: true)
    #set table.cell(inset: 0.14cm)

    #for (label, name, data) in (
      (label: <ecoli-data>, name: [Ecoli], data: (ecoli_group1, ecoli_group2)),
      (label: <coag-data>, name: [Coagulans], data: (coag_control, coag_group1, coag_group2)),
      (label: <halo-data>, name: [Halo], data: (halo_control, halo_group1, halo_group1)),
    ) [
      #figure(
        caption: [Spectrophotometer Absorbance Readings for #name],
        table(
          columns: data.len() * 2,
          // Yes, this is horrendous, but it works, so whatever ¯\_(ツ)_/¯; stupid lost E.coli trial.
          ..(
            table.cell(colspan: 2)[Control],
            table.cell(colspan: 2)[Trial Group 1],
            table.cell(colspan: 2)[Trial Group 2],
          ).rev().slice(0, data.len()).rev(),
          ..([Wavelength (nm)], [Absorbance]) * data.len(),
          ..data.reduce((acc, cur) => acc.zip(cur)).flatten().map(str)
        ),
      ) #label
    ]
  ],
  doc,
)

#let CN = super[[citation needed]]

= Introduction
== Purpose
Evaluate and compare the radiation resistance of Ecoli, Coagulans, and Halo.

== Hypothesis
Since Halo has shown exceptional radiation resistance in previous research#CN, it will show greater radiation resistance compared to both Ecoli and Coagulans, model organisms with no significant demonstrated radiation resistance.

== Background
#lorem(100)

#lorem(100)

#lorem(100)

#lorem(100)

= Experimental Method
#lorem(100)

= Results
== Data
Graphs of the absorbance values per wavelength for each bacterium's control and experimental groups are shown in @ecoli-graph, @coag-graph, and @halo-graph. Raw absorbance readings from the spectrophotometer are shown in the appendix in @ecoli-data, @coag-data, and @halo-data.

Unfortunately, the data for the Ecoli control trial failed to be recorded due to procedural error by the experimentors.

// Iterate over datasets backwards so I can simply accounting for the missing control data for E. coli
#for (label, species, data) in (
  (
    label: <ecoli-graph>,
    species: [Ecoli],
    data: (ecoli_group2, ecoli_group1),
  ),
  (
    label: <coag-graph>,
    species: [Coagulans],
    data: (coag_group2, coag_group1, coag_control),
  ),
  (
    label: <halo-graph>,
    species: [Halo],
    data: (halo_group2, halo_group1, halo_control),
  ),
) [
  #figure(
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
              row,
            )
          }
        },
      )
    }),
  ) #label
]

== Calculations
#let average_diff(a, b) = {
  let a_data = a.map(r => r.last())
  let b_data = b.map(r => r.last())

  calc.round(
    digits: 5,
    a_data.zip(b_data).map(((a, b)) => b - a).sum() / a_data.len(),
  )
}

#let coag_diff_1 = average_diff(coag_control, coag_group1)
#let coag_diff_2 = average_diff(coag_control, coag_group2)
#let halo_diff_1 = average_diff(halo_control, halo_group1)
#let halo_diff_2 = average_diff(halo_control, halo_group2)

#figure(
  table(
    columns: 4,
    [Species], [Trial], [Difference], [Average Difference],
    table.cell(rowspan: 2)[Coagulans], [1], [#coag_diff_1],
    table.cell(rowspan: 2)[#(
        calc.round(digits: 5, (coag_diff_1 + coag_diff_2) / 2)
      )],
    [2], [#coag_diff_2],
    table.cell(rowspan: 2)[Halo], [1], [#halo_diff_1],
    table.cell(rowspan: 2)[#(
        calc.round(digits: 5, (halo_diff_1 + halo_diff_2) / 2)
      )],
    [2], [#halo_diff_2],
  ),
)

= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)


