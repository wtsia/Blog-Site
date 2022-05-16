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

### Format Method: `format()`
- construct strings from information
```
age = 20
name = 'Swaroop'

print('{0} was {1} years old when he wrote this book'.format(name, age))

# output:
Swaroop was 20 years old when he wrote this book
```
interpretation: string concatenation can be used to achieve the same goal. However, when the format method is called, the specifications are substituted into the string.

- `print` always ends with an invisible "new line" character `\n` so that repeated `print` calls will separate on each line.

### Escape Sequences

What if you want to use a character that python interprets, like single quotes? This can be done by specifying single quote as `\'`, i.e. `'What\'s your name?'`

- `\\`: escape sequence for a backslash
- `\t`: tab 
- `\n:` start of a new line
- in a string, backslash `\` at the end of the line indicates the string is continued in the next line, but output does not have a newline added.

#### Raw String
- for specifying strings where no special processing like escape sequences are handled, using `r` or `R` to specify a raw string 

    - `r"Newlines are indicated by \n"`

### Variable
- Variables are part of the computer's memory where you store some information. You will need some method of accessing these variables, and hence names.

### Naming
- first character must be a letter (uppercase, lowercase, or unicode) or an underscore `_`
- rest must consist of letters underscores or digits
- case-sensitive

### Logical and Physical Line
- Physical Line: What you see
- Logical Line: What Python sees

## Data Structures
### Data Types
- Python is heavily Object-oriented, in that everything is an object including numbers, strings, and functions
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