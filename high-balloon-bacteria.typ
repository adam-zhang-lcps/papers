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

= INTRODUCTION
== Purpose
Evaluate and compare the radiation resistance of Ecoli, Coagulans, and Halo.

== Hypothesis
Since Halo has shown exceptional radiation resistance in previous research @Jung2017:Microbial, it will show greater radiation resistance compared to both Ecoli and Coagulans, model organisms with no significant demonstrated radiation resistance.

== Background
High-altitude balloons provide a method of exploring the effects of spaceflight-like conditions that is much easier to utilize than the expensive and complex missions required for fully exiting Earth's atmosphere. High-altitude balloons are able to reach altitudes of 35 kilometers and greater, which exposes the contents of the balloon to atmospheric conditions that are, in many ways, similar to the surface of Mars. Thus, high-altitude balloons provide an opportunity to explore how key species will react to extraterrestrial conditions, an important area of research if humanity aspires to establish an interplanetary civilization. One key environmental stressor present at high altitudes that replicates Mars-like conditions is exposure to cosmic radiation. High altitudes within the stratosphere are not shielded from ionizing radiation like the surface of Earth is @SmithSowa2017:BallooninBiologis.

This experiment seeks to test the effect of exposure to this ionizing radiation on the growth of bacteriums. Bacteria and unicellular species are key to the survival of larger species such as humans @Encyclopaedia2024:BacteriaHumans. This experiment tests the bacteriums Ecoli and Coagulans, two model organisms frequently studied in various biological contexts @Blount2015:Ecoli @Aulitto2017:BacillusMa.

= EXPERIMENTAL METHOD
This experiment exposed organisms to ionizing radiation in the upper part of Earth's atmosphere by utilizing a high-altitude weather balloon. The weather balloon was prepared by an external party not directly involved in this experiment; experimental items were included as part of a biology "carry-on"; see @balloon-packing for a preliminary image of this payload.

Three cultures of each bacterium were prepared. Bacteriums were cultured in broth inside a tube and inoculated from their shipment containers. Tubes were labeled with their bacterium species as well as the trial they belonged to. Two out of the three cultures for each species were then sent to be carried by the high-altitude weather balloon; the remaining culture remained at ground level to reproduce under "normal" conditions.

Once the cultures from the high-altitude balloon were retrieved, data collection was performed using a VWR#emoji.reg V-1200 spectrophotometer. The spectrophotometer was utilized in tandem with the VWR#emoji.reg application software on a laptop to save measured readings. The spectrophotometer was first zeroed using a measurement of broth with zero microbial presence. Data was then collected in turn using a sample from each trial tube of bacterium, with care taken to ensure the spectrophotometer remained zeroed. Once measured, data was saved as an Excel spreadsheet and then exported to CSV for further analysis. See @spectrophotometer-picture for an image of the data collection setup.

#figure(
  caption: [Organisms Packed Within Balloon Container],
  image(height: 40%, "assets/high-balloon-bacteria/balloon-packing.jpg"),
) <balloon-packing>

#figure(
  caption: [Setup for Data Collection Using Spectrophotometer],
  image(height: 40%, "assets/high-balloon-bacteria/spectrophotometer.jpg"),
) <spectrophotometer-picture>

= RESULTS
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

@differences-table shows the average absorbance difference, across all wavelengths, between the control and experimental trials, as well as the average for each species. The average absorbance difference was calculated as the average of the difference between the absorbance of corresponding wavelengths across the control and experimental group.

As the loss of the control trial makes it impossible to perform meaningful analysis, the remaining data for trials involving Ecoli was ignored.

#figure(
  caption: [Average Absorbance Differences Between Control and Experimental Groups],
  table(
    columns: 4,
    [Species], [Trial], [Average Absorbance Difference], [Species Average],
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
) <differences-table>

= DISCUSSION
== Conclusion
The uncertainty of the data gathered throughout this experiment make it difficult for concrete conclusions to be drawn. The inability to perform meaningful analysis on the results of Ecoli further compound this uncertainty.

@differences-table shows that the experimental groups for Coagulans, on average, had significantly higher absorbance readings than the control group. @coag-graph provides further insight, showing that experimental groups had consistently higher absorbance readings; however, all absorbance readings were also negative, indicating greater transparency than the zero reading (empty broth).

On the other hand, the difference in absorbance readings between the control and experimental groups for Halo did not differ in any significant manner. @halo-graph shows that, in a similar manner as Coagulans, all absorbance readings were negative.

There are two possible conclusions to be drawn from these results. The first possibility is to interpret greater absorbance as indicating a greater microbial presence#CN. Thus, results would indicate that Coagulans development actually _benefited_ from the high-altitude weather balloon, while Halo development was unaffected. The second possibility is to interpret lesser absorbance as indicating decreased presence of bacterial broth, and thus indirectly indicating greater bacterial development through broth consumption. Therefore, the results would indicate that the cultures of Coagulans which experienced the environment of the high-altitude balloon had lessened development compared to the control group, while the development of Halo was, again, unaffected.

The researchers believe the second conclusion to be a more reasonable explanation for the results of this experiment, aligning with their hypothesis and previous research @Jung2017:Microbial. However, the researchers also recognize that caution and scrutiny must be employed when choosing to interpret results in a manner such that they support the original hypothesis.

== Errors and Limitations
There were plenty of sources of error present throughout this experiment, many of which compounded upon each other. The most notable error is the failure by the researchers in collecting data for the control trial for Ecoli, rendering it impossible to perform meaningful analysis of the results of the two experimental Ecoli groups which were exposed to the conditions of the high-altitude balloon. Further research should certainly not aim to replicate this mistake.

Additionally, there were multiple issues with the high-altitude balloon outside of the experimenters' control. Notably, many of the high-altitude balloon's sensors failed to properly function throughout the flight, resulting in a lack of availability of measurements to accurate describe flight conditions. It is also believed that the high-altitude balloon reached a peak altitude significantly lower than expected. Further experimentation should ensure that their high-altitude balloon reaches high altitudes.

== Applications



