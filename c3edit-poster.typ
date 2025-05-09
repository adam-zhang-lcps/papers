#set page(width: 48in, height: 36in, margin: 1in)
#set text(font: "New Computer Modern", size: 36pt)

#show "c3": [c#super[3]edit]

#show heading.where(level: 1): set text(54pt)
#show heading.where(level: 1): set align(center)

#grid(
  // Exact dimensions of the board are 48x36in, with 12in for the two side
  // panels. Our grid is one inch less on each edge, since we have two inches of
  // gutter in-between. Another inch deducted on sides for page margins.
  columns: (10in, 22in, 10in),
  stroke: (paint: black, dash: "dotted"),
  gutter: 2in,
  [
    = Introduction

    #figure(image(width: 80%, "assets/c3edit-poster/so-developer-survey.png"))

  ],
  [
    #align(center)[
      #set text(64pt)
      *c3: Developing a Framework for Real-Time Cross-Editor Collaborative Editing*
    ]
  ],
  [
    = Results
    #{
      (
        ([Pairing between two editors], [✅]),
        ([Pairing between 3+ editors], [❌]),
        ([Synchronization of basic operations], [✅]),
        ([Synchronization of advanced operations], [⚠️]),
        ([Synced cursor display], [✅️]),
        ([Synced selection display], [⚠️]),
        ([Network resiliency], [❌]),
        ([Error recovery], [❌]),
        ([Friendly UI/UX], [❌]),
      )
        .map(((label, symbol)) => block(width: 100%, below: 0.5em)[#label #box(
            width: 1fr,
            repeat[.],
          ) #symbol])
        .reduce((x, y) => x + y)
    }
  ],
)
