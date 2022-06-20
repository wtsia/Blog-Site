+++
author = "Winston Tsia"
authorlink = ""
title = "Algorithm Questions"
date = 2022-06-08T17:41:44-07:00
description = "Compiled Algorithm Questions"
tags = [
    "Interview",
    "Programming",
    "Python",
]
categories = [
    "Interview Prep",
    "Algorithms",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

Source: [Neetcode](https://neetcode.io/)

All solutions will done in Python3.

## Contains Duplicates
Difficulty: **Easy**

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
$$
1 <= nums.length <= 105
-109 <= nums[i] <= 109
$$

Solutions:
- Compare each number to the others. Time complexity of O(n) while space complexity is O(1)

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

## Valid Anagram
Difficulty: Easy

Given two strings s and t, return true if t is an anagram of s, and false otherwise.

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

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 

##
Difficulty: 