+++
author = "Winston Tsia"
authorlink = ""
title = "General Overview"
description = "A page of general Software Engineering concepts"
tags = [
    "Overview"
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

# CS-notes

## Topics:

MIT 6.046J Design and Analysis of Algorithms, Spring 2015 ![here](http://ocw.mit.edu/6-046JS15)

### [MIT 6.046J Subtopic Overview:](DesignAndAnalysisOfAlgorithms.md)
- Divide and Conquer
- Optimization: Greedy, Dynamic programming
- Network Flow
- Intractibility -- approximation
- Distributed Algorithmns Plan
- Cryptography

#### [P vs NP](PvsNP.md)

#### [Divide And Conquer](DivideAndConquer.md)

### System Design:
#### [Scalability](Scalability.md)
#### [Networking](Networks.md)

## Broad Notes

### Data Structures and Algorithms

#### Dynamic Programming & Memoization
A way of making algorithms more efficient by storing the intermediary results.
- Memoization: In computing, memoization or memoisation is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again

Examples: 
- fib(n)

#### Algorithm efficiency: Big O notation
Ranked closeness from Elements to Operations (Also good to bad)

O(1), O(log n), O(n), O(n log n), O(n^2), O(2^n), O(n!)

- Space complexity: relationship between growth of input size and growth of space needed

##### Binary Search ()
- Check middle element and search from middle element, similar to math approximation algorithm when finding root values.

##### Selection Sort
- Linear scan O(n^2)
    
##### Merge sort: 
- splits collection into subcollections that can be sorted in constant time
- merge log(n) sublists
- cost of merging 2 sorted lists O(n)
- merge sort runs n*log(n) = O(n log(n))

- array: continuous memory space
- linked list: packed data into nodes that point to another node, null is end of the list
    - apprending to dynamically sized array costs O(1) average time complexity

##### Binary tree
- node with no children is called leaf node
- Binary Search Tree: Value of the key of the left sub-tree is less than the value of its parent node's key, while right is greater or equal to the value of parent's (root) node key
    - O(H) where H is height of the tree, for operations of search, insert, and delete
    - Red/Black trees: maintain features to accomplish O(log(n))
##### Heap: A tree based data structure where parent nodes have >= priority as children nodes
- Priority Queue: abstract data type where elements have priority and higher priority elements are served first (common in heap)
- Min heap, max heap
- Heap Insertion/Deletion costs O(log(n))
- Retrieving highest priority costs O(1)
- building heap costs O(n)
##### Depth First Search: iterates vertically through first branch to the end, then the other leaf nodes
- Stack: a collection that supports push (add to end) and pop (remove from end)
    - Last in First Out
    - Recursion
        - if Recursion exceeds amount of depth, you get stack overflow
##### Breadth First Search: iterates through horizontal branches and progresses downward
- Queue: First in First Out
##### Edges and Vertices
- Edges are relationships between vertices
- ex. Google Maps
    - vertices of 3 places, where distance between a home node to a destination is 8 (home to secondary) + 8 (secondary to destination) on one end and a direct edge of 20 (home to destination) on the other
        - BFS gives shortest path by vertices, not by weight (length), so use Dijkstra's Algorithm
##### Dijkstra's Algorithm
- ![Computerphile - Dijikstra's Algorithm](https://www.youtube.com/watch?v=GazC3A4OQTE)
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

##### Topological Sort
##### Hash Map
- Data structure built on top of an array optimized to store key-value pairs
- Can retrieve delete and store data in O(1) (but not strictly)
- Hash function: takes key and returns hash code
    - given same key, should return same hash code
    - ex. dict (python), or object (js)

## Other Topics:
### Math 

### Economics

#### [Nash Equilibrium](otherTopics/economics/Nash-Equilibrium.md)