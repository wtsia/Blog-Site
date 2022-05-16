+++
author = "Winston Tsia"
authorlink = ""
title = "Python"
date = 2022-05-14T04:35:39-07:00
description = "General Notes on Python Usage"
tags = [
    "Python",
]
categories = [
    "Computer Science",
    "Languages",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

# Python
## Basics
`#` is used for comments to the right

Numbers: categorized as integers or floats

Strings: a sequence of characters, can specify using single quotes
- `'this is a quote'`
- Multi-line: `"""` or `'''`
- are immutable
- C++ users: there is not separate `char` data type in Python.

Format Method: `format()`
- construct strings from information

## Data Structures
- List: holds an ordered collection of items
    - can store sequential items in a list
    ` ['put stuff in this'] `
    - mutability: able to be manipulated

### Quick and Dirty: Objects and Classes
- list is an example of using objects and classes
- ` i = 5 `
    - an object is created, `i` of class `int`. Use `help(int)` for a detailed explanation.
- class: can have methods
- functionality is usable when applied to an object of 'subject' class
    - i.e. `append` method for `list` class
        - `mylist.append('an item')`
- fields: variables defined for use with respect to that class