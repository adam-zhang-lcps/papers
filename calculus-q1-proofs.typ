#import "@preview/equate:0.2.1": equate

#set document(
  title: [Quarter 1 Proofs],
  author: "Adam Zhang",
  date: datetime.today(),
)
#set page(header: [
  #grid(
    columns: (1fr, 1fr),
    align(left + top)[
      #set block(spacing: 0.6em)

      AET Multivariable Calculus

      *Quarter 1 Proofs*
    ],
    align(right + top)[Adam Zhang],
  )
])
#set enum(numbering: "1.a.")
#set math.equation(numbering: "(1.a)")
// Allows numbering only referenced equations.
#show: equate.with(sub-numbering: true, number-mode: "label")

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]

= Proofs
+ Given an unknown point $P$, and known points $𝐴(3, 2, −1)$ and $𝐵(−3, −1, 5)$, if the distance from $P$ to $A$ is equal to twice the distance from $P$ to $B$. Prove that the set of all points defined by $A$, $𝐵$, and $P$ is a sphere. Find the center and the radius.

  A sphere centered at the origin can be defined as the set of vectors ${arrow(v) | norm(arrow(v)) = r}$ where $r$ is the radius of the sphere. To translate the center of the sphere to the point defined by the position vector $arrow(P)$, each vector must be defined relative to the new point; thus, the set of vectors becomes ${arrow(v) mid(|) norm(arrow(v) - arrow(P)) = r}$. This can be represented as in @1-sphere-eq.

  $
    r &= norm(arrow(v) - arrow(P)) \
      &= sqrt((v_x - P_x)^2 + (v_y - P_y)^2 + (v_z - P_z)^2) \
      r^2 &= (v_x - P_x)^2 + (v_y - P_y)^2 + (v_z - P_z)^2 #<1-sphere-eq>
  $

  Let the position vectors $arrow(P)$, $arrow(A)$, and $arrow(B)$ represent the points P, A, and B, respectively. Thus, the given statement can be represented by @1-eq.

  $
    norm(arrow(A) - arrow(P)) = 2 norm(arrow(B) - arrow(P))
  $ <1-eq>

  Via elementary algebra, @1-eq can be rearranged into @1-rearranged, which, as established in @1-sphere-eq, defines a sphere with a radius of six centered at $(-5, -2, 7)$.
  $
    sqrt((A_x - P_x)^2 + (A_y - P_y)^2 + (A_z - P_z)^2) = 2 sqrt((B_x - P_x)^2 + (B_y - P_y)^2 + (B_z - P_z)^2) \
      (A_x - P_x)^2 + (A_y - P_y)^2 + (A_z - P_z)^2 = 4 (B_x - P_x)^2 + (
        B_y - P_y
      )^2 + (B_z - P_z)^2 \
      (3 - P_x)^2 + (2 - P_y)^2 + (-1 - P_z)^2 = 4 (
        (-3 - P_x)^2 + (-1 - P_y)^2 + (5 - P_z)^2
      ) \
      P_x^2 - 6 P_x - 4 P_y + P_y^2 + P_z^2 + 2 P_z
      + 14 = 4 P_x^2 + 24 P_x + 4 P_y^2 + 8 P_y - 40 P_z
      + 4 P_z^2 + 140 \
      - 3 P_x^2 - 30 P_x - 3 P_y^2 - 12 P_y
      - 3 P_z^2 + 42 P_z = 126 \
      -3 (P_x^2 + 10 P_x + P_y^2 + 4 P_y + P_z^2 - 14 P_z) = 126 \
      -3 (
        P_x^2 + 10 P_x + 25 + P_y^2 + 4 P_y + 4 + P_z^2 - 14 P_z + 49 - 78
      ) = 126 \
      -3 ((P_x + 5)^2 + (P_y + 2)^2 + (P_z - 7)^2) = -108 \
      (P_x + 5)^2 + (P_y + 2)^2 + (P_z - 7)^2 = 6^2 #<1-rearranged>
  $

+ If the midpoints of any two consecutive sides of any quadrilateral (in $RR^2$ or $RR^3$) are connected by straight lines, prove that the resulting quadrilateral is a parallelogram.

+ Prove that if $arrow(u) + arrow(v)$ and $arrow(u) - arrow(v)$ are orthogonal, then the vectors $arrow(u)$ and $arrow(v)$ must have the same magnitude.

  Two vectors are orthogonal if and only if $arrow(u) dot arrow(v) = 0$. Let $arrow(u) = angle.l u_1, u_2, dots, u_i angle.r$ and $arrow(v) = angle.l v_1, v_2, dots, v_i angle.r$. Given that $arrow(u) + arrow(v)$ and $arrow(u) - arrow(v)$ are orthogonal, @3-zero-sum can be derived.
  $
    arrow(u) + arrow(v) = angle.l u_1 + v_1, u_2 + v_2, dots, u_i + v_i angle.r
  $
  $
    arrow(u) - arrow(v) = angle.l u_1 - v_1, u_2 - v_2, dots, u_i - v_i angle.r
  $
  $
    (arrow(u) + arrow(v)) dot (arrow(u) - arrow(v)) &= sum_(n=0)^i (
      (u_n + v_n) dot (u_n - v_n)
    ) \
    &= sum_(n=0)^i (u_n^2 - v_n^2) \
    &= u_1^2 - v^2_1 + u_2^2 - v_2^2 + dots + u_i^2 - v_i^2 \
    &= 0
  $ <3-zero-sum>

  The above can be rearranged into @3-rearrange. By taking the square root of both sides, as in @3-sqrt, both sides of the equation are equal to the magnitude of each vector respectively; thus, $arrow(u) + arrow(v)$ and $arrow(u) - arrow(v)$ are orthogonal only if their magnitudes are equal.
  $
    u_1^2 + u_2^2 + dots + u_i^2 &= v^2_1 + v_2^2 + dots + v_i^2 #<3-rearrange> \
      sqrt(u_1^2 + u_2^2 + dots + u_i^2) &= sqrt(v^2_1 + v_2^2 + dots + v_i^2) #<3-sqrt>
  $

+ Suppose that $arrow(a) eq.not 0$.
  + (3 points) If $arrow(a) dot arrow(b) = arrow(a) dot arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?
  + (3 points) If $arrow(a) times arrow(b) = arrow(a) times arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?
  + (2 points) If $arrow(a) dot arrow(b) = arrow(a) dot arrow(c)$ #underline[and] $arrow(a) times arrow(b) = arrow(a) times arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?

+ Prove that if $arrow(a) dot (arrow(b) times arrow(c)) = 0$, then $arrow(a)$, $arrow(b)$, and $arrow(c)$ are coplanar.

+ Prove the triangle inequality theorem for vectors: $|arrow(a) + arrow(b)| gt.eq |arrow(a)| + |arrow(b)|$.

+ If $arrow(A) = A_1 hat(i) + A_2 hat(j) + A_3 hat(k)$, $arrow(B) = B_1 hat(i) + B_2 hat(j) + B_3 hat(k)$, $arrow(C) = C_1 hat(i) + C_2 hat(j) + C_3 hat(k)$, prove that $arrow(A) dot (arrow(B) times arrow(C)) = (arrow(A) times arrow(B)) dot arrow(C)$.

= True or False
Prove that the given statement is true in $RR^3$ or provide a counterexample to show that it is false.
8. Two lines parallel to a third line are parallel.

+ Two lines perpendicular to a third line are parallel.

  Two lines, described by $arrow(u)$ and $arrow(v)$, are perpendicular if and only if $arrow(u) dot arrow(v) = 0$. Thus, by @8-ik and @8-jk, the unit vectors $hat(i)$ and $hat(j)$ are both perpendicular to $hat(k)$. However, by @8-ij, $hat(i)$ and $hat(j)$ must also be perpendicular to each other, which means they cannot be parallel, disproving the statement by counterexample.
  $
    hat(i) dot hat(k) &= 0 #<8-ik> \
      hat(j) dot hat(k) &= 0 #<8-jk> \
      hat(i) dot hat(j) &= 0 #<8-ij>
  $

+ Two planes perpendicular to a third plane are parallel.

+ Two lines parallel to a plane are parallel.

+ Two lines perpendicular to a plane are parallel.

+ Two planes parallel to a line are parallel.
