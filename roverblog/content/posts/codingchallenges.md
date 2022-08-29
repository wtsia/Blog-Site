+++
author = "Winston Tsia"
authorlink = ""
title = "Coding Challenges"
date = 2022-08-28T14:32:17-07:00
description = "A documentation of my attempts at coding problems"
tags = [
    "Time Complexity",
    "Programming",
    "Math"
]
categories = [
    "Computer Science",
    "Programming",
    "Python"
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

Relevant References: [Neetcode](https://neetcode.io/)

## Definitions
Time Complexity (TC): Time complexity measures time taken to execute each statement of code in an algorithm. It is going to give information about the variation (increase or decrease) in execution time when the number of operations (increase or decrease) in an algorithm. Time complexity is a function of time data length $l$, where output is time $t$ or:
$$
f(l) = t
$$

or more commonly:
$$
O(x), x \in 1, n, n^2, \log n, n \log n, 2^n, n! ...
$$

A time-complexity analysis will require evaluating run time on each step of a program.
### Contains Duplicate

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

Example 1:
```
Input: nums = [1,2,3,1]
Output: true
```
Example 2:
```
Input: nums = [1,2,3,4]
Output: false
```
Example 3:
```
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
```
Constraints:
```
1 <= nums.length <= 10^5
-10^9 <= nums[i] <= 10^9
```
Design: 

**Solution 1)** *Brute force*: store each number in a variable and iterate through the array recursively and return `false` if the operation completes without returning `true`.

**Time Complexity (TC)**: each element in the array is stored and iterated through the other elements, so the complexity grows with the size of the entire array such that each operation on each $a_n \in array$ produces operations of array size $N*(N-1)$ since we cannot compare every $a_n \in array$ to itself. Therefore we can iterate through as such:

$$
n = 1  \to [a_0]
$$
array of $1$ cannot be a duplicate of itself, so no duplicates.

$$
n = 2  \to [a_0, a_1] \to
a_0
\begin{pmatrix}
   a_1
\end{pmatrix}
+ a_1
\begin{pmatrix}
   a_0
\end{pmatrix}\\

n = 3  \to [a_0, a_1, a_2] \to
a_0
\begin{pmatrix}
   a_1 \\
   a_2
\end{pmatrix}
+ a_1
\begin{pmatrix}
   a_0 \\
   a_2
\end{pmatrix}
+ a_2
\begin{pmatrix}
   a_0 \\
   a_1
\end{pmatrix}
$$
Continuing to an array of length `4`:
$$
n = 4  \to [a_0, a_1, a_2, a_3] \to
a_0
\begin{pmatrix}
   a_1 \\
   a_2 \\
   a_3
\end{pmatrix}
+ a_1
\begin{pmatrix}
   a_0 \\
   a_2 \\
   a_3
\end{pmatrix}
+ a_2
\begin{pmatrix}
   a_0 \\
   a_1 \\
   a_3
\end{pmatrix}
+a_3
\begin{pmatrix}
   a_0 \\
   a_1 \\
   a_2
\end{pmatrix}
$$
As we can see, the relationship between array length and operations applied can be seen as first storing the variable which costs 1 unit of time, then comparing the variable to other members of the array. We can represent this in a finite series:
$$
\sum_{i = 1}^{N}n^2 = 1 + 4 + 9 + 16 + ...
$$
$$

|array| * array[n] = n*n \rArr O(n^2)
$$

Sol 2) Divide: split the array into two and compare each number to each element of the other array. This reduces the size of the array approximately in half..

```
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
   
```
Solutions:
- Compare each number to the others. Time complexity of $O(n)$ while space complexity is $O(1)$.

```
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        hashset = set()
        
        for n in nums:
            if n in hashset:
                return True
            hashset.add(n)
        return False
```
> Breakdown: We can form a class Solution, with a function called `containsDuplicate` which takes self, and converts the numbers into a list of integers, and outputs a boolean value, i.e. true or false. By 


### Valid Anagram
Given two strings `s` and `t`, return true if `t` is an anagram of `s`, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
```
Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
```

```
Constraints:

1 <= s.length, t.length <= 5 * 104
s and t consist of lowercase English letters.
```

Design:

```
class Solution(object):
    def isAnagram(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        
```

Solution:
```
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        
        countS, countT = {}, {}
        
        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i], 0)
            countT[t[i]] = 1 + countT.get(t[i], 0)
        for c in countS:
            if countS[c] != countT.get(c, 0):
                return False
        return True
```