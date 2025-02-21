#set page(paper: "us-letter", margin: 1in)
#set text(font: "Courier Prime", size: 12pt)
// Double spacing is weird
#set par(spacing: 1.89em)

#let titlepage(title: str, desc: content, by: content) = [
  #page(
    margin: (
      top: 3.5in,
      left: 4in,
      right: 1in,
      bottom: 1in,
    ),
  )[
    #upper(title)

    #{ "_" * title.len() }

    #desc

    by

    #by
  ]
]

#let character(name) = [#h(3in) #upper(name)]

#let dialogue(content) = content

#let direction(content) = [#h(2.5in) #content]

#titlepage(
  title: "Super Bowl Squabble",
  desc: [An Intense Food Fight],
  by: [Adam Zhang, Kaleigh Knodell, Diego Carames, Taylor Leberknight],
)

#page(margin: (left: 1.5in, rest: 1in))[
  #align(center)[#underline[Cast of Characters]]
]

#h(3in) #underline[ACT I]

#h(3in) #underline[Scene 1]

#character[Bartender]

#dialogue[Hey guys, welcome in, take a seat wherever!],

#direction[Taylor and Diego sit down at the bar. PhD Student is a few seats over, wearing a MIT sweater. Bartender is pouring him a drink. The Super Bowl is about to start on the TV screens around the bar.]

[Bartender comes over from serving PhD Student’s 2nd soju glass of the night.]

Bartender: [Wipes glass with rag] What can I get you started with for today?

Diego: I’ll take a glass of apple juice and a Caesar salad to start with, thank you.

Bartender: What about you, ma’am?

Taylor: I’ll have a Shirley Temple and some bone-in wings.

[Bartender prepares the drinks.]

Bartender: Alright, here are your drinks, I’ll grab those dishes for you from the kitchen.

Diego: You shouldn’t have ordered that, those wings are horrible for your health, they’ll give you a heart attack and you’ll die. (Slippery slope)

Taylor: Well, I eat wings every day and haven’t died yet so they must be healthy. (Anecdotal Fallacy)

Diego: Wings aren’t healthy, and they aren’t even that good, they’re average at best, the salad is way better. (Tu Quoque, pt. 1) Maybe if you started eating healthy you’d actually grow to a reasonable height. (Ad hominem)

Taylor: Wow, are you saying you hate all short people? Short people can be just as healthy as everyone else. (Straw man) Also, didn’t you used to eat wings all the time? (Tu Quoque, pt. 2)

Diego: Maybe, but don’t you do hard drugs everyday? Just because it hasn’t killed you does that mean it's healthy?

Taylor: Okay and? Everyone does hard drugs these days, you should try it too sometime! (Bandwagon)

PhD Student: Yeah what she said! [passes out]

Diego: He’s a drunk and depressed broke alcoholic with no scholarships and 200k in student loans, him agreeing proves nothing! (Ad Hominem)

Taylor: Yeah but he’s a PhD student at [?], he must be right! (Appeal to authority)

Diego: Does PhD stand for “perpetually high and drunk”? (Ad Hominem)

Taylor: Hey, the bartender’s coming back, let’s ask her to weigh in!

Bartender: Haven’t you people ever had the decency to consider running on a treadmill while watching the Super Bowl?! (Red Herring). Being active while watching TV is obviously the best, that's why everyone should workout while watching the Super Bowl. (Circular Argument)

Diego: Even the bartender agrees, running and salad are both healthy for you. Therefore salad is better than wings! (False Equivalence)

Bartender: Salad and wings aren’t a great comparison either. One is fried finger food and the other is a healthy dish. Besides, I’ve never had a bad experience with any Super Bowl food before, it’s always tasty and perfect (Hasty Generalization).

Taylor: Our argument is valid since wings are just like salads. You eat them both during the super bowl. (Weak Analogy)

Diego: I still believe salad is better. Last year, I ate salad at the super bowl party, and my team won. Therefore, salad is better than wings and eating it helps them win. (False Cause)

Taylor: Fine, salads are okay, but wings are a gift from nature. Who can deny that? (Appeal to Ignorance).

[Bartender walks away, notices PhD Student asleep, and shakes PhD Student awake.]

Diego: Salads are more of a gift of nature than wings. They literally come straight from the Earth. Also, you can’t say salads are bad and then say they’re okay a few minutes later. You either hate salads or you love them. Pick a side! (False Dilemma).

PhD Student: [groggy] What?

Taylor: Well, I’ve already ordered the wings, so it’d be a waste to not eat them (Sunk cost).

Diego: Whatever, I'm going to the bathroom.

[Diego leaves to use the restroom. Taylor, still frustrated, looks around and notices PhD Student again.]

Taylor: [shaking head] If he really cared about the environment he wouldn’t waste food. (Emotional Appeal)

[PhD Student slowly stirs and rubs his eyes.]

Taylor: Adam, would you like a wing? Maybe you’ll find them worthy of Super Bowl status unlike someone.

PhD Student: No, I think I’ll throw up if I eat anything. Thanks though. [yawning] What were you two arguing about so loudly anyway?

Taylor: Diego thinks that salad is better than chicken wings! Like, lettuce and cucumbers are disgusting, why would anyone eat salad?? (Composition fallacy)

[Diego returns from the restroom.]

PhD Student: Uh, I think that’s a fallacious argument…

Diego: HA, you’re wrong Taylor! (Fallacy fallacy)

[In the background, the Super Bowl is beginning on the televisions around the bar.]

Bartender: Hey you two, no more bickering, the game is on!

[Intensified NFL theme music.]
[Fade to black. End scene.]
[Text Message Displayed on Black Screen] [Every food is good food. Enjoy the game.]
