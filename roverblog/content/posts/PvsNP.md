+++
author = "Winston Tsia"
authorlink = ""
title = "P vs NP"
description = "P, NP, and NP-completeness"
tags = [
    "Concept"
]
categories = [
    "Computer Science"
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = true
+++

# Understanding P vs NP, and NP-completeness

### Introduction
$P$ vs $NP$ concerns the question of how an algorithm used on a problem ($P$, polynomial time) that can find a solution, relates in some way to problems that, while hard for an algorithm to find an answer in $P$-time, can be quickly checked ($NP$, nondeterministic polynomial time)

#### VISUALS:
$-Difficulty \to$

$|(\to P \to)\to NP \to||\to NP-hard \to|$

#### P: Polynomial time
- size $n$ problems, in polynomial times of $n*O(1)$.

#### NP: Nondeterministic polynomial time
- nondeterministic: can guess one out of polynomially many options in constant $O(1)$ time.
- {decision problems with poly-size certificates and poly-time verifiers for YES inputs}
- decision problems, resulting in YES or NO.
- if guess leads to YES, then we get such a guess.

#### NP-Complete
- $X$ is $NP$-complete: if every x in NP and x in NP-hard (exactly as hard as everything in NP)
- $X$ is $NP$-hard: if every problem y in NP reduces to X (at least as hard as everything in NP)
Reduction: from problem A --> problem B = poly-time algorithm converting A inputs --> equivalent (same YES/NO answer) B inputs.
- if $B$ in $P$, then $A$ in $P$
- if $B$ in $NP$, then $A$ in $NP$

Common thought: $P \neq NP$

###### EXAMPLE
3SAT: Given Boolean formula of form: $$(x_1 \lor x_2 \lor \neg x_6) \land (\neg x_2 \lor x_3 \lor \neg x_7) \land ...$$

can you set the variables (satisfying assignment): $$x_1, x_2, ... \to {T, F}$$ such that formula = $T$? 

Note: in $NP$: guess $x_1 = T$ or $F$, $x_2 = T$ or $F$, $...$ check formula $\to T$ : return YES, F: return NO

- guesses up front and checking later, this can be a verification algorithm.
- explanation: gives you guesses $x_i$, you can quickly check each assignment.
- 1970's Cooke, proved 3SAT is $NP$ complete, could reduce any $NP$ prob to 3SAT

#### How to prove X is NP-complete
1. $X$ in $NP$
    - nondeterminisitc algorithm
    - certificate + verifier
2. reduce from known $NP$-complete problem $Y$ to $X$