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

#let proof(body) = box(height: 40%)[
  #body
]

#align(center)[
  _On my honor, I will not accept nor provide any unauthorized aid on this assignment._
]

= Proofs
+ Given an unknown point $P$, and known points $𝐴(3, 2, −1)$ and $𝐵(−3, −1, 5)$, if the distance from $P$ to $A$ is equal to twice the distance from $P$ to $B$. Prove that the set of all points defined by $A$, $𝐵$, and $P$ is a sphere. Find the center and the radius.

  #proof[]

+ If the midpoints of any two consecutive sides of any quadrilateral (in $RR^2$ or $RR^3$) are connected by straight lines, prove that the resulting quadrilateral is a parallelogram.

+ Prove that if $arrow(u) + arrow(v)$ and $arrow(u) - arrow(v)$ are orthogonal, then the vectors $arrow(u)$ and $arrow(v)$ must have the same magnitude.

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

+ Two planes perpendicular to a third plane are parallel.

+ Two lines parallel to a plane are parallel.

+ Two lines perpendicular to a plane are parallel.

+ Two planes parallel to a line are parallel.
