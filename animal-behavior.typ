#import "@preview/cetz:0.2.2"
#import "aet-lab-report-template.typ": aet-lab-report

#let species = [_Tribolium confusum_]

#show: doc => aet-lab-report(
  title: [Investigating the Cheerios preference of #species],
  course: "AET AP Biology",
  teacher: "Ms. Suzanne Lohr",
  partners: ([Cole Strickland],),
  date: datetime(year: 2024, month: 09, day: 12),
  draft: true,
  doc,
)


= INTRODUCTION
== Purpose
Determine whether #species has a preference for normal Cheerios or Honey Nut Cheerios.

== Hypothesis
If #species has a choice between normal Cheerios and Honey Nut Cheerios, then they will choose the Honey Nut Cheerios due to their consumption of sweet foods, such as fruit @HagstrumSubramanyam2017:StoredProductInsectResource.

== Background
Describe relevant background, concepts, and applicable equations. This should be about two to three paragraphs in length, but may be longer depending on the nature of the lab. Must include in-text citations with references alphabetized at the end of the laboratory document.

= EXPERIMENTAL METHOD
Place the choice chamber upon a consistent, level surface, oriented length-wise horizontally. Place ten plain Cheerios on the left side of the chamber and ten Honey Nut Cheerios in the right side of the chamber—this is the independent variable. Use a hard object to crush the Cheerios within the choice chamber. The experimental setup is now complete. See @setup for a photograph of this setup.

Place ten #species in the center of the chamber and begin a timer for ten minutes. Count the number of #species in each side of the chamber in intervals of 30 seconds. Record these values in @data-table—this is the dependent variable. Upon completion of the ten minute timer, return the beetles to the center of the choice chamber and repeat the procedure twice more to collect data for three total trials. Ensure the chamber contents are not disturbed between trials and remains in a constant state. See @mid-experiment for a photograph of the experiment in progress.

Ensure that appropriate safety guidelines are obeyed throughout the experiment. Handle #species with caution, as they are capable of secreting substances that can cause itchiness upon contact with skin @Mullen2009:MedicalVeterinarEntomolog. Upon conclusion of the experiment, follow all instructor directions to ensure safe post-experiment cleanup.

Note that both photographs included in this report show the Cheerios in an intact state, contrary to the procedure given. This is due to an oversight by the experimentators when collecting photographic documentation. All data collected in this experiment was collected with crushed Cheerios in the choice chamber. <whoops>

#figure(
  caption: [Experimental Setup],
  image(width: 80%, "assets/animal-behavior/setup.jpg"),
) <setup>

= RESULTS
== Qualitative Observations
Through the experiment, some #species appeared to struggle with movement, perhaps due to the density and inconsistency of the crushed Cheerios. Most beetles either frequently changed sides throughout a trial or did not change sides at all.

== Photographic Documentation
A photograph showing the experiment in progress is shown in @mid-experiment. Note that the trial shown in @mid-experiment was not a part of the final experimental data due to an oversight by the experimentators; see the #link(<whoops>, [experimental method]) section for more details.

#figure(
  caption: [Beetles in the Chamber during Experimentation],
  image(width: 80%, "assets/animal-behavior/mid-experiment.jpg"),
) <mid-experiment>

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
#let diff(o, e) = calc.pow(o - e, 2) / e
#let diffs = totals.slice(1).chunks(2).map(x => {
  let (left, right) = x.map(int)
  let left_diff = diff(left, 100)
  let right_diff = diff(right, 100)

  (
    left: (val: left, diff: left_diff),
    right: (val: right, diff: right_diff),
    chi: left_diff + right_diff,
  )
})
#let averages = {
  let (left, right) = diffs
    .fold(
      (left: 0, right: 0),
      (acc, cur) => {
        (left: acc.left + cur.left.val, right: acc.right + cur.right.val)
      },
    )
    .values()
    .map(x => x / 3)
  let left_diff = diff(left, 100)
  let right_diff = diff(right, 100)

  (
    left: (val: left, diff: left_diff),
    right: (val: right, diff: right_diff),
    chi: left_diff + right_diff,
  )
}

The result of the $chi^2$-test for each trial, as well as an average, is shown in @statistics. Given that this is a statistical experiment, the null and alternative hypotheses follow.

/ Null Hypothesis: When given the choice between plain Cheerios and Honey Nut Cheerios, there is no significant difference in the type of Cheerios that #species prefers.

/ Alternative Hypothesis: When given the choice between plain Cheerios and Honey Nut Cheerios, there is a significant difference in the number of #species that prefer Honey Nut Cheerios.

#figure(
  caption: [$chi^2$ Calculations for Each Trial and Average],
  table(
    columns: 8,
    table.cell(rowspan: 2)[Trial],
    table.cell(colspan: 3)[Left (plain Cheerios)],
    table.cell(colspan: 3)[Right (Honey Nut Cheerios)],
    table.cell(rowspan: 2)[$ chi^2 $],
    ..(
      [Observed],
      [Expected],
      [$ (o-e)^2 / e $],
    ) * 2,
    ..(
      diffs.enumerate().map(((i, x)) => {
        (
          [Trial #{i+1}],
          x.left.val,
          100,
          x.left.diff,
          x.right.val,
          100,
          x.right.diff,
          x.chi,
        )
      }).flatten().map(x => [#x])
    ),
    [*Average*],
    ..{
      (
        averages.left.val,
        100,
        averages.left.diff,
        averages.right.val,
        100,
        averages.right.diff,
        averages.chi,
      ).map(x => [*#x*])
    }
  ),
) <statistics>

The critical value for the $chi^2$-test in this experiment is $3.84$. Since the average $chi^2$-test value is #averages.chi, and $0.5 < 3.84$, this experiment fails to reject its null hypothesis.

= QUESTIONS
There were no questions provided with this experiment.

= DISCUSSION
== Conclusions
This experiment failed to reject its null hypothesis, and thus does not support the original hypothesis. Since the $chi^2$-test showed no significant difference, #species does not have a preference for plain Cheerios or Honey Nut Cheerios. Their behavior appeared to exhibit no forms of taxis, merely kinesis or a lack of movement. This could be due to many different factors. One reason could be that #species are unable to feed off of Cheerios at all, since they generally feed on pure grain sources such as flour; however, Cheerios contains many non-grain ingredients, including vitamins and preservatives. Additionally, both plain Cheerios and Honey Nut Cheerios have a nearly-identical list of ingredients, differing only in sugar and honey content @CheeriosIngredients @HoneyNutCheeriosIngredients @BaldwinFasulo2010ConfusedFlourBeetles.

== Errors and Limitations
Describe errors and comment on percent error calculation. Include a discussion of how to minimize error in further research. Discuss the limitations that may have impacted your results.

== Applications
Explain how the conclusions and experiment are relevant to real-life--research to find specific examples of this concept or model in current use. Must include in-text citations.

@Kavallieratos2020:BiologicFeaturesPopulationGrowthTwoSoutheas
