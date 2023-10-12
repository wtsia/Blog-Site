+++
author = "Winston Tsia"
authorlink = ""
title = "Design and Analysis of Algorithms"
description = "MIT 6.046J 2015"
tags = [
    "Algorithms"
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

MIT 6.046J Design and Analysis of Algorithms, Spring 2015 [here](http://ocw.mit.edu/6-046JS15)

# Contents
- [Contents](#contents)
- [Definitions](#definitions)
  - [Time Complexity (TC)](#time-complexity-tc)
  - [Space Complexity (SC)](#space-complexity-sc)
- [Algorithm Runtime Complexity](#algorithm-runtime-complexity)
  - [Constant Time $O(1)$](#constant-time-o1)
  - [](#)
  - [](#-1)
  - [](#-2)
      - [References: Differences between time complexity and space complexity?](#references-differences-between-time-complexity-and-space-complexity)
    - [MIT 6.046J Subtopic Overview:](#mit-6046j-subtopic-overview)
- [Design and Analysis of Algorithms, MIT 6.046J 2015](#design-and-analysis-of-algorithms-mit-6046j-2015)
  - [Notes Summary](#notes-summary)
        - [1. Course Overview, Interval Scheduling](#1-course-overview-interval-scheduling)
  - [1. Course Overview, Interval Scheduling](#1-course-overview-interval-scheduling-1)
    - [Theme of Lecture:](#theme-of-lecture)
    - [Weighted Interval Scheduling](#weighted-interval-scheduling)

# Definitions
## Time Complexity (TC)
Time complexity measures time taken to execute each statement of code in an algorithm. It is going to give information about the variation (increase or decrease) in execution time when the number of operations (increase or decrease) in an algorithm. Time complexity is a function of input length $l$, where output is time $t$ or:
$$
f(l) = t
$$

or more commonly:
$$
O(x), x \in 1, n, n^2, \log n, n \log n, 2^n, n! ...
$$

Where $O(x)$ denotes O-notation, or "Order" notation.

A time-complexity analysis will require evaluating run time on each step of a program.

> Time complexity deals with finding out how the computational time of an algorithm changes with the change in size of the input.

## Space Complexity (SC)
While Space Complexity may also be described by O-notation, they are unrelated and not dependent on each other. For example, an $O(1)$ space complexity denotes the same amount of space usage per input data of any size.

A program that uses a variable to swap values, while swapping multiple values for the variable, will still only use one variable.

> Space complexity deals with finding out how much (extra) space would be required by the algorithm with change in the input size.

# Algorithm Runtime Complexity
## Constant Time $O(1)$
Same time regardless of input size.

Generally constant operations
- Arithmetic of fixed size/floating point values
- Assignment of fixed size data value (reference, pointer)
- Comparison of two fixed values
- Read or write an arr element 

##

##

##


#### References: [Differences between time complexity and space complexity?](https://stackoverflow.com/questions/18686121/differences-between-time-complexity-and-space-complexity#:~:text=Time%20complexity%20deals%20with%20finding,change%20in%20the%20input%20size.)

### MIT 6.046J Subtopic Overview:
- Divide and Conquer
- Optimization: Greedy, Dynamic programming
- Network Flow
- Intractibility -- approximation
- Distributed Algorithmns Plan
- Cryptography



# Design and Analysis of Algorithms, MIT 6.046J 2015 
## Notes Summary
##### 1. Course Overview, Interval Scheduling
` P vs NP: class of problems solvable in polynomial time O(n^k) vs non-deterministic polynomial time, which is verifiable in poly. time.
` Claims:
    1. Greedy algorithm produces a list of intervals s.t. starts and finishes are chronological
    2. Given a list of Intervals L, greedy algorithms with earliest finish time produces k* intervals where k* is maximum
    - Conclusion: earliest finish time is mathematically the most optimal algorithm

## 1. Course Overview, Interval Scheduling

### Theme of Lecture:
- similar problems can have different complexity
- $P$: class of problems solvable in polynomial time $O(n^k)$ for some constant $k$. 
    - Shortest-path: $O(v^2)$, for $v = vertices$ in graph
- $NP$: Non-deterministic polynomial time. Class of probs. solution is verifiable in polynomial time.
    - Hamiltonian cycle: given a directed graph, find a simple cycle that contain each vertex in $V$
- $NP-complete$: problem is in $NP$ and is as hard as any problem in $NP$. 
- Given requests $1, 2, ..., i, j, ..., n,$ with $s(i)$ being start time, $f(i)$ finishing time, $s(i) < f(i)$
- Greedy Algorithm: a myopic algorithm that processes inputs one piece at a time. 
    - Greedy Interval Scheduling: use a simple rule to request $i$, reject incompatible to $i$, and repeat until process is done
        - $min(s(i))$? longest early segment... bad
        - $min(f(i) - s(i))$? smallest segment.. bad
- Claim 1: Greedy algo outputs a list of intervals $<s(i_1), f(i_1)>, ... s.t. s(i_1) < f(i_1) <= s(i_2) ...$
    - Proof: by contradiction. if finish of '$j$' is greater than start if '$j+1$', it contradicts step 2 of algo.
- Claim 2: Given list of intervals $L$, greedy algorithm with earliest finish time produces $k^*$ intervals where $k^*$ is optimal
    - Proof: Induction on $k^*$. $k^*=1$, then suppose it holds true for $k^*$, apply inductive step for $k^* + 1$ intervals.
        $$S*[1, 2, ..., k* + 1] = <s(j_1), f(j_1)>, ..., <s(j_(k*+1)), f(j_(k*+1))>$$
    Say for some generic $k$, 
        $$S[1, 2, ..., k] = <s(i_1), f(i_1)>, ..., <s(i_k), f(i_k)>$$
    By construction we know $f(i_1) <= f(j_1)$ since algo picks earliest finish time. Construct schedule 
        $$S^{**} = <s(i_1), f(i_1)>, <s(j_1), f(j_1)>, ..., <s(j_k*+1), f(j_k*+1)>$$
    Then $S^{**}$ is optimal due to being length $k^* + 1$. Define $L'$ s.t. $s(i) >= f(i_1)$. Since $S^{**}$ is optimal for $L$, $S^{**}[2, 3, ..., k* + 1]$ is optimal for $L'$, implying optimal schedule for $L'$ has $k*$ size. Hence, $k - 1 = k*$, implying $S[1, ..., k]$ is optimal.

### Weighted Interval Scheduling
- Each request $i$ has weight $w(i)$. Schedule subset of requests that are non-overlapping with maximum weight.
    - A key observation here is that the greedy algorithm no longer works.