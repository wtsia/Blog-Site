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

### Triangles 
- Obtuse: Largest angle is >90$\degree$
- Acute: Largest angles are acute

### Thales' Theorem
- If points $A$ and $B$ are points on the diameter, then point $C$ on any point of the circle will form a right triangle between $A$ and $B$.

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