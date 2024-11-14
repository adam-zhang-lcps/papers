#import "@preview/equate:0.2.1": equate

#set document(
  title: [Quarter 2 Proofs],
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(
  paper: "us-letter",
  margin: 1in,
  header: [
    #grid(
      columns: (1fr, 1fr),
      align(left + top)[
        #set block(spacing: 0.6em)

        AET Multivariable Calculus

        *Quarter 1 Proofs*
      ],
      align(right + top)[Adam Zhang],
    )
  ],
)
#set text(font: "New Computer Modern")
#set enum(numbering: "1.a.")
#set math.equation(numbering: "(1.a)")
// Allows numbering only referenced equations.
#show: equate.with(sub-numbering: true, number-mode: "label")

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]

= Proofs
+ If $arrow(r)(t) = arrow(a) cos(omega t) + arrow(b) sin (omega t)$, where $arrow(a)$ and $arrow(b)$ are constant vectors, show that: $arrow(r)(t) times arrow(r)'(t) = omega arrow(a) times arrow(b)$ (*Note*: $arrow(r)(t)$ is not in component form).
+ If $arrow(u)(t) = arrow(r)(t) dot [arrow(r)'(t) times arrow(r)''(t)]$, show that $arrow(u)'(t) = arrow(r)(t) dot [arrow(r)''(t) times arrow(r)'''(t)]$.
+ Show that $arrow(A) dot (dif arrow(A))/(dif t) = norm(arrow(A)) (dif norm(arrow(A)))/(dif t)$.
+ You are told that there is a function $f(x, y)$ whose partial derivatives are given by $f_x (x, y) = -2 x y sin(x^2 y)$ and $f_y (x, y) = -x^2 sin(x^2 y)$. Should you believe it? Why or why not?
+ The gas law for a fixed mass $m$ of an ideal gas at absolute temperature $T$, pressure $P$, and volume $V$ is $P V = m R T$ where $R$ is the gas constant. Show that $T (diff V)/(diff T) (diff P)/(diff T) = m R$.
+ Prove, given that the third-order partial derivatives of $f(x, y, z)$ are continuous then, $f_(x y z) = f_(z x y) = f_(y z x)$.
+ Verify that if $z(x, y) = f(x^2 + y^2)$ then $y (diff z)/(diff x) (x, y) - x (diff z)/(diff x) (x, y) = 0$.
// TODO I think there's a typo in the original document, need to confirm.
+ Let $a > 0$ be a constant. Prove that $u(x, y, z, t) = 1/(t^(3/2)) e^((x^2 + y^2 + z^2)/(4 alpha t))$, satisfies the heat equation given by: $u_t = alpha (u_(x x) + u_(y y) + u_(z z))$ for all $t > 0$.
