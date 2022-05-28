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
- `len()`: gives length of list
- `.path.exists()`: checks if a path exists
- `input()`: inquires for input

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
- Methods of using modules 
1. create a file with a `.py` extension containing functions and variables
2. white modules in a native language the Python interpreter is written, like the C programming language, and when compiled, can be used from your Python code. 
- `import sys` imports module `sys`.

```
import sys

print('The command line arguments are:')
for i in sys.argv:
    print(i)

print('\n\nThe PYTHONPATH is', sys.path, '\n')
```
Output:
```
$ python module_using_sys.py we are arguments    # each arg is separated by white space
The command line arguments are:
module_using_sys.py
we
are
arguments


The PYTHONPATH is ['/tmp/py',
# many entries here, not shown here
'/Library/Python/2.7/site-packages',
'/usr/local/lib/python2.7/site-packages']
```

- searches for the imported module within Python then in `sys.path` directories
- program iterates through statements then makes them available for use
- name of running script is always the first elemnt in `sys.argv` list
- `sys.path` has the first string empty, meaning the current directory is part of the `sys.path == PYTHONPATH` environment variable.
- when using an IDE, look for a way to specify command line arguments to the program in the menus

#### Module anatomy
- modules have names, and statements can find out the name of their module
    - good for figuring out whether the module is standalone or imported
- importing a module, code gets executed
- Methods of using modules 
1. create a file with a `.py` extension containing functions and variables
    - importing modules can use byte-compiled files `.pyc`
2. white modules in a native lang - can store sequential items in a list
    ` ['put stuff in this'] `
    - mutability: able to be manipulated
##### WARNING: Remember that you should avoid using import-star, i.e. from mymodule import *.

##### Functions:
- `dir()`: returns the list of names defined by an object, and for modules, lists functions, classes, and variables

##### Summary:
Just like functions are reusable parts of programs, modules are reusable programs. Packages are another hierarchy to organize modules. The standard library that comes with Python is an example of such a set of packages and modules.

### Quick and Dirty: Objects and Classes
- `list` is an example of using objects and classes
- ` i = 5 `
    - an object is created, `i` of class `int`. Use `help(int)` for a detailed explanation.
- **Class**: can have methods
- functionality is usable when applied to an object of 'subject' class
    - i.e. `append` method for `list` class
        - `mylist.append('an item')`
- **Fields**: variables defined for use with respect to that class
- `sort()`: sorts said list. Immutable vs mutable: returns unmodified list vs returning modified
- `del list[0]`: deletes some object, in this case `list[0]`
- **Tuple**: holds together multiple objects. Lists without extensive functionality. Like strings they are immutable.
    - use-case: when the objects the Tuple is dealing with will not change
    - defined by specifying items by commas within an optional pair of parenthesis i.e.:
        - `zoo = ('python', 'elephant', 'penguin')`
- **Dictionary**: An address book that has associated keys (names) and values (details).
    - keys must be unique and immutable (like strings)
    - values may be immutable or mutable
    - key-value pairs are stored with colons separating keys to values, and commas to each pair, all in curly brackets:
        - `d = {key1 : value1, key2 : value2 }`
        - key-value pairs in dictionaries are not ordered, therefore sorting is required when necessary before using
- **Sequence**: List, Strings, and Tuples are sequences--what is this? They are characterized by two things: 
    1. membership tests and 
    2. indexing operations
    - Also have *slicing* operations, or in my own words a range/partition of values in the sequence. (`[a:b]` or for a full slice, `[:]`)
- **Set**: unordered collection of objects. Useful for verifying existence of an object in a collection over occurrences. 
    - Can test for membership
- **References**: when an object is created and assigned to a variable, or *binding* the name to the object, the var only points to the object, or references it.
- **Strings** (More): Strings are also objects with methods to strip space as well as checking parts

## Software Development Process
1. What (Analysis)
2. How (Design)
3. Do it (Implementation)
4. Testing (Testing and Debugging)
5. Use (Operation or Deployment)
6. Maintain (Refinement)

## Object Oriented Programming
- procedure-oriented programming: designing programs around blocks of statements which manipulate data
- **class**: new type of object
- **object**: instances of the class