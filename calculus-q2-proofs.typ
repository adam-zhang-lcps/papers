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
#show: equate.with(breakable: true, sub-numbering: true, number-mode: "label")

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]

= Proofs
+ If $arrow(r)(t) = arrow(a) cos(omega t) + arrow(b) sin (omega t)$, where $arrow(a)$ and $arrow(b)$ are constant vectors, show that: $arrow(r)(t) times arrow(r)'(t) = omega arrow(a) times arrow(b)$ (*Note*: $arrow(r)(t)$ is not in component form).

  $
    arrow(r)'(t) &= -omega arrow(a) sin(omega t) + omega arrow(b) cos(omega t) \
    arrow(r)(t) times arrow(r)'(t) &= ( arrow(a) cos(omega t) + arrow(b) sin (omega t) ) times (-omega arrow(a) sin(omega t) + omega arrow(b) cos(omega t)) \
    &= arrow(a) cos ( omega t ) times omega arrow(b) cos(omega t) + arrow(b) sin(omega t) times -omega arrow(a) sin(omega t) \
    &= cos(omega t) cos(omega t) ( arrow(a) times omega arrow(b) ) + sin(omega t) sin(omega t) (arrow(b) times -omega arrow(a)) \
    &= cancel((cos^2(omega t) + sin^2(omega t))) ( omega arrow(a) times arrow(b) ) \
    &= omega arrow(a) times arrow(b)
  $

+ If $arrow(u)(t) = arrow(r)(t) dot [arrow(r)'(t) times arrow(r)''(t)]$, show that $arrow(u)'(t) = arrow(r)(t) dot [arrow(r)'(t) times arrow(r)'''(t)]$.

  $
    arrow(u)'( t ) &= cancel(arrow(r)'(t) dot [
      arrow(r)'(t) times arrow(r)''(t)
    ]) + arrow(r)( t ) dot [ cancel(arrow(r)''(t) times arrow(r)''(t)) + arrow(r)'( t ) times arrow(r)'''(t) ] \
    &= arrow(r)(t) dot [arrow(r)'(t) times arrow(r)'''(t)]
  $

+ Show that $arrow(A) dot (dif arrow(A))/(dif t) = norm(arrow(A)) (dif norm(arrow(A)))/(dif t)$.

  Let $arrow(A) = arrow(r)(t)$ and $m(t) = norm(arrow(r)(t))$.

  $
    arrow(r)(t) dot (dif arrow(r)) / (dif t) &= m(t) (dif m) / (dif t) \
    &= dif / (dif t) integral m(t) m'(t) dif t \
    &= dif / (dif t) [m(t)^2 / 2] \
    &= 1 / 2 dif / (dif t) [arrow(r) dot arrow(r)] \
    &= 1 / 2 ( (dif arrow(r)) / (dif t) dot arrow(r) + (dif arrow(r)) / (dif t) dot arrow(r) ) \
    &= arrow(r) dot (dif arrow(r)) / (dif t)
  $

+ You are told that there is a function $f(x, y)$ whose partial derivatives are given by $f_x (x, y) = -2 x y sin(x^2 y)$ and $f_y (x, y) = -x^2 sin(x^2 y)$. Should you believe it? Why or why not?

  $
    integral f_x dif x &= -integral 2 x y sin(x^2 y) dif x \
    &= cos(x^2 y) + g(y) \
    integral f_y dif y &= -integral x^2 sin(x^2 y) dif y \
    &= cos(x^2 y) + h(x) \
    therefore f(x, y) &= cos(x^2 y)
  $

+ The gas law for a fixed mass $m$ of an ideal gas at absolute temperature $T$, pressure $P$, and volume $V$ is $P V = m R T$ where $R$ is the gas constant. Show that $T (diff V)/(diff T) (diff P)/(diff T) = m R$.

  $
    V = (m R T) / P and P = (m R T) / V and T = (P V) / (m R) \
    T (diff V) / (diff T) (diff P) / (diff T) = cancel(P V) / cancel(m R) cancel(m R) / cancel(P) (m R) / cancel(V) = m R
  $

+ Prove, given that the third-order partial derivatives of $f(x, y, z)$ are continuous then, $f_(x y z) = f_(z x y) = f_(y z x)$.

  If $f(x) : RR^n |-> RR$ has continuous second derivatives at $x$, then $(diff^2 f) / (diff x_i x_j) = (diff^2 f) / (diff x_j x_i)$ (Clairaut's theorem).

  $
    f_(x y z) &= f_(z x y) &&= f_(y z x) \
    (diff^3 f) / (diff z diff y diff x) &= (diff^3 f) / (diff y diff x diff z) &&= (diff^3 f) / (diff x diff z diff y) \
    &= (diff) / (diff y) (diff^2 f) / (diff x diff z) &&= (diff^2) / (diff x diff z) (diff f) / (diff y) \
    &= (diff) / (diff y) (diff^2 f) / (diff z diff x) &&= (diff^2) / (diff z diff x) (diff f) / (diff y) \
    &= (diff^2) / (diff y diff z) (diff f) / (diff x) &&= (diff) / (diff z) (diff^2 f) / (diff x diff y) \
    &= (diff^2) / (diff z diff y) (diff f) / (diff x) &&= diff / (diff z) (diff^2 f) / (diff y diff x) \
    &= (diff^3 f) / (diff z diff y diff x) &&= (diff^3 f) / (diff z diff y diff x)
  $

+ Verify that if $z(x, y) = f(x^2 + y^2)$ then $y (diff z)/(diff x) (x, y) - x (diff z)/(diff y) (x, y) = 0$.

  $
    (diff z) / (diff x) = f'(x^2 + y^2) dot 2x = 2x f'(x^2 + y^2) \
    (diff z) / (diff y) = f'(x^2 + y^2) dot 2y = 2y f'(x^2 + y^2) \
    y (diff z) / (diff x) (x, y) - x (diff z) / (diff y) (x, y) = 2 x y f'( x^2 + y^2 ) - 2 x y f'(x^2 + y^2) = 0
  $

+ Let $alpha > 0$ be a constant. Prove that $u(x, y, z, t) = 1/(t^(3/2)) e^(- (x^2 + y^2 + z^2)/(4 alpha t))$, satisfies the heat equation given by: $u_t = alpha (u_(x x) + u_(y y) + u_(z z))$ for all $t > 0$.

  Let $E = e^(- (x^2 + y^2 + z^2)/(4 alpha t))$. Due to the symmetry of $u(x, y, z, t)$ across $x$, $y$, and $z$, @8-uxx can be used to derive @8-uyy and @8-uzz.

  $
    u_x (x, y, z, t) &= 1 / (t^(3 / 2)) E (
      -x / (2 alpha t)
    ) = -(x) / (2 alpha t^(5 / 2)) E \
    u_(x x) (
      x, y, z, t
    ) &= - 1 / (2 alpha t^(5 / 2))E + -x / (2 alpha t^(5 / 2)) E (
      - x / (2 alpha t)
    ) \
      &= E (- 1 / (2 alpha t^(5 / 2)) + x^2 / (4 alpha^2 t^(7 / 2))) #<8-uxx> \
      u_(y y) &= E (- 1 / (2 alpha t^(5 / 2)) + y^2 / (4 alpha^2 t^(7 / 2))) #<8-uyy> \
      u_(z z) &= E (- 1 / (2 alpha t^(5 / 2)) + z^2 / (4 alpha^2 t^(7 / 2))) #<8-uzz> \
  $

  $u_t (x, y, z, t)$ is given by @8-ut.

  $
    u_t (x, y, z, t) &= - 3 / (2 t^(5 / 2)) E + 1 / (t^(3 / 2)) E (
      (x^2 + y^2 + z^2) / (4 alpha t^2)
    ) \
    &= E (- 3 / (2 t^(5 / 2)) + (x^2+y^2+z^2) / (4 alpha t^(7 / 2))) #<8-ut>
  $

  Combine to show equality (@8-solution).

  $
    E (- 3 / (2 t^(5 / 2)) + (x^2+y^2+z^2) / (4 alpha t^(7 / 2))) &= alpha (
      u_(x x) + u_(y y) + u_(z z)
    ) \
    &= alpha E (
      - 3 / (2 alpha t^(5 / 2)) + (x^2 + y^2 + z^2) / (4 alpha^2 t^(7 / 2))
    ) \
      &= E(- 3/(2 t^(5/2)) + (x^2 + y^2 + z^2)/(4 alpha t^(7/2))) #<8-solution>
  $

#pagebreak(weak: true)
= True or False
Prove that the given statement is true in $RR^3$ or provide a counterexample to show that it is false.

9. The curves $arrow(r)_1 (t) = (-1 + t)hat(i) + (1 + 2t)hat(j) + (5 - t)hat(k)$ and $arrow(r)_2 (t) = (2 + 2t)hat(i) + (4 + t)hat(j) + (3 + t)hat(k)$ intersect.

  Let $arrow(r_2)(s) = (2 + 2s)hat(i) + (4 + s)hat(j) + (3 + s)hat(k)$.

  $
    (-1 + t)hat(i) = (2 + 2s)hat(i) => t = 2s + 3 \
    (1 + 2t)hat(j) = (4 + s)hat(j) \
    s + 4 = 1 + 4s + 6 \
    3s = -3 \
    s = -1 and t = 1 \
    (5 - t)hat(k) = (3 + s)hat(k) \
    4 != 2 \
    therefore exists.not (t, s) in RR^2 : arrow(r)_1(t) = arrow(r)_2(s)
  $

+ If $arrow(r)(t)$ is a differentiable vector function, then $dif/(dif t) norm(arrow(r)(t)) = norm(arrow(r)'(t))$. <10>

  Let $arrow(r)(t) = cos(t^2)hat(i) + sin(t^2)hat(j)$.

  $
    forall t in RR : norm(arrow(r)(t)) &= sqrt(cos^2(t^2) + sin^2(t^2)) = 1 \
    &therefore dif / (dif t) norm(arrow(r)(t)) = 0 \
    arrow(r)'(t) &= -2t sin(t^2)hat(i) + 2t cos(t^2)hat(j) \
    norm(arrow(r)'(t)) &= sqrt(4t^2 sin^2(t^2) + 4t^2 cos^2(t^2)) = 2t \
    exists t in RR : 0 != 2t &therefore exists ( arrow(r)(t) : RR |-> RR^3 ) exists t in RR :
    dif / (dif t) norm(arrow(r)(t)) != norm(arrow(r)'(t))
  $

+ If $norm(arrow(r)(t)) = 1$ for all $t$, then $norm(arrow(r)'(t))$ is a constant.

  Let $arrow(r)(t) = cos(t^2)hat(i) + sin(t^2)hat(j)$. By #link(<10>)[Proof 10], $forall t in RR : norm(arrow(r)(t)) = 1 and norm(arrow(r)'(t)) = 2t therefore norm(arrow(r)(t)) = 1 arrow.double.not forall t in RR : norm(arrow(r)'(t)) = c$.

+ Any surface which is the level surface of a three-variable function $g(x, y, z)$ can also be represented as the graph of a two-variable function $f(x, y)$.

  Let $g(x, y, z) = x^2 + y^2 + z^2$. The level surface $g(x, y, z) = 1$ is given by $x^2 +y^2 + z^2 = 1$. Solving for $z$ yields $z = plus.minus sqrt(1 - x^2 + y^2)$, which cannot be represented as a function, as the range contains multiple outputs per input.

+ If $f$ is a function, then $lim_((x, y, z) -> (2, 5, 3)) f(x, y, z) = f(2, 5, 3)$.

  $
    f( x, y, z ) : RR^3 |-> R = cases(x + y + z "if" x >= 2, x + y + 1 "if" x < 2) \
    f(2, 5, 3) = 10 and lim_((x, y, z) -> (2, 5, 3)) f(x, y, z) "does not exist"
  $
