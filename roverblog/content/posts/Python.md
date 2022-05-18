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
- Recommendation: stick to writing a maximum of a single logical line on each single physical line.
    - there should never be a need to use a semicolon!
- explicit line joining: if you have a long line of code, break it into multiple physical lines using the backslash.
- implicit line joining: starting a logical line with a parentheses, square brackets, or curly braces, but not ending in one. 

### Indentation
- Indentation: Whitespace at the beginning of the line

## Operators and Expressions
- Only non-intuitive uses will be listed
    - `**`: exponent
    - `//`: divide and floor
    - `%`: modulo 
    - `<<, >>`: left, right shift, shifts the bits of the numbers to the left/right of specified object. 
        - `2 << 2` gives `8`. 2 is represented by 10 in bits. left shifting by 2 bits gives 1000 which represents the decimal `8`.
        - `11 >> 1` gives `5`. 11 is represented by 1011 and one right shift gives 101, which is the decimal 5.
    - `&`: bit-wise AND
        - if both bits are 1, the result is 1, otherwise 0
        - `4 & 3 == 0101 & 0011 == 0001 == 1`
    - `|`: bit-wise OR
        - if both bits are 0, the result is 0, otherwise 1.
            - `5 | 3 == 0101 | 0011 == 0111 == 7`
    - `^`: bit-wise XOR
        - if bits are the same, result is 0. Otherwise 1.
            - `5 ^ 3 == 0101 ^ 0011 == 0110 == 6`
    - `~`: bit-wise invert
        - bit-wise inversion of x is -(x+1)
    - inequalities (<, >, <=, !=, etc)
        - returns True or False
    - `not`: boolean NOT

### Shortcut for math operation and assignment
`a = a*3 == a *= 3`

### Evaluation Order
- PEMDAS, Left-Right

## Functions
- names given to functions are parameters, while values supplied to a function are called arguments

### Local Variables
- When declaring variables inside a function definition, they only relate to its respective scope. All variables have the scope of the block starting from the point of definition of the name.
- `global`: tells Python that the variable is not local, but global.
- `def say(variable=#)`: you can assign a default value for a variable. (should be constant)

### Keyword Arguments
Applying keyword arguments, where the use of the name instead of the position specifies the argument to the function.
- `*varArgs` parameters: *=tuples, **=dictionary used if you want to define a function that can take any number of arguments.
- `return`: used to break out

### DocStrings
documentation strings helps document the program better and more understandable.

```
'''Description of program.

Conditional information for user.'''
```

- Note: DocStrings apply to modules and classes.
- *Convention*: multi-line string where first line starts with a capital letter and ends with a dot. Then a second line is blank followed by any detailed explanation starting from the third line. (important for non-trivial functions!)

### Modules

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