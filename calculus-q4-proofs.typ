#set document(
  title: [Quarter 4 Proofs],
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(paper: "us-letter", margin: 1in, header: [
  #grid(
    columns: (1fr, 1fr),
    align(left + top)[
      #set block(spacing: 0.6em)

      AET Multivariable Calculus

      *Quarter 4 Proofs*
    ],
    align(right + top)[Adam Zhang],
  )
])
#set text(font: "New Computer Modern")
#set enum(numbering: "1.a.")

#set math.vec(delim: "[")

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]

= Proofs
+ Use change of variables to show that $abs(diff(x, y, z) / diff(rho, theta, phi)) = rho^2 sin(phi)$.

  $
    x = rho sin phi cos theta wide y = rho sin theta sin phi wide z = rho cos phi
  $

  $
    abs(diff(x, y, z) / diff(rho, theta, phi)) &= mat(
      delim: "|",
      (diff x) / (diff rho), (diff x) / (diff theta), (diff x) / (diff phi);
      (diff y) / (diff rho), (diff y) / (diff theta), (diff y) / (diff phi);
      (diff z) / (diff rho), (diff z) / (diff theta), (diff z) / (diff phi);
    ) \
    &= mat(
      delim: "|",
      sin phi cos theta, -rho sin phi sin theta, rho cos theta cos phi;
      sin theta sin phi, rho sin phi cos theta, rho sin theta cos phi;
      cos phi, 0, -rho sin phi;
    ) \
    &= abs(cos phi (-rho^2 sin phi sin^2 theta cos phi - rho^2 cos^2 theta sin phi cos phi) \ &quad - rho sin phi (rho sin^2 phi cos^2 theta + rho sin^2 theta sin^2 phi)) \
    &= abs(cos phi (-rho^2 sin phi cos phi) - rho sin phi (rho sin^2 phi)) \
    &= abs(-rho^2 sin phi cos^2 phi - rho^2 sin phi sin^2 phi) \
    &= abs(-rho^2 sin phi) \
    &= rho^2 sin phi because forall phi in [0, tau / 2] : sin phi >= 0
  $

// This question only asks which ones *can* be evaluated via Green's Theorem; it
// doesn't actually ask to *evaluate* them. So, because I'm lazier than Haskell,
// I will *not* be doing that 🙃.
+ For which of the following can you use Green's Theorem to evaluate the integral? Explain.

  + $integral_C (x^2 + y^2) dif x + (x^2 + y^2) dif y$ where $C$ is the curve defined by $y = x$, $y = x^2$, $0 <= x <= 1$ with counterclockwise orientation.

    Since the curve $C$ is counterclockwise (positively oriented), closed, piecewise smooth, and both $L(x, y) = x^2 + y^2$ and $M(x, y) = x^2 + y^2$ have continuous partial derivatives for all $(x, y) in RR^2$ ($D subset RR^2$), Green's Theorem can be used to evaluate the integral.

  + $integral_C 1 / (sqrt(x^2 + y^2)) dif x - 1 / sqrt(x^2 + y^2) dif y$ where $C$ is the unit circle centered at the origin, oriented counterclockwise.

    Since the point $(0, 0) in D$ and $L(0, 0) = 1(sqrt(0)) = "undefined"$, indicating that the partial derivatives over $D$ are not continuous, Green's Theorem cannot be used to evaluate the integral.

  + $integral_C F dot dif r$ where $F = x hat(i) + y hat(j)$ and $C$ is defined by $r(t) = t^2 hat(i) + t^3 hat(j)$.

    Since $r(t)$ is not a closed loop for any value of $t$, Green's Theorem cannot be used to evaluate the integral.


#pagebreak()

= True or False
Are the following statements true or false? Explain why by citing a known
theorem or give a counterexample. Written answers must be in complete sentences
and mathematical answers must solve the problem completely.

3. If $arrow(F) = y hat(i) + x hat(j)$ and $C$ is given by $arrow(r)(t) = (4sin(t))hat(i) + (3cos(t))hat(j) "where" 0 <= t <= pi$, then $integral_C arrow(F) dot dif arrow(r) = 0$.

  $
    x(t) & = 4sin(t) \
    y(t) & = 3cos(t) \
    F(r(t)) & = vec(3cos(t), 4sin(t)) \
    dif arrow(r) & = vec(4cos(t), -3sin(t)) dif t \
    F(r(t)) dot dif arrow(r) & = 12cos^2(t) - 12sin^2(t) = 12cos(2t) dif t \
    integral_0^(tau / 2) 12 cos(2t) dif t &= 12 dot 1 / 2 [sin(2t)]_0^(tau / 2) = 6 (sin(tau) - sin(0)) \
    &= 0
  $

+ If $C_1$, $C_2$, and $C_3$ have the same initial and terminal points and $integral_C_1 arrow(F) dot dif arrow(r_1) = integral_C_2 arrow(F) dot dif arrow(r_2)$ then $integral_C_1 arrow(F) dot dif arrow(r_1) = integral_C_3 arrow(F) dot dif arrow(r_3)$.

  Two paths $C_1$ and $C_2$ with identical start and end points does not imply the field $arrow(F)$ is conservative. Consider $arrow(F)(x, y) = vec(-y, x)$. For any path from $(1, 0)$ to $(A, 0) : A in RR$ and back, the integral over that path will be 0. However, a path tracing the unit circle once clockwise will have an integral of $tau != 0$.

+ If $integral_C arrow(F) dot dif arrow(r) = 0$, where $C$ is any circle of the form $x^2 + y^2 = a^2$, then $arrow(F)$ is path independent.

  Again, multiple (infinite) possible paths having an integral of zero does not imply that _all_ possible paths have an integral of zero. Consider $arrow(F)(x, y) = vec(0, x^2)$. This field is not conservative ($0 != 2x$), but integrals over any circle evaluate to zero#footnote[Proving this is left as an exercise for the reader.].

+ $R$ and $T$ are corresponding regions of the $x y$- and $u v$-planes. $R$ is the region bound by the rotated ellipse $x^2 - x y + y^2 = 2$. Using the change of variables $y - x = (2sqrt(2 / 3))v$ and $y + x = (2sqrt(2))u$ leads to $integral.double_R (x^2 - x y + y^2) dif x dif y = integral.double_T (2u^2 + 2v^2)(sqrt(3) / 2) dif u dif v$ where $T$ is the region bound by the unit circle $u^2 + v^2 = 1$.

  $
    (y + x) + (y - x) = 2y & = 2sqrt(2)u + 2sqrt(2 / 3)v \
                         y & = sqrt(2) u + sqrt(2 / 3)v  \
    (y + x) - (y - x) = 2x & = 2sqrt(2)u - 2sqrt(2 / 3)v \
                         x & = sqrt(2)u - sqrt(2 / 3)v   \
  $

$
  dif x dif y & = |J| dif u dif v \
  |J| & = abs(diff(x, y) / diff(u, v)) = mat(delim: "|", (diff x) / (diff u), (diff x) / (diff v); (diff y) / (diff u), (diff y) / (diff v)) \
  &= mat(delim: "|", sqrt(2), -sqrt(2 / 3); sqrt(2), sqrt(2 / 3)) \
  &= abs(sqrt(2)sqrt(2 / 3) + sqrt(2)sqrt(2 / 3)) \
  &= 2 sqrt(2) (sqrt(2)) / (sqrt(3)) \
  &= 4 / sqrt(3) != sqrt(3) / 2
$
