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
  - [RSA: Rivest Shamir Adleman](#rsa-rivest-shamir-adleman)
    - [**Encryption + Decryption**](#encryption--decryption)
  - [Shor's Algorithm](#shors-algorithm)
  - [Euclidean Algorithm](#euclidean-algorithm)
  - [Diffie-Hellman](#diffie-hellman)
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

## RSA: Rivest Shamir Adleman
An asymmetric key exchange that utilizes prime factors.

Concepts behind RSA:
- **Factors**: The divisible components of a number s.t. $p,q \in \mathbb{Z}$, $S = (p*q)$, $p,q$ are factors
- **Prime** ( $\mathbb{P}$ ): 
$$p \in \mathbb{N}, p > 1$$
- **Semi-Prime**: 
$p*q$ for $p, q \in \mathbb{P}$
- **Modular Arithmetic**: For $R =$ Remainder, $a = p ($ mod $q)=R\{\frac{p}{q}\}$
- **Totient** ( $T$ ): For some $p,q \in \mathbb{P}$, the totient is $(p-1)*(q-1)$

For $a, b \in \mathbb{P}$, Let $S_0 = a*b$, and $S_1 = (a-1)*(b-1)$. We may generated our public and private key adhereing to the following conditions for some keys $K_0, K_1$.

**Public Key $=K_0$**
- $K_0 \in \mathbb{P}$
- $K_0 < T$
- $\forall n \in \mathbb{Z}, (K_0*n) \neq T$
   
**Private Key $=K_1$**
- $(K_0*K_1) ($mod $T) = 1$

### **Encryption + Decryption**
For N = Product, M = message and C = cipher:

$$M^{K_0} (mod N) = C$$
$$C^{K_1} (mod N)= M$$

The Public and Private keys are commutative and may be used to interchangeably be the encryption or decryption method.
## Shor's Algorithm


## Euclidean Algorithm
Technique to find the GCD of two integers

The Euclidean Algorithm for finding $GCD(A,B)$ is as follows:
- If $A = 0$ then $GCD(A,B)=B$, since the $GCD(0,B)=B$, and we can stop.  
- If $B = 0$ then $GCD(A,B)=A$, since the $GCD(A,0)=A$, and we can stop.  
- Write $A$ in quotient remainder form $(A = B⋅Q + R)$
- Find $GCD(B,R)$ using the Euclidean Algorithm since $GCD(A,B) = GCD(B,R)$

Example:
$$
GCD(270, 192) \\ 
\rArr 270 = 192 * 1 +78 \\ 
\rArr GCD(270,192)=GCD(192,78)
$$
## Diffie-Hellman

## Stream Cipher
