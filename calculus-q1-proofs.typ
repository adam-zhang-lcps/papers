#import "@preview/equate:0.2.1": equate

#set document(
  title: [Quarter 1 Proofs],
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

// This proof… this proof *scares* me.
+ If the midpoints of any two consecutive sides of any quadrilateral (in $RR^2$ or $RR^3$) are connected by straight lines, prove that the resulting quadrilateral is a parallelogram.

  A quadrilateral in $RR^3$ can be defined by four points defined by position vectors $arrow(A)$, $arrow(B)$, $arrow(C)$, and $overline(D)$ with edges $overline(A B)$, $overline(B C)$, $overline(C D)$, and $overline(D A)$.

  The midpoint of each edge can be described as a vector as follows:
  $
    overline(A B) &: (arrow(A) + arrow(B)) / 2 \
    overline(B C) &: (arrow(B) + arrow(C)) / 2 \
    overline(C D) &: (arrow(C) + arrow(D)) / 2 \
    overline(D A) &: (arrow(D) + arrow(A)) / 2
  $

  Thus, the edges between the midpoints can be described as follows:
  $
    alpha &= (arrow(B) + arrow(C)) / 2 - (arrow(A) + arrow(B)) / 2 = 1 / 2 (
      arrow(C) - arrow(A)
    ) \
    beta &= (arrow(C) + arrow(D)) / 2 - (arrow(B) + arrow(C)) / 2 = 1 / 2 (
      arrow(D) - arrow(B)
    ) \
    gamma &= (arrow(D) + arrow(A)) / 2 - (arrow(C) + arrow(D)) / 2 = 1 / 2 (
      arrow(A) - arrow(C)
    ) \
    lambda &= (arrow(A) + arrow(B)) / 2 - (arrow(D) + arrow(A)) / 2 = 1 / 2 (
      arrow(B) - arrow(D)
    )
  $

  A quadrilateral is a parallelogram if both opposing edges are parallel. Two vectors are parallel if one is a scalar multiple of the other.
  $
    arrow(u) parallel arrow(v) <=> arrow(u) = k arrow(v) and k in RR
  $

  As $alpha = -gamma and beta = -lambda => alpha parallel gamma and beta parallel lambda$, $alpha$, $beta$, $gamma$, and $lambda$ form a parallelogram.

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
    &= u_1^2 - v^2_1 + u_2^2 - v_2^2 + dots + u_i^2 - v_i^2 = 0 #<3-zero-sum>
  $

  The above can be rearranged into @3-rearrange. By taking the square root of both sides, as in @3-sqrt, both sides of the equation are equal to the magnitude of each vector respectively; thus, $arrow(u) + arrow(v)$ and $arrow(u) - arrow(v)$ are orthogonal only if their magnitudes are equal.
  $
    u_1^2 + u_2^2 + dots + u_i^2 &= v^2_1 + v_2^2 + dots + v_i^2 #<3-rearrange> \
      sqrt(u_1^2 + u_2^2 + dots + u_i^2) &= sqrt(v^2_1 + v_2^2 + dots + v_i^2) #<3-sqrt>
  $

+ Suppose that $arrow(a) eq.not 0$.
  + (3 points) If $arrow(a) dot arrow(b) = arrow(a) dot arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?

    Let $arrow(a) = hat(i)$, $arrow(b) = hat(j)$, and $arrow(c) = hat(k)$.

    $
      &arrow(a) dot arrow(b) = arrow(a) dot arrow(c) = 0 and arrow(b) eq.not arrow(c) \
      &therefore arrow(a) dot arrow(b) = arrow(a) dot arrow(c) arrow.double.not arrow(b) = arrow(c) #<4a>
    $

  + (3 points) If $arrow(a) times arrow(b) = arrow(a) times arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?

    Let $arrow(a) = hat(i)$, $arrow(b) = cos(pi/3)hat(i) + sin(pi/3)hat(j)$, and $arrow(c) = cos((2pi)/3)hat(i) + sin((2pi)/3)hat(j)$.

    $
      &arrow(a) times arrow(b) = arrow(a) times arrow(c) = vec(0, 0, sqrt(3)/2) \
      &therefore arrow(a) times arrow(b) = arrow(a) times arrow(c) arrow.double.not arrow(b) = arrow(c)
    $

  + (2 points) If $arrow(a) dot arrow(b) = arrow(a) dot arrow(c)$ #underline[and] $arrow(a) times arrow(b) = arrow(a) times arrow(c)$, does it follow that $arrow(b) = arrow(c)$? Why or why not?

    The given equations can be rearranged into @4c-rearranged. For both equations to be true, either $arrow(a) = arrow(0)$ or $arrow(b) - arrow(c) = arrow(0)$. Since the former cannot be true, the latter must be true, indicating that $arrow(b)$ and $arrow(c)$ are equal as per @4c-solution.

    $
      arrow(a) dot arrow(b) - arrow(a) dot arrow(c) = 0 and arrow(a) times arrow(b) - arrow(a) times arrow(b) = arrow(0) \
      arrow(a) dot (arrow(b) - arrow(c)) = 0 and arrow(a) times (
          arrow(b) - arrow(c)
      ) = arrow(0) #<4c-rearranged> \
        therefore arrow(b) - arrow(c) = arrow(0) \
        therefore arrow(b) = arrow(c) #<4c-solution>
    $

+ Prove that if $arrow(a) dot (arrow(b) times arrow(c)) = 0$, then $arrow(a)$, $arrow(b)$, and $arrow(c)$ are coplanar.

  $
    arrow(u) dot arrow(v) = 0 arrow.double arrow(u) perp arrow(v) or arrow(u) = arrow(0) or arrow(v) = arrow(0)
  $

  Consider the two trivial cases where $arrow(a) = arrow(0) or arrow(b) times arrow(c) = 0$. In the former, $arrow(b)$ and $arrow(c)$ must be coplanar, since any two non-zero vectors can define a plane. In the latter, since $arrow(b)$ and $arrow(c)$ are parallel ($arrow(u) times arrow(v) = 0 arrow.double arrow(u) parallel arrow(v)$), they reside upon the same line; thus, along with $arrow(a)$, a plane can be defined.

  Now consider the non-trivial case where no vector equals $arrow(0)$. A plane can be defined by a normal vector $arrow(n)$ and an origin point $O$. All points $P$ in which a position vector $arrow(P)$ from the origin point $O$ to the point $P$ is orthogonal to the normal vector ($arrow(n) dot arrow(P) = 0$) is contained within the plane.

  By the definition of the cross product, $(arrow(b) times arrow(c)) perp arrow(b) and (arrow(b) times arrow(c)) perp arrow(c)$. Thus, $arrow(b) times arrow(c)$ defines a plane with origin point $(0, 0, 0)$ containing $arrow(b)$ and $arrow(c)$. Since $arrow(a) dot (arrow(b) times arrow(c)) = 0$, $arrow(a)$ is also contained within the plane, making all three vectors coplanar.

+ Prove the triangle inequality theorem for vectors: $|arrow(a) + arrow(b)| <= |arrow(a)| + |arrow(b)|$.

  Using algebraic substitution, the inequality theorem can be rearranged into @6-solution, which is true for all real values of $theta$.

  $
    norm(arrow(a) + arrow(b))^2 <= (norm(arrow(a)) + norm(arrow(b)))^2 \
    (arrow(a) + arrow(b)) dot (
      arrow(a) + arrow(b)
    ) <= norm(arrow(a))^2 + 2 norm(arrow(a)) norm(arrow(b)) + norm(arrow(b))^2 \
    norm(arrow(a))^2 + 2 (
      arrow(a) dot arrow(b)
    ) + norm(arrow(b))^2 <= norm(arrow(a))^2 + 2 norm(arrow(a)) norm(arrow(b)) + norm(arrow(b))^2 \
    2 norm(arrow(a)) norm(arrow(b)) cos(theta) <= 2 norm(arrow(a)) norm(arrow(b)) \
    cos(theta) <= 1 #<6-solution>
  $

+ If $arrow(A) = A_1 hat(i) + A_2 hat(j) + A_3 hat(k)$, $arrow(B) = B_1 hat(i) + B_2 hat(j) + B_3 hat(k)$, $arrow(C) = C_1 hat(i) + C_2 hat(j) + C_3 hat(k)$, prove that $arrow(A) dot (arrow(B) times arrow(C)) = (arrow(A) times arrow(B)) dot arrow(C)$.

  $arrow(u) dot (arrow(v) times arrow(w))$ defines the scalar triple product, which is equal to the determinant of the matrix formed by the three vectors' components.

  $
    arrow(u) dot (
      arrow(v) times arrow(w)
    ) = mat(delim: "|",
      u_1, v_1, w_1;
      u_2, v_2, w_2;
      u_3, v_3, w_3
    )
  $

  // Reference isn't processed directly after an opening parenthesis.
  Thus, finding the determinants of both expressions (#[@7-det-1] and @7-det-2) shows that they are equal (#[@7-solution]).

  $
    arrow(A) dot (
      arrow(B) times arrow(C)
    ) &= mat(delim: "|",
      A_1, B_1, C_1;
      A_2, B_2, C_2;
      A_3, B_3, C_3
      ) \
      &= A_1(B_2 C_3 - C_2 B_3) - B_1(A_2 C_3 - C_2 A_3) + C_1(A_2 B_3 - B_2 A_3) \
      // Would like to highlight matching terms, but unfortunately highlights within math are broken in the current version of the compiler.
      &= A_1 B_2 C_3 - A_1 C_2 B_3 - B_1 A_2 C_3 + B_1 C_2 A_3 + C_1 A_2 B_3 - C_1 B_2 A_3 #<7-det-1> \
    arrow(C) dot (
      arrow(A) times arrow(B)
    ) &= mat(delim: "|",
      C_1, A_1, B_1;
      C_2, A_2, B_2;
      C_3, A_3, B_3
    ) \
    &= C_1 (A_2 B_3 - B_2 A_3) - A_1 (C_2 B_3 - B_2 C_3) + B_1 (
      C_2 A_3 - A_2 C_3
    ) \
      &= C_1 A_2 B_3 - C_1 B_2 A_3 - A_1 C_2 B_3 + A_1 B_2 C_3 + B_1 C_2 A_3 - B_1 A_2 C_3 #<7-det-2> \
      &therefore arrow(A) dot (
        arrow(B) times arrow(C)
      ) = arrow(C) dot (
        arrow(A) times arrow(B)
      ) #<7-solution>
  $

= True or False
Prove that the given statement is true in $RR^3$ or provide a counterexample to show that it is false.
// True
8. Two lines parallel to a third line are parallel.

  Let the vectors $arrow(v)$ and $arrow(u)$ describe two lines. Two lines are parallel if their direction vectors are parallel. Two vectors are parallel if they are a scalar multiple of each other; thus, if their normalized components are equal or directly opposite one another.

  $
    arrow(v) parallel arrow(u) <=> 1 / norm(arrow(v)) arrow(v) = plus.minus 1 / norm(arrow(u)) arrow(u)
  $

  Let $arrow(b)$ and $arrow(c)$ describe two vectors parallel to vector $arrow(a)$. Via the transitive property, @8-transitive can be derived, showing that $arrow(b) parallel arrow(c)$.

  $
    1 / norm(arrow(b)) arrow(b) &= plus.minus 1 / norm(arrow(a)) arrow(a) \
    1 / norm(arrow(c)) arrow(c) &= plus.minus 1 / norm(arrow(a)) arrow(a) \
    1 / norm(arrow(b)) arrow(b) &= plus.minus 1 / norm(arrow(c)) arrow(c) #<8-transitive>
  $

// False
+ Two lines perpendicular to a third line are parallel.

  Two lines, described by $arrow(u)$ and $arrow(v)$, are perpendicular if and only if $arrow(u) dot arrow(v) = 0$. Thus, by @8-ik and @8-jk, the unit vectors $hat(i)$ and $hat(j)$ are both perpendicular to $hat(k)$. However, by @8-ij, $hat(i)$ and $hat(j)$ must also be perpendicular to each other, which means they cannot be parallel, disproving the statement by counterexample.
  $
    hat(i) dot hat(k) &= 0 #<8-ik> \
      hat(j) dot hat(k) &= 0 #<8-jk> \
      hat(i) dot hat(j) &= 0 #<8-ij>
  $

// False
+ Two planes perpendicular to a third plane are parallel.

  Two planes are perpendicular if their normal vectors are perpendicular. Two planes are parallel if their normal vectors are parallel. Two vectors are perpendicular if their dot product is zero ($arrow(a) dot arrow(b) = 0$). Two vectors are parallel if their cross product is zero ($arrow(a) times arrow(b) = 0$).

  Let $hat(i)$, $hat(j)$, and $hat(k)$ describe three planes.

  $
    hat(i) dot hat(j) = 0 => hat(i) perp hat(j) \
    hat(i) dot hat(k) = 0 => hat(i) perp hat(k) \
    hat(j) times hat(k) != arrow(0) => not hat(j) parallel hat(k)
  $

// False
+ Two lines parallel to a plane are parallel.

  A line can be defined by a direction vector $arrow(v)$ and origin point $p$. A plane can be defined by a normal vector $arrow(v)$ and origin point $p$. Let $overline(L)$ represent any line and $P$ represent any plane.

  $
    overline(L) parallel P <=> arrow(v)_L dot arrow(v)_P = 0 \
    overline(L_1) parallel overline(L_2) <=> exists k in RR : arrow(v)_L_1 = k arrow(v)_L_2 and k != 0
  $

  Let $hat(k)$ define a plane with origin point $(0, 0, 0)$. Let $hat(i)$ and $hat(j)$ define two lines with origin point $(0, 1, 0)$.

  $
    hat(k) dot hat(i) = 0 and hat(k) dot hat(j) = 0 => hat(k) parallel hat(i) and hat(k) parallel hat(j) \
    exists.not k in RR : hat(i) = k hat(j) => hat(i) parallel.not arrow(j) \
    therefore arrow(v)_"line"_1 parallel arrow(v)_"plane" and arrow(v)_"line"_2 parallel arrow(v)_"plane" arrow.double.not arrow(v)_"line"_1 parallel arrow(v)_"line"_2
  $

// True
+ Two lines perpendicular to a plane are parallel.

// False
+ Two planes parallel to a line are parallel.
