#set page(paper: "us-letter", margin: 1in, header: align(right)[
  #counter(page).display()
])

#set par(leading: 2em)

#grid(rows: (50%, 50%))[
  #rect(width: 100%, height: 60%)[
    #align(center + bottom)[
      *Descriptive Title*
    ]
  ]
  #rect(width: 100%, height: 140%)[
    #align(center + top)[
      First Last

      Academies of Loudoun
    ]
  ]
]
