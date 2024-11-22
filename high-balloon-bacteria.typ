#import "@preview/cetz:0.3.1"
#import "@preview/cetz-plot:0.1.0": plot, chart
#import "aet-lab-report-template.typ": aet-lab-report

#show "E coli": [_E. coli_]
#show "Coagulans": [_B. coagulans_]
#show "Halo": [_Halobacterium sp._ NRC-1]

#show: doc => aet-lab-report(
  title: [Evaluating and Comparing Radiation Resistance of Model Bacteriums],
  partners: ([Cole Strickland], [Eva Ulreich], [Luz Lazo]),
  course: "AET AP Biology",
  date: datetime(year: 2024, month: 11, day: 22),
  draft: true,
  doc,
)

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

#figure(
  caption: [Absorbance Levels for Coagulans],
  cetz.canvas({
    plot.plot(
      size: (12, 10),
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
        plot.add(
          label: [Control],
          coag_control.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
        plot.add(
          label: [Trial Group 1],
          coag_group1.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
        plot.add(
          label: [Trial Group 2],
          coag_group2.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
      },
    )
  }),
)

#figure(
  caption: [Absorbance Levels for E coli],
  cetz.canvas({
    plot.plot(
      size: (12, 10),
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
        plot.add(
          label: [Trial Group 1],
          ecoli_group1.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
        plot.add(
          label: [Trial Group 2],
          ecoli_group2.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
      },
    )
  }),
)

#figure(
  caption: [Absorbance Levels for Halo],
  cetz.canvas({
    plot.plot(
      size: (12, 10),
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
        plot.add(
          label: [Control],
          halo_control.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
        plot.add(
          label: [Trial Group 1],
          halo_group1.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
        plot.add(
          label: [Trial Group 2],
          halo_group2.map(r => (r.at("WL(nm)"), r.at("Abs."))),
        )
      },
    )
  }),
)

== Calculations
#lorem(60)

= Discussion
== Conclusion
#lorem(50)
== Errors
#lorem(50)
== Extensions
#lorem(50)


