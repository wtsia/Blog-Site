+++
author = "Winston Tsia"
authorlink = ""
title = "Cryptography"
date = 2022-06-02T14:22:54-07:00
description = "Notes on topics in cryptography"
tags = [
    "Education"
]
categories = [
    "Computer Science",
    "Computational Mathematics",
    "Mathematics",
    "Cryptography",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
# Contents
- [Contents](#contents)
- [Introduction](#introduction)
- [Concepts](#concepts)
  - [Schneier's Law](#schneiers-law)
  - [Kerckhoff's principle](#kerckhoffs-principle)

# Introduction

# Concepts
## Schneier's Law
Based on *Bruce Schneier*, 

>*"Anyone, from the most clueless amateur to the best cryptographer, can create an algorithm that he himself can’t break. It’s not even hard. What is hard is creating an algorithm that no one else can break, even after years of analysis. And the only way to prove that is to subject the algorithm to years of analysis by the best cryptographers around."* (1988)

Which is to say in Scheiner's own words, 
>*"Because anyone can design a security system that he cannot break, evaluating the security credentials of the designer is an essential aspect of evaluating the system’s security."*

## Kerckhoff's principle
A cryptosystem should be secure, even if everything about the system, except the key, is public knowledge.

