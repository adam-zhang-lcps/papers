#import "@preview/fletcher:0.5.7" as fletcher: diagram, edge, node

#set page(width: 48in, height: 36in, margin: 0.5in)
#set text(font: "New Computer Modern", size: 36pt)

#show "c3": [c#super[3]edit]

#show heading.where(level: 1): set text(54pt)
#show heading.where(level: 1): set align(center)

#let section(title, body) = [#rect(
    width: 100%,
    inset: 0.5in,
    stroke: (
      paint: black,
      thickness: 2pt,
      dash: "dotted",
    ),
    radius: 16pt,
  )[
    = #title

    #body
  ]

  #v(0.5in)
]

#grid(
  // Exact dimensions of the board are 48x36in, with 12in for the two side
  // panels. Our grid is half an inch less on each edge (another half inch of
  // padding within both boxes), since we have (a total of) two inches of gutter
  // in-between. Another half-inch deducted on sides for page margins.
  columns: (11in, 23in, 11in),
  gutter: 1in,
  [
    #section([Background])[
      #lorem(80)
    ]

    #section([Problem])[
      There exists a wide variety of software developers, and an equally diverse landscape of developer tools, including text editors/integrated developer environments (IDEs).

      StackOverflow conducts the largest annual survey of developers. One question asked is editor/IDE preference. @so-editor-survey shows a small snippet of the responses; as shown, there is a large swath of different choices.

      #figure(
        caption: [StackOverflow 2024 Developer Survey Results for Editor Preference],
        image(width: 80%, "assets/c3edit-poster/so-developer-survey.png"),
      ) <so-editor-survey>

      With the increasing popularity of remote work and online collaboration, there is an corroborating desire for collaborative tools. Developers find themselves with no shortage of asynchronous collaborative tools: Git, issue trackers, and forums are aplenty. However, synchronous tools are not nearly as prevalent. Notably, there is infrequent use of real-time collaborative editing tools (akin to Google Docs). One reason for this may be the
    ]
  ],
  [
    #align(center)[
      #set text(64pt)
      *c3: Developing a Framework for Real-Time Cross-Editor Collaborative Editing*
    ]

    #section([Method])[
      #figure(diagram(
        node-stroke: .1em,
        node-fill: gradient.radial(
          blue.lighten(80%),
          blue,
          center: (30%, 20%),
          radius: 80%,
        ),
        spacing: 4em,
        edge(
          (-1, 0),
          "r",
          "-|>",
          `open(path)`,
          label-pos: 0,
          label-side: center,
        ),
        node((0, 0), `reading`, radius: 2em),
        edge(`read()`, "-|>"),
        node((1, 0), `eof`, radius: 2em),
        edge(`close()`, "-|>"),
        node((2, 0), `closed`, radius: 2em, extrude: (-2.5, 0)),
        edge((0, 0), (0, 0), `read()`, "--|>", bend: 130deg),
        edge((0, 0), (2, 0), `close()`, "-|>", bend: -40deg),
      ))

      #figure(diagram(
        node-stroke: 1pt,
        node-corner-radius: 4pt,
        node-inset: 4mm,
        node-outset: 1mm,
        edge-stroke: 1pt,
        mark-scale: 80%,
        node((0, 0), [Editor]),
        edge("<|-|>"),
        node((1, 0), [Backend]),
        node(enclose: ((0, 0), (1, 0)), inset: 6mm, snap: false),
        edge("<|-|>"),
        node((3, 0), [Backend]),
        edge("<|-|>"),
        node((4, 0), [Editor]),
        node(enclose: ((3, 0), (4, 0)), inset: 6mm, snap: false),
      ))
    ]
  ],
  [
    #section([Results])[
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
          .map(((label, symbol)) => block(
            width: 100%,
            below: 0.5em,
          )[#label #box(width: 1fr, repeat[.]) #symbol])
          .reduce((x, y) => x + y)
      }]

    #section([Discussion])[
      #lorem(80)
    ]

    #section([Further Work])[
      #lorem(80)
    ]
  ],
)
