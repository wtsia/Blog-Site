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
## Angles
- Right angle is $90\degree$
- Complementary angles are two positive angles that add up to $90\degree$
- Supplementary angles are two positive angles that add up to $180\degree$
### Arc
- 1 degree = 60 minutes of arc : 1$\degree$ = 60'
- 1 minute = 60 seconds of arc : 1' = 60''
### Radian
- Radian ($\theta$): central angle $\theta$ that subtends (limits by both sides) an arc length $s$ (curved length) of one radius $r$
  - one 'radius' worth of angle
  - $s = \theta * r$
  - $360\degree = 2\pi$ $rad$
    - conversion implies: $1=\frac{360\degree}{2\pi rad}=\frac{180\degree}{\pi rad}=\frac{\pi rad}{180\degree}$
  - Recall: a circle's circumference is $\pi*d$ or $2\pi$ $rad$
## Triangles 
- Obtuse: Largest angle is >90$\degree$
- Acute: Largest angles are acute
- Congruent: Corresponding parts are congruent (CPCTC)
  - implies 3 angles and 3 sides are congruent
- Similar: Corresponding angles are congruent, and sides are proportional
  - implies 3 angles are congruent, but sides are not

### Thales' Theorem
- If points $A$ and $B$ are points on the diameter ofa circle, then point $C$ on any other point of the circle will form a right triangle between $A$,$B$, and $C$ s.t. they form a triangle $\triangle ABC$.

$Proof$: Construct an arbitrary circle such that there are two points $A$ and $B$ on the diameter with radius $r$. Add an arbitrary point $C$ to any other point of the diameter on the circle. Construct a triangle with angles at each point with $\angle$A, $\angle$B, and $\angle$C. Draw a line within this arbitrary triangle such that the line connects the center, to $C$, and subdivides the arbitrary triangle. The two resulting triangles will be one equilateral triangle with length of radius $r$, and an obtuse triangle also with radial sides $r$ and a length from $\overline{AC}$. label the angles in the equilateral triangle $\measuredangle\alpha$. Label the obtuse triangle such that the smaller angles are $\measuredangle\beta$. We can infer that the remaining angle is $\measuredangle\alpha$. Since the sum of the internal angles of every triangle is 180$\degree$, recall our arbitrary triangle will have internal measurements: 

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

### Pythagorean Theorem
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
c^2 = 4*(1/2)ab + (a - b)^2 
\\\ = 2ab + a^2 - 2ab + b^2
\\\ 
\rightarrow c^2 = a^2 + b^2 + 2ab - 2ab
\\\
\rightarrow c² = a² + b²
$$
$\blacksquare Q.E.D.$

### Application: Distance Between Two Points
For the distance between two points $c$ in 2 and 3-dimensional space: 
- 2D: $(x_1, x_1), (y_2,y_2)$
  $$c=\sqrt{(\Delta x)^2 + (\Delta y)^2}$$
- 3D: $(x_1,y_1,z_1), (x_2,y_2,z_2)$
  $$c=\sqrt{(\Delta x)^2 + (\Delta y)^2 + (\Delta z)^2}$$

### Trigonometric Ratios
- Sine ($sin$), Cosine ($cos$), Tangent ($tan$)
  - S O/H - C A/H - T O/A
- Cosecant ($csc$), Secant ($sec$), Cotangent ($cot$), are almost an anagram (reciprocals, or $1/f(\theta)$): 
  - A/O T ($coT$) - H/A C ($seC$) - H/O S ($cSc$)

### Trigonometric 'Functions'
- On a unit circle, the hypotenuse, or radius, is of 1 unit. This means for SOHCAHTOA:
$$
sin(\theta) = \frac{Opposite}{Hypotenuse} = \frac{Opposite}{1} = Opposite
\\\
cos(\theta) = \frac{Adjacent}{Hypotenuse} = \frac{Opposite}{1} = Adjacent
$$

#### Identities:
$tan^{-1}(x) = arctan(x)$

$cos^{-1}(x) = arc(x)$

$sin^{-1}(x) = arcsin(x)$

$sin^2(\theta) + cos^2(\theta) = 1$
- Apply the pythagorean theorem to a triangle in the unit circle. Notice that when we square non-hypotenuse sides, it equals to $c^2 = 1^2$ or $1$.

#### Values
- To obtain values of trig functions along the unit circle (or any circle) along the well known thirds, sixths, halves, and quarters of $\pi$, utilize the Large ($\frac{\sqrt{3}}{2}$), Medium ($\frac{\sqrt{2}}{2}$), and Small ($\frac{\sqrt{1}}{2}$) pneumonic.

#### Period
- Length of a functions cycle, typically peak to peak.

#### Length
- Test commit

### Identities
- $cos(A-B) = cos(A)cos(B) + sin(A)sin(B)$

  Proof: 
