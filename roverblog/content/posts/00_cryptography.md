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
  - [Stream Cipher](#stream-cipher)

# Introduction

# Concepts
## Schneier's Law
Based on *Bruce Schneier*, 

>*"Anyone, from the most clueless amateur to the best cryptographer, can create an algorithm that he himself can’t break. It’s not even hard. What is hard is creating an algorithm that no one else can break, even after years of analysis. And the only way to prove that is to subject the algorithm to years of analysis by the best cryptographers around."* (1988)

Which is to say in Scheiner's own words, 
>*"Because anyone can design a security system that he cannot break, evaluating the security credentials of the designer is an essential aspect of evaluating the system’s security."*

## Kerckhoff's principle
A cryptosystem should be secure, even if everything about the system, except the key, is public knowledge.
>"The fewer and simpler the secrets that one must keep to ensure system security, the easier it is to maintain system security."

Six design rules for military ciphers:
1. The system must be practically, if not mathematically, indecipherable;
2. **It should not require secrecy, and it should not be a problem if it falls into enemy hands;**
3. It must be possible to communicate and remember the key without using written notes, and correspondents must be able to change or modify it at will;
4. It must be applicable to telegraph communications;
5. It must be portable, and not require several persons to handle/operate;
6. Given the circumstance of use, it should be easy to use and not be stressful to use, nor require a long list of rules for usage.

Note: some are not relevant due to computer's ability to perform encryption (likely $3$, $5$, or $6$). $2$. However is very important.

## Stream Cipher
