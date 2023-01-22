+++
author = "Winston Tsia"
authorlink = ""
title = "Arithmetic Proofs"
date = 2023-01-10T11:52:33-08:00
description = "Description"
tags = [
    "Mathematics"
]
categories = [
    "Arithmetic",
    "Proofs"
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

## Squared Numbers Equality Proof
Prove $\forall n,a\in\natnums$, 
$$
n^2 = (n+a)(n-a) + a^2 
$$ 
### Proof:
We can simply show the equalty holds true given some manipulation:
$$
(n+a)(n-a) + a^2
\\\\ = n^2 -an +an -a^2 + a^2
\\\\ = n^2
\\\\ \square
$$

## Karatsuba's Algorithm (Multiplication)
### Context
Kolmogorov's Conjecture: Any algorithm for multiplying two $N$-digit numbers requires of the order of $N^2$ steps.

### Karatsubas
