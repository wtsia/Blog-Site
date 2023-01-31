+++
author = "Winston Tsia"
authorlink = ""
title = "Computer Science Notes"
date = 2022-08-28T16:52:54-07:00
description = "Notes on Data Structures, Algorithms, and other broad topics in computer science"
tags = [
    "Data Structures",
    "Algorithms"
]
categories = [
    "Computer Science",
    "Education"
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

![Replacement Text](/rover/img/ComputerScience/rubik.jpg)

# Contents
- [Contents](#contents)
- [Basics](#basics)
  - [Bits/Bytes](#bitsbytes)
- [Complexity](#complexity)
  - [Time Complexity (TC)](#time-complexity-tc)
  - [Space Complexity (SC)](#space-complexity-sc)
- [Data Structures and Algorithms](#data-structures-and-algorithms)
  - [Dynamic Programming \& Memoization](#dynamic-programming--memoization)
  - [Algorithm Efficiency: Big $O/\\Omega$-Notation](#algorithm-efficiency-big-oomega-notation)
    - [O-notation](#o-notation)
    - [$\\Omega$-notation](#omega-notation)
  - [Algorithms](#algorithms)
    - [Binary Search](#binary-search)
    - [Selection Sort](#selection-sort)
    - [Merge sort:](#merge-sort)
    - [Binary tree](#binary-tree)
    - [Heap:](#heap)
    - [Depth First Search:](#depth-first-search)
    - [Breadth First Search:](#breadth-first-search)
    - [Edges and Vertices](#edges-and-vertices)
    - [Dijkstra's Algorithm](#dijkstras-algorithm)
    - [Topological Sort](#topological-sort)
    - [Hash Map](#hash-map)
# Basics
## Bits/Bytes
- 0s and 1s are known as bits--binary digits

# Complexity
## Time Complexity (TC)
Time complexity measures time taken to execute each statement of code in an algorithm. It is going to give information about the variation (increase or decrease) in execution time when the number of operations (increase or decrease) in an algorithm. Time complexity is a function of input length $l$, where output is time $t$ or:
$$
f(l) = t
$$

or more commonly:
$$
O(x), x \in 1, n, n^2, \log n, n \log n, 2^n, n! ...
$$

Where $O(x)$ denotes O-notation, or "Order" notation. See [Algorithm Efficiency](#algorithm-efficiency-big-o-notation).

A time-complexity analysis will require evaluating run time on each step of a program.

> Time complexity deals with finding out how the computational time of an algorithm changes with the change in size of the input.

## Space Complexity (SC)
While Space Complexity may also be described by O-notation, they are unrelated and not dependent on each other. For example, an $O(1)$ space complexity denotes the same amount of space usage per input data of any size.

A program that uses a variable to swap values, while swapping multiple values for the variable, will still only use one variable.

> Space complexity deals with finding out how much (extra) space would be required by the algorithm with change in the input size.

References: [Differences between time complexity and space complexity?](https://stackoverflow.com/questions/18686121/differences-between-time-complexity-and-space-complexity#:~:text=Time%20complexity%20deals%20with%20finding,change%20in%20the%20input%20size.)

# Data Structures and Algorithms

## Dynamic Programming & Memoization
A way of making algorithms more efficient by storing the intermediary results.
- Memoization: In computing, memoization or memoisation is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again

Examples: 
- `fib(n)`

## Algorithm Efficiency: Big $O/\Omega$-Notation
- Space complexity: relationship between growth of input size and growth of space needed

### O-notation
Ranked closeness from Elements to Operations (Also good to bad)

$O(1)$, $O(log n)$, $O(n)$, $O(n log n)$, $O(n^2)$, $O(2^n)$, $O(n!)$
- denotes **maximum** bound for runtime.
### $\Omega$-notation
$\Omega (n)$
- denotes **minimum** bound for runtime. 


## Algorithms
### Binary Search
- Check middle element and search from middle element, similar to math approximation algorithm when finding root values.

### Selection Sort
- Linear scan $O(n^2)$
    
### Merge sort: 
- splits collection into subcollections that can be sorted in constant time
- merge $log(n)$ sublists
- cost of merging 2 sorted lists $O(n)$
- merge sort runs $n*log(n) = O(n log(n))$

- `array`: continuous memory space
- `linked list`: packed data into nodes that point to another node, null is end of the list
    - appending to dynamically sized array costs $O(1)$ average time complexity

### Binary tree
- node with no children is called leaf node
- Binary Search Tree: Value of the key of the left sub-tree is less than the value of its parent node's key, while right is greater or equal to the value of parent's (root) node key
    - $O(H)$ where H is height of the tree, for operations of search, insert, and delete
    - Red/Black trees: maintain features to accomplish $O(log(n))$
### Heap: 
A tree based data structure where parent nodes have >= priority as children nodes
- Priority Queue: abstract data type where elements have priority and higher priority elements are served first (common in heap)
- Min heap, max heap
- Heap Insertion/Deletion costs $O(log(n))$
- Retrieving highest priority costs $O(1)$
- building heap costs $O(n)$
### Depth First Search: 
iterates vertically through first branch to the end, then the other leaf nodes
- Stack: a collection that supports push (add to end) and pop (remove from end)
    - Last in First Out
    - Recursion
        - if Recursion exceeds amount of depth, you get stack overflow
### Breadth First Search: 
iterates through horizontal branches and progresses downward
- Queue: First in First Out
### Edges and Vertices
- Edges are relationships between vertices
- ex. Google Maps
    - vertices of 3 places, where distance between a home node to a destination is 8 (home to secondary) + 8 (secondary to destination) on one end and a direct edge of 20 (home to destination) on the other
        - BFS gives shortest path by vertices, not by weight (length), so use Dijkstra's Algorithm
### Dijkstra's Algorithm
- [Computerphile - Dijikstra's Algorithm](https://www.youtube.com/watch?v=GazC3A4OQTE)
- A path-finding algorithm, useful for routing
- Analogy: Roads
    - Smaller = better
    - How do you find a route from point A to B? (S to E)
    - How do you know this route is the shortest path?
- Analogous to brute-forcing, storing paths in priority queue where shortest path to a specific node is pushed up a queue
    
    1. let initial node be 0, and distance of unvisited nodes in some unvisited set be infinity
    2. tentative distance is length of the shortest path discovered so far between generic node and starting node
        - set initial node as current
    3. On current node, visit unvisited neighboring nodes to current and calculate tentative distance through current.
        - assign smallest tentative distance to currently assigned value for current
    4. after considering unvisited nodes, mark current nodes, remove from unvisited set
    5. if destination has been visited, or smallest tentative distance among unvisited nodes is infinity, return finished.
    6. else select unvisited node that is marked with smallest tentative distance and set it as new current node, return to step 3.

### Topological Sort
### Hash Map
- Data structure built on top of an array optimized to store key-value pairs
- Can retrieve delete and store data in $O(1)$ (but not strictly)
- Hash function: takes key and returns hash code
    - given same key, should return same hash code
    - ex. dict (python), or object (js)