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

        *Quarter 2 Proofs*
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

  Let $f(x) = cos(x^2 y)$.

  $
    (diff f) / (diff x) &= -sin(x^2 y) dot 2 x y = - 2 x y sin(x^2 y)\
    (diff f) / (diff y) &= -sin(x^2 y) dot x^2 = - x^2 sin (x^2 y)
  $

+ The gas law for a fixed mass $m$ of an ideal gas at absolute temperature $T$, pressure $P$, and volume $V$ is $P V = m R T$ where $R$ is the gas constant. Show that $T (diff V)/(diff T) (diff P)/(diff T) = m R$.

  $
    V = (m R T) / P and P = (m R T) / V and T = (P V) / (m R) \
    T (diff V) / (diff T) (diff P) / (diff T) = (P V) / (m R) (m R) / P (m R) / V = m R
  $

+ Prove, given that the third-order partial derivatives of $f(x, y, z)$ are continuous then, $f_(x y z) = f_(z x y) = f_(y z x)$.
+ Verify that if $z(x, y) = f(x^2 + y^2)$ then $y (diff z)/(diff x) (x, y) - x (diff z)/(diff x) (x, y) = 0$.
// TODO I think there's a typo in the original document, need to confirm.
+ Let $a > 0$ be a constant. Prove that $u(x, y, z, t) = 1/(t^(3/2)) e^((x^2 + y^2 + z^2)/(4 alpha t))$, satisfies the heat equation given by: $u_t = alpha (u_(x x) + u_(y y) + u_(z z))$ for all $t > 0$.

= True or False
Prove that the given statement is true in $RR^3$ or provide a counterexample to show that it is false.

9. The curves $arrow(r)_1 (t) = (-1 + t)hat(i) + (1 + 2t)hat(j) = (5 - t)hat(k)$ and $arrow(r)_2 (t) = (2 + 2t)hat(i) + (4 + t)hat(j) + (3 + t)hat(k)$ intersect.
+ If $arrow(r)(t)$ is a differentiable vector function, then $dif/(dif t) norm(arrow(r)(t)) = norm(arrow(r)'(t))$. <10>

  Let $arrow(r)(t) = cos(t^2)hat(i) + sin(t^2)hat(j)$.

  $
    forall t in RR : norm(arrow(r)(t)) = sqrt(cos^2(t^2) + sin^2(t^2)) = 1 \
    therefore dif / (dif t) norm(arrow(r)(t)) = 0 \
    arrow(r)'(t) = -2t sin(t^2)hat(i) + 2t cos(t^2)hat(j) \
    norm(arrow(r)'(t)) = sqrt(4t^2 sin^2(t^2) + 4t^2 cos^2(t^2)) = 2t \
    0 != 2t therefore exists (arrow(r)(t) : RR |-> RR^3) :
    dif / (dif t) norm(arrow(r)(t)) != norm(arrow(r)'(t))
  $

+ If $norm(arrow(r)(t)) = 1$ for all $t$, then $norm(arrow(r)'(t))$ is a constant.

  Let $arrow(r)(t) = cos(t^2)hat(i) + sin(t^2)hat(j)$. By #link(<10>)[Proof 10], $forall t in RR : norm(arrow(r)(t)) = 1 and norm(arrow(r)'(t)) = 2t$.

+ Any surface which is the level surface of a three-variable function $g(x, y, z)$ can also be represented as the graph of a two-variable function $f(x, y)$.
// TODO Check if this one has a typo as well.
+ If $f$ is a function, then $lim_((x, y, z) -> (2, 5, 3)) f(x, y, z) = f(2, 5, 3)$.
