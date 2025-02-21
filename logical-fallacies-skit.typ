#set page(paper: "us-letter", margin: 1in)
#set text(font: "Courier Prime", size: 12pt)
// HACK: Double spacing is weird.
#set par(leading: 1.89em, spacing: 1.89em)

#let title_page(
  title: str,
  desc: content,
  by: content,
  contact: content,
) = page(
  margin: (
    top: 3.5in,
    left: 4in,
    right: 1in,
    bottom: 1in,
  ),
)[
  #[
    // HACK: this is stupid.
    #set par(spacing: 1em)
    #upper(title)

    #{ "_" * title.len() }
  ]

  #desc

  by

  #set par(leading: 0.65em)
  #by

  // NOTE: this ignores margins, I think.
  #place(bottom + right, dx: 0.8in, dy: 0.8in)[
    #set align(left)
    #contact
  ]
]


#let cast_page(
  characters: array,
  scene: content,
  time: content,
) = page(margin: (left: 1.5in, rest: 1in))[
  #align(center)[#underline[Cast of Characters]]

  #for (name, desc) in characters [
    // HACK: cannot use a top-level grid, since row height varies.
    #grid(
      // HACK: there were no explicit dimensions given for this.
      columns: (45%, 55%),
      [#underline(name):], desc,
    )
  ]

  // HACK: this matches the example given 🤷.
  #v(2em)

  #align(center)[#underline[Scene]]

  #scene

  #align(center)[#underline[Time]]

  #time
]

#let init_labeling(label, content) = grid(
  columns: (3in, auto),
  [#upper(label):], content,
)

#let character(name) = block[#h(3in) #upper(name)]

#let dialogue(content) = block[
  #set par(leading: 0.65em)
  #content
]

#let direction(content) = block[#h(2.5in) (#content)]

#title_page(
  title: "Super Bowl Squabble",
  desc: [An Intense Food Fight],
  by: [Adam Zhang, Kaleigh Knodell, Diego Carames, and Taylor Leberknight],
  contact: [
    19019 Upper Belmont Pl \
    Leesburg, VA 20176 \
    Phone: (555) 555-5555 \
    Email: contact\@example.org
  ],
)

#cast_page(
  characters: (
    (
      [Kaleigh],
      [A woman, early 20s, serving as the bartender at the scene's bar.],
    ),
    ([Taylor], [A girl, late teens, enjoys eating wings.]),
    ([Diego], [A boy, late teens, sports fan and health aficionado.]),
    ([Adam], [A man, early 20s, alcoholic PhD student at MIT.]),
  ),
  scene: [A casual bar.],
  time: [2025, on the evening of Super Bowl LIX.],
)

// HACK: Set up page counter now to exclude first two pages and also reset the
// counter.
#counter(page).update(1)
#set page(
  numbering: (p, _total) => [
    // HACK Just hardcode Act and Scene.
    I-1-#p
  ],
  number-align: top + right,
)

#h(3in) #underline[ACT I]

#h(3in) #underline[Scene 1]

#init_labeling(
  [Setting],
  [A lively bar in the heart of the city. The Super Bowl is playing on the TV screens around the bar.],
)
#init_labeling(
  [At rise],
  [TAYLOR and DIEGO are walking into the bar. ADAM is a few seats away, wearing a MIT sweater and drinking. BARTENDER is pouring ADAM a drink.],
)
// HACK
#v(1em)

#character[Bartender]
#dialogue[Hey guys, welcome in, take a seat wherever!]

#direction[BARTENDER comes over from serving ADAM’s 2nd soju glass of the night.]

#character[Bartender]
#direction[Wipes glass with rag.]
#dialogue[What can I get you started with for today?]

#character[Diego]
#dialogue[I’ll take a glass of apple juice and a Caesar salad to start with, thank you.]

#character[Bartender]
#dialogue[What about you, ma’am?]

#character[Taylor]
#dialogue[I’ll have a Shirley Temple and some bone-in wings.]

#direction[BARTENDER prepares their drinks.]

#character[Bartender]
#dialogue[Alright, here are your drinks, I’ll grab those dishes for you from the kitchen.]

#direction[BARTENDER walks out of scene.]

#character[Diego]
#dialogue[You shouldn’t have ordered that, those wings are horrible for your health, they’ll give you a heart attack and you’ll die. (slippery slope)]

#character[Taylor]
#dialogue[Well, I eat wings every day and haven’t died yet so they must be healthy. (anecdotal fallacy)]

#character[Diego]
#dialogue[Wings aren’t healthy, and they aren’t even that good, they’re average at best, the salad is way better. (Tu Quoque, pt. 1) Maybe if you started eating healthy you’d actually grow to a reasonable height. (Ad hominem)]

#character[Taylor]
#dialogue[Wow, are you saying you hate all short people? Short people can be just as healthy as everyone else. (straw man) Also, didn’t you used to eat wings all the time? (Tu Quoque, pt. 2)]

#character[Diego]
#dialogue[Maybe, but don’t you do hard drugs everyday? Just because it hasn’t killed you doesn't mean it's healthy?]

#character[Taylor]
#dialogue[Okay and? Everyone does hard drugs these days, you should try it too sometime! (Bandwagon)]

#character[Adam]
#dialogue[Yeah what she said!]
#direction[ADAM passes out on the table.]

#character[Diego]
#dialogue[Look at him, he’s a drunk and depressed broke alcoholic with no scholarships and 200k in student loans, him agreeing proves nothing!]

#character[Taylor]
#dialogue[Yeah but he’s a PhD student at MIT, he must be right! (appeal to authority)]

#character[Diego]
#dialogue[Does PhD stand for "possibly high and drunk"? (Ad hominem)]

#character[Taylor]
#dialogue[Hey, the bartender’s coming back, let’s ask her to weigh in!]

#direction[BARTENDER returns with the food ordered earlier.]

#character[Bartender]
#dialogue[Haven’t you people ever had the decency to consider running on a treadmill while watching the Super Bowl?! (red herring) Being active while watching TV is obviously the best, that's why everyone should workout while watching the Super Bowl. (circular argument)]

#character[Diego]
#dialogue[Even the bartender agrees, running and salad are both healthy for you. Therefore salad is better than wings! (false equivalence)]

#character[Bartender]
#dialogue[Salad and wings aren’t a great comparison either. One is fried finger food and the other is a healthy dish. Besides, I’ve never had a bad experience with any Super Bowl food before, it’s always tasty and perfect. (hasty generalization)]

#character[Taylor]
#dialogue[Our argument is valid since wings are just like salads. You eat them both during the super bowl. (weak analogy)]

#character[Diego]
#dialogue[I still believe salad is better. Last year, I ate salad at my Super Bowl party, and my team won. Therefore, salad is better than wings and eating it helps them win. (false cause)]

#character[Taylor]
#dialogue[Fine, salads are okay, but wings are a gift from nature. Who can deny that? (appeal to ignorance)]

#character[Diego]
#dialogue[Salads are more of a gift of nature than wings. They literally come straight from the Earth. Also, you can’t say salads are bad and then say they’re okay a few minutes later. You either hate salads or you love them. Pick a side! (false dilemma)]

#direction[BARTENDER walks away, notices ADAM asleep, and shakes ADAM awake.]

#character[Adam]
#direction[groggy]
#dialogue[What?]

#character[Taylor]
#dialogue[Well, I’ve already ordered the wings, so it’d be a waste to not eat them. (sunk cost)]

#character[Diego]
#dialogue[Whatever, I'm going to the bathroom.]

#direction[DIEGO leaves to use the restroom. TAYLOR, still frustrated, looks around and notices ADAM again.]

#character[Taylor]
#direction[shaking head]
#dialogue[If he really cared about the environment he wouldn’t waste food. (emotional appeal)]

#direction[ADAM slowly stirs and rubs his eyes.]

#character[Taylor]
#dialogue[Adam, would you like a wing? Maybe you’ll find them worthy of Super Bowl status unlike someone.]

#character[Adam]
#direction[yawning]
#dialogue[No, I think I’ll throw up if I eat anything. Thanks though. What were you two arguing about so loudly anyway?]

#character[Taylor]
#dialogue[Diego thinks that salad is better than chicken wings! Like, lettuce and cucumbers are disgusting, why would anyone eat salad? (composition fallacy)]

#direction[Diego returns from the restroom.]

#character[Adam]
#dialogue[Uh, I think that’s a fallacious argument...]

#character[Diego]
#dialogue[HA, you’re wrong Taylor! (fallacy fallacy)]

#direction[In the background, the Super Bowl Halftime Show is beginning on the televisions around the bar.]

#character[Bartender]
#dialogue[Hey you three, no more bickering, the halftime show is starting!]

#direction[Fade to black and end scene. On a black screen, the message "Every food is good food. Enjoy the game." is displayed while "Not Like Us" by Kendrick Lamar plays in the background.]
