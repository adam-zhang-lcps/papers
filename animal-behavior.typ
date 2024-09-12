#import "@preview/cetz:0.2.2"
#import "aet-lab-report-template.typ": aet-lab-report

#let species = [_Tribolium confusum_]

#show: doc => aet-lab-report(
  title: [Investigating the Cheerios preference of #species],
  course: "AET AP Biology",
  teacher: "Ms. Suzanne Lohr",
  partners: ([Cole Strickland],),
  draft: true,
  doc,
)


= INTRODUCTION
== Purpose
Determine whether #species has a preference for normal Cheerios or Honey Nut Cheerios.

== Hypothesis
If #species has a choice between normal Cheerios and Honey Nut Cheerios, then they will choose the Honey Nut Cheerios due to their preference for sweet foods in some scenarios [citation needed].

== Background
Describe relevant background, concepts, and applicable equations. This should be about two to three paragraphs in length, but may be longer depending on the nature of the lab. Must include in-text citations with references alphabetized at the end of the laboratory document.

== EXPERIMENTAL METHOD
(The following items need to be included in the Experimental Method section, but NOT labeled as subheadings. You will not give step-by-step procedures or a materials list, which is different from the past. Instead, your methodology will be in paragraph form):

Experimental parameters clearly address the original question and hypothesis
Variables (IV, DV), constants, and controls are appropriately identified
All apparati and materials are included in the method and defined, if appropriate.
All safety issues are addressed and specific to the lab, link any mention of chemicals to a current SDS.
Description of method is in flowing, paragraph form and allows for complete repeatability and collection of relevant data.
A properly-labeled image of the set-up must be included and referenced in the text of this section.

#figure(
  caption: [Experimental Setup],
  image(width: 80%, "assets/animal-behavior/setup.jpg"),
)

= RESULTS
== Qualitative Observations
(physical description of substances, reactions, products, etc.)

== Photographic Documentation
Photos of your results with captions MUST be included in this section. Each photo is labeled with the word Figure and the next consecutive number throughout your report. See above that Figure 1 is used in the set-up. Your next photograph would be Figure 2: description as shown below. Do not make your photographs excessively large. Several should fit on one page,

#figure(
  caption: [Beetles in the Chamber during Trial 1],
  image(width: 80%, "assets/animal-behavior/mid-experiment.jpg"),
)

== Data
The data collected for all three trials in shown in @data-table. @graph-left shows a graph of the number of beetles in the left side of the choice chamber (containing plain Cheerios) for all three trials. @graph-right shows a graph of the number of beetles in the right side of the choice chamber (containing Honey Nut Cheerios) for all three trials.

#let data = csv("assets/animal-behavior/data.csv").slice(1)
#let totals = data.last()
#let data_non_totals = data.slice(0, 20)
#let data_raw = data_non_totals.map(row => {
  let time = row.first()
  let rest = row.slice(1).map(int)

  let (minutes, seconds) = time.split(":")
  let minutes = int(minutes)
  let seconds = int(seconds)

  (minutes * 60 + seconds, ..rest)
})

#figure(
  caption: [Number of Beetles per Side of Choice Chamber],
  table(
    columns: (auto, 8%, 8%, 8%, 8%, 8%, 8%),
    table.cell(rowspan: 2)[Time (m:s)],
    table.cell(colspan: 2)[Trial 1],
    table.cell(colspan: 2)[Trial 2],
    table.cell(colspan: 2)[Trial 3],
    ..([Left], [Right]) * 3,
    ..data_non_totals.flatten(),
    ..totals.map(x => [*#x*])
  ),
) <data-table>

#figure(
  caption: [Number of Beetles in the Left Chamber (plain Cheerios)],
  cetz.canvas({
    import cetz.plot

    plot.plot(
      size: (10, 8),
      axis-style: "scientific-auto",
      x-label: [Time (seconds)],
      y-label: [],
      y-min: 0,
      y-max: 10,
      y-tick-step: 1.0,
      legend: "legend.north",
      legend-style: (orientation: ltr, stroke: none, item: (spacing: 0.25)),
      {
        for i in (1, 3, 5) {
          plot.add(
            label: [Trial #{calc.ceil(i / 2)}],
            data_raw.map(row => {
              (row.at(0), row.at(i))
            }),
          )
        }
      },
    )
  }),
) <graph-left>

#figure(
  caption: [Number of Beetles in the Right Chamber (Honey Nut Cheerios)],
  cetz.canvas({
    import cetz.plot

    plot.plot(
      size: (10, 8),
      axis-style: "scientific-auto",
      x-label: [Time (seconds)],
      y-label: [],
      y-min: 0,
      y-max: 10,
      y-tick-step: 1.0,
      legend: "legend.north",
      legend-style: (orientation: ltr, stroke: none, item: (spacing: 0.25)),
      {
        for i in (2, 4, 6) {
          plot.add(
            label: [Trial #{calc.ceil(i / 2)}],
            data_raw.map(row => {
              (row.at(0), row.at(i))
            }),
          )
        }
      },
    )
  }),
) <graph-right>

== Calculations
Insert an example calculation. Do not write out “multiply velocity time time…” Define your parameters, use numbers, and equations. Include the general formula, formula with numbers, and final answer with units. If using statistics, this is where to put the null and alternative hypotheses.

= QUESTIONS
There were no questions provided with this experiment.

= DISCUSSION
== Conclusions
Discuss if the hypothesis was rejected or failed to be rejected by using data/evidence from the experiment as well as “real science” to explain and support the results and observations obtained through experimentation. This may need to be researched and then included in the references section. This is your “reasoning” section. Do NOT forget to include scientific reasoning in this section and citations from valid and reliable sources. Do not use personal pronouns and avoid using words like “the hypothesis was correct, satisfied, or proven.” It is either supported or not supported by the data or rejected or failed to be rejected if using statistics.

== Errors and Limitations
Describe errors and comment on percent error calculation. Include a discussion of how to minimize error in further research. Discuss the limitations that may have impacted your results.

== Applications
Explain how the conclusions and experiment are relevant to real-life--research to find specific examples of this concept or model in current use. Must include in-text citations.


