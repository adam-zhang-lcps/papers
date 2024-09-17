#import "@preview/cetz:0.2.2"
#import "aet-lab-report-template.typ": aet-lab-report

#let species = [_Tribolium confusum_]

#show: doc => aet-lab-report(
  title: [Investigating the Cheerios preference of #species],
  course: "AET AP Biology",
  teacher: "Ms. Suzanne Lohr",
  partners: ([Cole Strickland],),
  date: datetime(year: 2024, month: 09, day: 12),
  doc,
)

= INTRODUCTION
== Purpose
Determine whether #species has a preference for plain Cheerios or Honey Nut Cheerios.

== Hypothesis
If #species has a choice between normal Cheerios and Honey Nut Cheerios, then they will choose the Honey Nut Cheerios due to their consumption of sweet foods, such as fruit @HagstrumSubramanyam2017:StoredProductInsectResource.

== Background
#species, also known colloquially as the "confused flour beetle", is a small insect, named for its tendency to infest grain-based food such as flour. Originally from Africa, #species is now found worldwide, and is particularly problematic in the United States. They are small beetles, around one-eighth of an inch long (0.32 centimeters), and is reddish-brown in color. Larvae hatch and grow relatively fast, making them a good candidate for experimentation @BaldwinFasulo2010ConfusedFlourBeetles @Calvin2023:ConfusedFlourBeetleRedFlourBeetle.

This experiment seeks to investigate animal behavior---specifically that of #species. When observing animal behavior, behaviors can be broadly categorized into two categories: "kinesis" and "taxis". Kinesis refers to undirected, or "random", movement in response to a stimulus. This usually refers to a change in speed or direction of movement. On the other hand, taxis refers to directed movement---usually towards or away from a stimulus, known as positive and negative taxis, respectively. Taxis are named after the type of stimulus---for example, hydrotaxis refers to a movement towards or away from moisture, while phototaxis refers to a movement towards or away from light @Gunn1937:ClassificTaxesKineses @Mackenzie2023:HowAnimalsFollow.

The taxis investigated in this experiment will be the movement of #species when given the choice between plain Cheerios and Honey Nut Cheerios in a choice chamber. Plain Cheerios and Honey Nut Cheerios share a very similar ingredients list, with the only notable difference being the addition of honey in the latter @CheeriosIngredients @HoneyNutCheeriosIngredients. If #species show a preference for one type of Cheerios, there should be observable positive taxis in their movement towards their preferred type of Cheerios.

This experiment will use a $chi^2$ test to draw a conclusion about the results of manipulating the independent variable. The $chi^2$ test allows for determining the relationship between two sets of data, and whether that relationship is "statistically significant"---not due to random chance. If the calculated $chi^2$ value surpasses a "critical value" for a certain probability#footnote[A table of critical values is available online #link("https://statisticsbyjim.com/hypothesis-testing/chi-square-table")[here].], the relationship can be concluded to be statistically significant, and not due to chance. The value for the $chi^2$ test is calculated by summing the difference of the "observed" and "expected" data sets squared, divided by the "expected" data set; see @chi-squared-equation @Pearson1900:X. This experiment will use a probability of 0.05, and thus the critical value will be 3.84.

$ chi^2 = sum_(i=0)^n (o_i - e_i)^2 / e_i $ <chi-squared-equation>

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
The data collected for all three trials is shown in @data-table. @graph-left shows a graph of the number of beetles in the left side of the choice chamber (containing plain Cheerios) for all three trials. @graph-right shows a graph of the number of beetles in the right side of the choice chamber (containing Honey Nut Cheerios) for all three trials.

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

The result of the $chi^2$ test for each trial, as well as an average, is shown in @statistics. Given that this is a statistical experiment, the null and alternative hypotheses follow.

/ Null Hypothesis: When given the choice between plain Cheerios and Honey Nut Cheerios, there is no significant difference in the type of Cheerios that #species prefers.

/ Alternative Hypothesis: When given the choice between plain Cheerios and Honey Nut Cheerios, there is a significant difference in the number of #species that prefer Cheerios or Honey Nut Cheerios.

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

The critical value for the $chi^2$test in this experiment is $3.84$. Since the average $chi^2$ test value is #averages.chi, and $0.5 < 3.84$, this experiment fails to reject its null hypothesis.

= QUESTIONS
There were no questions provided with this experiment.

= DISCUSSION
== Conclusions
This experiment failed to reject its null hypothesis, and thus does not support the original hypothesis. Since the $chi^2$ test showed no significant difference, #species does not have a preference for plain Cheerios or Honey Nut Cheerios. Their behavior appeared to exhibit no forms of taxis, merely kinesis or a lack of movement. This could be due to many different factors. One reason could be that #species are unable to feed off of Cheerios at all, since they generally feed on pure grain sources such as flour; however, Cheerios contains many non-grain ingredients, including vitamins and preservatives. Additionally, both plain Cheerios and Honey Nut Cheerios have a nearly-identical list of ingredients, differing only in sugar and honey content @CheeriosIngredients @HoneyNutCheeriosIngredients @BaldwinFasulo2010ConfusedFlourBeetles.

== Errors and Limitations
There were many potential sources of error throughout this experiment. One notable observation is that the #species population tended to exhibit little movement throughout trials, lacking kinesis. This is likely due to difficulty moving within the crushed Cheerios. Further experimentation should attempt to grind the Cheerios to a finer powder or ensure there is less present so as to not impede the movement of the #species population.

Additionally, the Cheerios were crushed by hand, and thus the distribution of crushed Cheerios was not perfectly fine---some chunks left were larger than others. Further experimentation should attempt to use a reproducible method to grind Cheerios, such as a blender, to ensure even and fine distribution of crushed Cheerios.

Finally, the choice chamber used had a center section free of the independent variable (see @mid-experiment). However, members of the population within this area were still counted as part of the side they were on, with the dividing line straight across the center of the chamber. This may have resulted in inconsistencies in the data, as the center did not have either Cheerios variant within it, and thus provides no insight into the preference of #species. Further experimentation should attempt to either minimize this uncertain area or properly account for it during statistical analysis.

== Applications
#species is infamous for infesting and destroying the storage of multiple different grain product. They can spread rapidly through a food source, and there are many strains with varying levels of adaptability and resistance to insecticides. Thus, understanding of the behavior of #species is economically important @Kavallieratos2020:BiologicFeaturesPopulationGrowthTwoSoutheas[pp.~1--2]. Experiments such as this help further develop understanding of the behavior of #species, and thus provide valuable insight into techniques to prevent their infestation. Additionally, a choice chamber is useful to study the behavior of many different species, such as the preferred water type of marine fishes @James2008:ChoiceRhabdosar.
