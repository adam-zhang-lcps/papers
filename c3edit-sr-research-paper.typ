#let name = [c#super[3]edit]
#let title = [#name: a software framework for real-time cross-editor collaborative editing]

#set document(
  title: title,
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(paper: "us-letter")
#set text(font: "New Computer Modern")

#align(center)[
  #title
]

= Abstract
Most programmers have editors that they strongly prefer to use over others. With the wide array of choice available within the code editor ecosystem, it is natural that there is a wide variety of code editors in use, with differing levels of specialization, customizability, power, robustness, extensibility, and ease-of-use. While this is no problem for writing and sharing code through other tools such as Git, it means that live cross-editor collaborative editing is impossible. Many editors have live collaborative editing features available, but such solutions only work across the same editor, making it difficult for a team of diverse programmers to utilize together. Thus, just like how collaboration via Git is possible via an external program, I aim to build an external program capable of communication with various thin front-ends implemented for each editor to allow for cross-editor live collaborative editing.

= Problem
Most programmers have editors that they strongly prefer to use over others. With the wide array of choice available within the code editor ecosystem, it is natural that there is a wide variety of code editors in use, with differing levels of specialization, customizability, power, robustness, extensibility, and ease-of-use. The large variety of editors in use means that real-time collaborative editing is usually not an option for team programming, since there is no way to engage in live editing across editors.

= Background

= Significance
Computer science is becoming an increasingly broad field in the modern digital landscape, with more and more people learning programming. As teams grow, new tools will be needed to advance the ability to collaborate. One area that is currently lacking is real-time collaborative editing for teams with members who prefer to work in different editors. Thus, #name will provide tooling in a novel area to help diverse teams collaborate in a new dimension.

= Current Research and Development
The topic of collaborative editing is well-studied by many researchers, and many solutions already exist, such as Microsoft's "Live Share" @Microsoft2024:VisualStudioLiveShare and Zed's built-in functionality @Zed2024:Zed. While the technology is well-understood, none of these options offer a cross-editor solution, which is a critical requirement for usage in diverse teams. The only cross-editor solution I found is Tandem @Team2018:Tandem. However, it appears to be an abandoned project and has a complex architecture that I believe I can improve upon.

= Objectives
- A fully-functioning cross-platform (Windows, Mac, Linux) backend executable capable of interfacing with an arbitrary frontend via standard in/out and communicating with other backends over a network.
  - Capable of intelligently managing connections (adding and removing peers) and documents (adding and removing files).
  - Resilient to network instability (high ping and packet loss).
- Three fully-functioning frontend implementations for Emacs, Neovim, and Visual Studio Code, capable of utilizing all features of the backend.
- A clear specification for the frontend-backend communication protocol to allow independent developers to implement support for new editors.
- Clear documentation for end users to install, setup, and use the framework to partake in real-time collaborative editing.

= Management Draft
/ October 31: functioning and UX-ready framework implementation in Emacs.
/ November 30: functioning protocol implementation in VSCode.
/ December 9: functioning demonstration of real-time collaboration between two Emacs clients and one VSCode client.
/ December 31: finalize v1.0 of backend-frontend protocol and complete formal specification.
/ January 31: functioning protocol implementation in Neovim.
/ March 31: general cleanup: advance VSCode and Neovim implementations to UX-ready, squash bugs, implement proper error handling and recovery, increase resilience to network instability, implement user flow for connection management.

#pagebreak()
#bibliography("refs.bib", style: "apa", title: [References])
