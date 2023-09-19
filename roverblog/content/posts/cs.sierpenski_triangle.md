+++
author = "Winston Tsia"
authorlink = ""
title = "Computer_science.sierpenski_triangle"
date = 2023-09-16T19:47:08-07:00
description = "Notes on Computer_science.sierpenski_triangle"
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
images = ["/img/<folder>/example.jpg"]
imagetext = "An example text for an image you could add!"
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

# Contents
- [Contents](#contents)
- [Sierpenski Triangle](#sierpenski-triangle)
  - [Introduction](#introduction)
  - [Design](#design)
    - [As `char[]` Array](#as-char-array)
    - [As Two-Dimensional `char[][]` Array](#as-two-dimensional-char-array)

# Sierpenski Triangle
## Introduction
A Sierpenski Triangle is a fractal-pattern shape, that is constructed using the following process indefinitely:

1. Start with an equilateral triangle facing upwards.
2. Connect the midpoints of the triangle's sides, forming 4 smaller equilateral triangles inside.
3. The triangle in the center is removed (leaving a hole).
4. Repeat the above steps recursively for the three remaining triangles.
5. Continue this process for a predetermined number of iterations.

Sample Output:
```
               * 
              * * 
             *   * 
            * * * * 
           *       * 
          * *     * * 
         *   *   *   * 
        * * * * * * * * 
       *               * 
      * *             * * 
     *   *           *   * 
    * * * *         * * * * 
   *       *       *       * 
  * *     * *     * *     * * 
 *   *   *   *   *   *   *   * 
* * * * * * * * * * * * * * * *
```

## Design
Consider some equilateral triangle represented using asterisks (`*`), for example, for side length 4:
```
   *
  ***
 *****
*******
```
We may deconstruct the shape above, as well as any equilateral triangle of similar construction, into multiple ways. For example, a single character array such that it forms an array of asterisks:

```
char[] traingle = [*,*,*,...,*]
```
or a double character array like so:

```
char[][] triangle ] [
    [*],
    [*, *, *],
    ...
    [*, *, *, ..., *],
]
```

Both yield interesting solutions to constructing our Sierpenski Triangle, detailed below. 

### As `char[]` Array
The first `char` array in essence, mirrors the construction of a fractal pattern like the Cantor Set, where the middle third of a length is removed. The Cantor Set functions like so,

For $n$ depth, we construct a line and remove the middle third:

```
_______________________ n = 0
_________     _________ n = 1
___   ___     ___   ___ n = 2
_ _   _ _     _ _   _ _ n = 3
...                     n = N
```

Similarly, for $n$ depth, our char array for a Sierpinski Triangle will have some length of points removed within the line. Because of the nature of the problem, we are dealing with a *discrete* line, of which we have to figure out what portion of the length is removed, and being able to discern the pattern of removal. 

However, a unique quirk of the problem is that the removal will have to be spaced, as to print an upside-down triangle within a triangle, each line removed gets smaller as the triangle tends to the end of the `char` array. For example, a 4 sided triangle:
```
   *
  ***
 ******
********
```
with its center removed, 
```
   *
  ***
 *   *
*** ***
```
and deconstructed, when printed from left to right, becomes:
```
char[] thisArray = [
    '*','*','*','*','*',' ',' ',' ','*','*','*','*',' ','*','*','*'
    ]
```

Example (`depth = 0, 1, 2`)
```
// depth = 0
       *
      ***
     *****
    *******
   *********
  ***********
 *************
***************

// depth = 1
       *
      ***
     *****
    *******
   *       *
  ***     ***
 *****   *****
******* *******

=> spaces as 0 =>

*****************0000000****00000********000************0*******
|_______________||_____||__||___||______||_||__________|||_____|
        16          7    4    5      8    3      12     1   7
```

Noticeably, the asterisks and spaces follow a pattern like so:

$$
'*' = \{16, 4, 8, 12, 7\}
\\\\
'\ \ ' = \{7, 5, 3, 1\}
$$

And for `depth = 2`, since it recursively iterates on the previous `depth = 1` triangle, we simply remove asterisks from the same `char[]` array:
```
// depth = 2
       *
      ***
     *   *
    *** ***
   *       *
  ***     ***
 *   *   *   *
*** *** *** ***

// old line
*****************0000000****00000********000************0*******
|_______________||_____||__||___||______||_||__________|||_____|
        16          7    4    5      8    3      12     1   7
=> spaces as 0 =>
// new line
*****000****0****0000000****00000****000*000*000****0***0***0***
|___|___|___|___||_____||__||___||__||_|||_|||_||__|||_|||_|||_|
      3     1                         3       3     1       1
```

### As Two-Dimensional `char[][]` Array