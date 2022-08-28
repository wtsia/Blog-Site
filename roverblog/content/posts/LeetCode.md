+++
author = "Winston Tsia"
authorlink = ""
title = "LeetCode"
date = 2022-08-28T14:32:17-07:00
description = "Description"
tags = [
    "tag1",
    "tag2",
]
categories = [
    "cat1",
    "cat2",
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

### Contains Duplicate

Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

Example 1:
```
Input: nums = [1,2,3,1]
Output: true
```
Constraints:
```
1 <= nums.length <= 10^5
-10^9 <= nums[i] <= 10^9
```
Design: 
- Sol 1) Brute force: store each number in a variable and iterate through the array recursively and return `false` if the operation completes without returning `true`.
  - Time Complexity (TC): each element in the array is stored and iterated through the other elements, so the complexity grows with the size of the entire array such that each operation on $n \in array$ produces operations of array size $N = array.length$. Therefore we can see that the operations will result in $n*array.length, \forall n\in array$ .
$$
\sum_{i = 1}^{N}n^2 = 1 + 4 + 9 + 16 + ...
$$
$$

|array| * array[n] = n*n \rArr O(n^2)
$$
- Sol 2) Divide: split the array into two and compare each number to each element of the other array. This reduces the size of the array approximately in half, 
  - TC:

```
class Solution(object):
    def containsDuplicate(self, nums):
        """
        :type nums: List[int]
        :rtype: bool
        """
   
```

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