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
  - [Upper Bound, Lower Bound](#upper-bound-lower-bound)
  - [Search](#search)
    - [Binary Search](#binary-search)
    - [Depth First Search:](#depth-first-search)
    - [Breadth First Search:](#breadth-first-search)
  - [Sort](#sort)
    - [Selection Sort](#selection-sort)
    - [Insertion Sort](#insertion-sort)
    - [Shell Sort](#shell-sort)
    - [Quicksort](#quicksort)
    - [Merge sort:](#merge-sort)
    - [Radix Sort](#radix-sort)
    - [Topological Sort](#topological-sort)
  - [Data Structures](#data-structures)
    - [Binary tree](#binary-tree)
    - [Heap:](#heap)
    - [Edges and Vertices](#edges-and-vertices)
      - [Hash Map](#hash-map)
      - [References: Differences between time complexity and space complexity?](#references-differences-between-time-complexity-and-space-complexity)
- [Notable Algorithms](#notable-algorithms)
  - [Dijkstra's Algorithm](#dijkstras-algorithm)
    - [MIT 6.046J Subtopic Overview:](#mit-6046j-subtopic-overview)
- [Design and Analysis of Algorithms, MIT 6.046J 2015](#design-and-analysis-of-algorithms-mit-6046j-2015)
  - [Notes Summary](#notes-summary)
  - [Amortized Analysis](#amortized-analysis)
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

## Upper Bound, Lower Bound
Analyzing upper and lower bounds render insights into algorithm performance.

| Notation    | Description                                          |
|------------|------------------------------------------------------|
| O notation | Provides a growth rate for an algorithm's upper bound. |
| Ω notation | Provides a growth rate for an algorithm's lower bound. |
| Θ notation | Provides a growth rate that is both an upper and lower bound. |

## Search
### Binary Search
- Check middle element and search from middle element going left or right, similar to math approximation algorithm when finding root values.

### Depth First Search: 
iterates vertically through first branch to the end, then the other leaf nodes
- Stack: a collection that supports push (add to end) and pop (remove from end)
    - Last in First Out
    - Recursion
        - if Recursion exceeds amount of depth, you get stack overflow

### Breadth First Search: 
iterates through horizontal branches and progresses downward
- Queue: First in First Out


## Sort

### Selection Sort
A sorting algorithm that treats the input as two parts, a sorted part and an unsorted part, and repeatedly selects the proper next value to move from the unsorted part to the end of the sorted part.
  - $O(n^2)$
    
### Insertion Sort
is a sorting algorithm that treats the input as two parts, a sorted part and an unsorted part, and repeatedly inserts the next value from the unsorted part into the correct location in the sorted part.

The algorithm iterates over the data like so:
$$
N + (N-1) + (N-1) + ... + 2
= N(N+1)/2 - 2 
\\ = 1/2(N^2 + N) - 2
$$
- The time complexity reduces to $O(n^2)$


### Shell Sort
A sorting algorithm that treats the input as a collection of interleaved lists, and sorts each list individually with a variant of the insertion sort algorithm. Shell sort uses gap values to determine the number of interleaved lists. A gap value is a positive integer representing the distance between elements in an interleaved list. For each interleaved list, if an element is at index i, the next element is at index i + gap value.
```
mainArray = [ 79, 13, 91, 67, 65, 98 ];
gapArray = [ 3, 2, 1 ];

Shell sort of the original array with a gap value of 3 sorts 3 interleaved arrays:
[ 79, 67 ] -> [ 67, 79 ]
[ 13, 65 ] -> [ 13, 65 ]
[ 91, 98 ] -> [ 91, 98 ]
Resulting array: [ 67, 13, 91, 79, 65, 98 ]

Shell sort of the resulting array with a gap value of 2 sorts 2 interleaved arrays:
[ 67, 91, 65 ] -> [ 65, 67, 91 ]
[ 13, 79, 98 ] -> [ 13, 79, 98 ]
Resulting array: [ 65, 13, 67, 79, 91, 98 ]

Shell sort of the resulting array with a gap value of 1 is a regular insertion sort and gives the sorted array: [ 13, 65, 67, 79, 91, 98 ]
```

Shell sort begins by choosing a gap value K and sorting K interleaved lists in place. Shell sort finishes by performing a standard insertion sort on the entire array. Because the interleaved parts have already been sorted, smaller elements will be close to the array's beginning and larger elements towards the end. Insertion sort can then quickly sort the nearly-sorted array.

Any positive integer gap value can be chosen. In the case that the array size is not evenly divisible by the gap value, some interleaved lists will have fewer items than others.

The algorithm iterates over the data like so:
$$

$$

### Quicksort
A sorting algorithm that repeatedly partitions the input into low and high parts (each part unsorted), and then recursively sorts each of those parts. To partition the input, quicksort chooses a pivot to divide the data into low and high parts. The pivot can be any value within the array being sorted, commonly the value of the middle array element. Ex: For the list (4, 34, 10, 25, 1), the middle element is located at index 2 (the middle of indices [0, 4]) and has a value of 10.

Once the pivot is chosen, the quicksort algorithm divides the array into two parts, referred to as the low partition and the high partition. All values in the low partition are less than or equal to the pivot value. All values in the high partition are greater than or equal to the pivot value. The values in each partition are not necessarily sorted. Ex: Partitioning (4, 34, 10, 25, 1) with a pivot value of 10 results in a low partition of (4, 1, 10) and a high partition of (25, 34). Values equal to the pivot may appear in either or both of the partitions.

### Merge sort: 
A sorting algorithm that divides a list into two halves, recursively sorts each half, and then merges the sorted halves to produce a sorted list. The recursive partitioning continues until a list of 1 element is reached, as a list of 1 element is already sorted

- splits collection into subcollections that can be sorted in constant time
- merge $log(n)$ sublists
- cost of merging 2 sorted lists $O(n)$
- merge sort runs $n*log(n) = O(n\ log(n))$

- `array`: continuous memory space
- `linked list`: packed data into nodes that point to another node, null is end of the list
    - appending to dynamically sized array costs $O(1)$ average time complexity

### Radix Sort
Radix sort is a sorting algorithm designed specifically for integers. The algorithm makes use of a concept called buckets and is a type of bucket sort.

Any array of integer values can be subdivided into buckets by using the integer values' digits. A bucket is a collection of integer values that all share a particular digit value. Ex: Values 57, 97, 77, and 17 all have a 7 as the 1's digit, and would all be placed into bucket 7 when subdividing by the 1's digit.

### Topological Sort

## Data Structures

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

### Edges and Vertices
- Edges are relationships between vertices
- ex. Google Maps
    - vertices of 3 places, where distance between a home node to a destination is 8 (home to secondary) + 8 (secondary to destination) on one end and a direct edge of 20 (home to destination) on the other
        - BFS gives shortest path by vertices, not by weight (length), so use Dijkstra's Algorithm

#### Hash Map
- Data structure built on top of an array optimized to store key-value pairs
- Can retrieve delete and store data in $O(1)$ (but not strictly)
- Hash function: takes key and returns hash code
    - given same key, should return same hash code
    - ex. dict (python), or object (js)


#### References: [Differences between time complexity and space complexity?](https://stackoverflow.com/questions/18686121/differences-between-time-complexity-and-space-complexity#:~:text=Time%20complexity%20deals%20with%20finding,change%20in%20the%20input%20size.)

# Notable Algorithms
## Dijkstra's Algorithm
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
   

### MIT 6.046J Subtopic Overview:
- Divide and Conquer
- Optimization: Greedy, Dynamic programming
- Network Flow
- Intractibility -- approximation
- Distributed Algorithmns Plan
- Cryptography



# Design and Analysis of Algorithms, MIT 6.046J 2015 
## Notes Summary

## Amortized Analysis
In computer science and algorithms, amortized analysis is a technique used to estimate the average time complexity of an algorithm over a sequence of operations, rather than the worst-case complexity of individual operations

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