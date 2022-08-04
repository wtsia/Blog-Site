+++
author = "Winston Tsia"
authorlink = ""
title = "Trigonometry"
date = 2022-05-10T01:18:00-07:00
description = "Reviewing Trigonometry Concepts"
tags = [
    "Trigonometry",
    "Review"
]
categories = [
    "Math",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
images = ["/img/example.jpg"]
imagetext = "An example text for an image you could add!"
hidemeta = false
+++
### Arc
- 1 degree = 60 minutes of arc : 1$\degree$ = 60'
- 1 minute = 60 seconds of arc : 1' = 60''

## Triangles 
- Obtuse: Largest angle is >90$\degree$
- Acute: Largest angles are acute
- Congruent: Corresponding parts are congruent (CPCTC)
  - implies 3 angles and 3 sides are congruent
- Similar: Corresponding angles are congruent, and sides are proportional
  - implies 3 angles are congruend, but sides are not

### Thales' Theorem
- If points $A$ and $B$ are points on the diameter ofa circle, then point $C$ on any other point of the circle will form a right triangle between $A$,$B$, and $C$ s.t. they form a triangle $\triangle ABC$.

$Proof$: Construct an arbitrary circle such that there are two points $A$ and $B$ on the diameter iwth radius $r$. Add an arbitrary point $C$ to any other point of the diameter on the circle. Construct a triangle with angles at each point with $\angle$A, $\angle$B, and $\angle$C. Draw a line within this arbitrary triangle such that the line connects the center, to $C$, and subdivides the arbitrary triangle. The two resulting triangles will be one equilateral triangle with length of radius $r$, and an obtuse triangle also with radial sides $r$ and a length from $\overline{AC}$. label the angles in the equilateral triangle $\measuredangle\alpha$. Label the obtuse triangle such that the smaller angles are $\measuredangle\beta$. We can infer that the remaining angle is $\measuredangle\alpha$. Since the sum of the internal angles of every triangle is 180$\degree$, recall our arbitrary triangle will have internal measurements: 

$$
\angle A + \angle B + \angle C = 180\degree
$$

By equivalence, we can substitute the angles with the measurements of the smaller triangles within, such that:

$$
\alpha + \beta + (\alpha + \beta) = 180\degree
\\
2\alpha + 2\beta = 180\degree
\\
\alpha + \beta = 90\degree
$$

Recall that angle $\alpha + \beta$ is the same as $\angle C$, making the arbitrary triangle a right triangle. 

$\blacksquare Q.E.D.$

### Pythagoren Theorem
- For any right triangle with sides $a$, $b$, and hypotenuse $c$ : 
$$a^2 + b^2 = c^2$$

$Proof$: c, the hypotenuse, is given if we know the area of the bigger square, or:

$$c*c = c²$$

The area of the triangles are formed by finding the area of 4 of our original triangle, or:

$$4*(1/2)ab$$

What about that inner square? Well let’s consider what relations we can deduce, then we would be able to equate the area of a c² square with the parts that make it up. Well we know it’s just a square of (a - b) edge lengths, by looking at where the triangles touch each other, so it would have an area of:

$$(a - b)^2$$

The area of the entire square of c² is given by the area of the triangles and inner square, or:

$$
c^2 = 4*(1/2)ab + (a - b)^2 = 2ab + a^2 - 2ab + b^2
\\\
\rightarrow c^2 = a^2 + b^2 + 2ab - 2ab
\\\
\rightarrow c² = a² + b²
$$
$\blacksquare Q.E.D.$



