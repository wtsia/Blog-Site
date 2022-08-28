+++
author = "Winston Tsia"
authorlink = ""
title = "Computational Methods: MATLAB"
date = 2022-08-17T15:31:42-07:00
description = "Notes on using MATLAB for scientific problems."
tags = [
    "Engineering",
    "Computational",
    "Education",
    "MATLAB"
]
categories = [
    "Engineering",
    "MATLAB",
]
math = true
notaxonomy = false
images = ["/img/example.jpg"]
imagetext = "An example text for an image you could add!"
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

SLO:
1. Use MATLAB as a *computational tool* to solve problems in engineering, mathematics, and the sciences.
2. Use MATLAB as a *plotting and visualization tool*.
3. Design, implement, and test computer programs to achieve stated objectives.
4. Begin to use standard data structures.
5. Working from a verbal or equation-based description, set up systems of simultaneous equations and use MATLAB to determine existence and uniqueness of solution and solve.
6. Working from a verbal or equation-based description, use appropriate numerical techniques for differentiation, integration, and solution of differential equations.
7. Apply numeric techniques and computer simulations to analyze and solve problems in engineering, mathematics, and the sciences.

Chapter 1: Background
- compiled languages vs interpreted
  - compiled require a programs code to be compiled before execution (specific to the processor)
  - interpreted means an interpreter (more applicable across systems) will read high-level statements and execute the operation so on and so forth
    - MATLAB is an interpreter!
  - *whitespace* is not interpreted in Matlab
  #### Common Commands:
  ```
  clc: clears command window
  clear: clears all vars
  diary: records command terminal content 
  exit: exits session
  who: prints all vars in workspace
  whos: ^^ but also prints size, bytes, class, etc
  ctrl-c: interrupts program
  ```
- `format long/short`: 15 digits and 4 digits respectively
- `format compact/loose`: single and double spacing

### Binary
- 0000, 0001, 0010...
- signed vs unsigned: 
  - unsigned represent non-negative values (1111 = 15)
  - signed uses leftmost bit to represent positive of negative
- Binary has an additive property:
```
    0 1 1 1
  + 0 1 1 0
  = 1 1 0 1
```
- overflow: when a binary operator is too large to fit in bits. i.e. 10000 > 1111 + 0001