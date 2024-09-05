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
Figure 1: Set-up of Inclined Plane and Cart.
RESULTS
Qualitative Observations (physical description of substances, reactions, products, etc.)
Photographic Documentation
Photos of your results with captions MUST be included in this section. Each photo is labeled with the word Figure and the next consecutive number throughout your report. See above that Figure 1 is used in the set-up. Your next photograph would be Figure 2: description as shown below. Do not make your photographs excessively large. Several should fit on one page,

== Data
#let data = csv("assets/animal-behavior/data.csv").slice(1)

#figure(
  table(
    columns: (auto, 8%, 8%, 8%, 8%, 8%, 8%),
    table.cell(rowspan: 2)[Time (m:s)],
    table.cell(colspan: 2)[Trial 1],
    table.cell(colspan: 2)[Trial 2],
    table.cell(colspan: 2)[Trial 3],
    ..([Left], [Right]) * 3,
    ..data.flatten()
  ),
)

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


