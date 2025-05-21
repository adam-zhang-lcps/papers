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

+ For which of the following can you use Green's Theorem to evaluate the integral? Explain.

  + $integral_C (x^2 + y^2) dif x + (x^2 + y^2) dif y$ where $C$ is the curve defined by $y = x$, $y = x^2$, $0 <= x <= 1$ with counterclockwise orientation.

  + $integral_C 1 / (sqrt(x^2 + y^2)) dif x - 1 / sqrt(x^2 + y^2) dif y$ where $C$ is the unit circle centered at the origin, oriented counterclockwise.

  + $integral_C F dot dif r$ where $F = x hat(i) + y hat(j)$ and $C$ is defined by $r(t) = t^2 hat(i) + t^3 hat(j)$.


#pagebreak()

= True or False
Are the following statements true or false? Explain why by citing a known
theorem or give a counterexample. Written answers must be in complete sentences
and mathematical answers must solve the problem completely.

3. If $arrow(F) = y hat(i) + x hat(j)$ and $C$ is given by $arrow(r)(t) = (4sin(t))hat(i) + (3cos(t))hat(j) "where" 0 <= t <= pi$, then $integral_C arrow(F) dot dif arrow(r) = 0$.
+ If $C_1$, $C_2$, and $C_3$ have the same initial and terminal points and $integral_C_1 arrow(F) dot dif arrow(r_1) = integral_C_2 arrow(f) dot dif arrow(r_2)$ then $integral_C_1 arrow(F) dot dif arrow(r_1) = integral_C_3 arrow(F) dot dif arrow(r_3)$.
+ If $integral_C arrow(F) dot dif arrow(r) = 0$, where $C$ is any circle of the form $x^2 + y^2 = a^2$, then $arrow(F)$ is path independent.
+ $R$ and $T$ are corresponding regions of the $x y$- and $u v$-planes. $R$ is the region bound by the rotated ellipse $x^2 - x y + y^2 = 2$. Using the change of variables $y - x = (2sqrt(2 / 3))v$ and $y + x = (2sqrt(2))u$ leads to $integral.double_R (x^2 - x y + y^2) dif x dif y = integral.double_T (2u^2 + 2y^2)(sqrt(3) / 2) dif u dif v$ where $T$ is the region bound by the unit circle $u^2 + v^2 = 1$.
