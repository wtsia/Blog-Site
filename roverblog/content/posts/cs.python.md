+++
author = "Winston Tsia"
authorlink = ""
title = "Python"
date = 2022-05-14T04:35:39-07:00
description = "General Notes on Python Usage"
tags = [
    "Python",
    "programming"
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
# Contents
- [Contents](#contents)
- [Example Program](#example-program)
- [Programming Fundamentals](#programming-fundamentals)
  - [Methods](#methods)
    - [Sets](#sets)
  - [Minor Concepts](#minor-concepts)
- [Concepts](#concepts)
  - [Basics](#basics)
  - [Data Types](#data-types)
    - [Lists](#lists)
    - [Tuples, Named Tuples, and Sets](#tuples-named-tuples-and-sets)
  - [Operators and Expressions](#operators-and-expressions)
    - [Format Method: `format()`](#format-method-format)
    - [Escape Sequences](#escape-sequences)
      - [Raw String](#raw-string)
    - [Variable](#variable)
    - [Naming](#naming)
    - [Logical and Physical Line](#logical-and-physical-line)
    - [Shortcut for math operation and assignment](#shortcut-for-math-operation-and-assignment)
    - [Evaluation Order](#evaluation-order)
  - [Functions](#functions)
    - [Local Variables](#local-variables)
    - [Keyword Arguments](#keyword-arguments)
    - [DocStrings](#docstrings)
    - [Modules](#modules)
      - [Module anatomy](#module-anatomy)
        - [WARNING: Remember that you should avoid using import-star, i.e. from mymodule import \*.](#warning-remember-that-you-should-avoid-using-import-star-ie-from-mymodule-import-)
        - [Functions:](#functions-1)
        - [Summary:](#summary)
  - [Quick and Dirty: Objects and Classes](#quick-and-dirty-objects-and-classes)
  - [Software Development Process](#software-development-process)
  - [Object Oriented Programming](#object-oriented-programming)
    - [Introduction to `self`](#introduction-to-self)
    - [Methods](#methods-1)
    - [The __init__ method](#the-init-method)
    - [Class and Object Variables](#class-and-object-variables)
    - [Inheritance](#inheritance)
  - [Input and Output](#input-and-output)
    - [Files](#files)
    - [Pickle](#pickle)
    - [Unicode](#unicode)
  - [Exceptions](#exceptions)
    - [Errors](#errors)
    - [Handling Exceptions](#handling-exceptions)
    - [Try...Finally](#tryfinally)
    - [With Statement](#with-statement)
  - [More](#more)
    - [Passing Tuples Around](#passing-tuples-around)
    - [Special Methods](#special-methods)
    - [Single Statement Blocks](#single-statement-blocks)
    - [Lambda Forms](#lambda-forms)
- [Standard Library](#standard-library)
  - [`sys` module](#sys-module)
  - [`logging` module](#logging-module)

# Example Program
```
# Function to calculate the factorial of a number
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

# Main program
if __name__ == "__main__":
    # Getting user input for a number
    num = int(input("Enter a number: "))

    # Computing and printing the factorial of the number
    fact = factorial(num)
    print("Factorial of", num, "is", fact)
```

In this program, you'll learn about:

1. Functions: The factorial function is defined to calculate the factorial of a number using recursion.
2. Conditional statements: The if-else statement is used to handle the base case in the factorial function.
3. User input: The input function is used to get user input for a number.
Variable assignment and manipulation: The num variable is assigned the value entered by the user, and the fact variable stores the factorial calculated by the factorial function.
4. Printing output: The print function is used to display the result.

To run this program, save it as a Python file (e.g., factorial.py) and execute it using a Python interpreter. The program will prompt you to enter a number, and it will then calculate and display the factorial of that number.
# Programming Fundamentals 
- For loop:
```
for x in mylist:
    print(x)
```
Explanation: iterates through `mylist` and prints each element `x` in it.
    - range vs xrange: range function returns a new list with numbers of that specified range, while xrange returns an iterator (more efficient)
- While loop: repeats as long as certain boolean conditions are met
```
# Prints out 0,1,2,3,4

count = 0
while count < 5:
    print(count)
    count += 1  # This is the same as count = count + 1
```
- "break" and "continue": break exits a for or while loop. Continue skips the current block
- "else" clause can be used for loops

## Methods
`.append()`: appends an element to a list

`.count()`: counts the number of an element in some target

`print([n:N:m])`: prints a slice of some string from `n`, where `N` acts as an upper bound and `m` is the units of traversal

`string[::-1]`: returns a reversed string

`.upper()`: converts all to uppercase

`.lower()`: converts all to lowercase

`.startswith()`: returns true or false if starts with the string

`.endswith()`: returns true or false if ends with the string

`.isdigit()`: returns true if the entire string is digits

### Sets

`set1.difference(set2)`: elements of set1 not in set2

## Minor Concepts
- Can apply numerical operations on strings as well as lists
- `%` is used to format a set of variables enclosed ina tuple
    - i.e. `%s` for a string
    ```
    name = "John"
    print("Hello, %s!" % name)
    ```
    - `%f` for floating point numbers
    - `%d` for a number
    - `%.<number of digits>f` - Floating point numbers with a fixed amount of digits to the right of the dot.
    - `%x/%X` - Integers in hex representation (lowercase/uppercase)
- using 'in' operator: 
    ```
    name = "John"
    if name in ["John", "Rick"]:
        print("Your name is either John or Rick.")
    ```
- using 'is' operator: instead of equating value, it equates the instance
- `block_keyword block_name(argument1,argument2, ...)` Block keywords you already know are "if", "for", and "while".
    ```
    def my_function():
    print("Hello From My Function!")
    ```
- creating a class and modifying a variable in the new iteration: 
    ```
    class MyClass:
        variable = "blah"
        def function(self):
            print("This is a message inside the class.")

    objectx = MyClass()
    objectx.variable = "blah2.0" 
    ```

# Concepts
## Basics
`#` is used for comments to the right

Numbers: categorized as integers or floats

Strings: a sequence of characters, can specify using single quotes
- `'this is a quote'`
- Multi-line: `"""` or `'''`
- are immutable
- C++ users: there is not separate `char` data type in Python.

## Data Types
| Type | Description |
|:---:|:---:|
| Lists | Lists are ordered collections of elements. They can contain elements of different data types, and their size can change dynamically. Lists are defined using square brackets []. |
| Tuples | Tuples are similar to lists but are immutable, meaning their elements cannot be modified after creation. They are defined using parentheses (). |
| Sets | Sets are unordered collections of unique elements. They do not allow duplicate values. Sets are useful for tasks like removing duplicates and performing mathematical set operations. Sets are defined using curly braces {} or the set() function. |
| Dictionaries | Dictionaries are key-value pairs, where each value is associated with a unique key. They provide fast lookup based on keys and are useful for representing mappings and associations. Dictionaries are defined using curly braces {} and colon : to separate keys and values. |
| Strings | Strings are sequences of characters. Although not explicitly a data structure, strings are fundamental in Python for representing and manipulating text data. They are immutable, meaning their characters cannot be changed after creation. |
| Arrays | Arrays are fixed-size, homogenous collections of elements of the same type. They are provided by the array module in Python's standard library and offer efficient storage and manipulation of numerical data. |
| Stacks | Stacks are a type of data structure that follows the Last-In-First-Out (LIFO) principle. Elements are added or removed from one end, known as the top of the stack. |
| Queues | Queues are data structures that follow the First-In-First-Out (FIFO) principle. Elements are added at the end (rear) and removed from the front (front) of the queue. |
| LinkedLists | Linked lists are dynamic data structures consisting of nodes that hold data and a reference to the next node. They are useful for efficient insertion and deletion of elements. |
| Trees | Trees are hierarchical data structures composed of nodes connected by edges. They have a root node and child nodes, forming a tree-like structure. Examples include binary trees, AVL trees, and binary search trees. |
| Graphs | Graphs are structures consisting of nodes (vertices) and edges that connect them. Graphs are useful for modeling complex relationships and are used in various algorithms and applications. |

### Lists
- **Ordered**: The elements in a list have a specific order, and this order is maintained. You can access elements by their index, starting from 0 for the first element.

- **Mutable**: Lists can be modified after creation. You can add, remove, or change elements within a list.

- **Heterogeneous**: A list can contain elements of different data types. It is not restricted to store elements of the same type.

- **Variable Length**: Lists can dynamically grow or shrink in size. You can add or remove elements as needed.

### Tuples, Named Tuples, and Sets
```
my_tuple = ()
my_named_tuple = (, []) 
my_set = {}
```
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

## Quick and Dirty: Objects and Classes
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
- OOP: combining data and functionality  inside an object
    - subtypes in OOP: class and object.
- **class**: new type
- **object**: instances of the class
    - example: `int`, variables that store integers are instances of the `int` class
- Note for Static Language Programmers: Integers are treated as objects (of the `int` class). This is unlike C++ and Java, where integers are primitive native types
- Objects store data using ordinary vars that belong to the object called *fields*
    - two types of fields: 
        - **instance variable**: belong to each instance/object of the class
        - **class variables**: belong to the class itself 
- **methods**: functions that belong to a class
- fields and methods can be referred to as attributes of that class
- **class** is created using the `class` keyword. Fields/methods of the class are listed in an indented block

### Introduction to `self`
- class methods must have an extra first name that has to be added to the beginning of the parameter list
- do not give a value for the parameter when calling the method, Python will provide a variable that refers to the object itself `self`
> Note: any name may be given to this parameter, but it is strongly recc'd to use `self`

> Note for C++/Java/C# Programmers: The self in Python is equivalent to the this pointer in C++ and the this reference in Java and C#.

Example:
```
class Person:
    pass  # An empty block

p = Person()
print(p)

# Output:
# $ python this_simplestclass.py
# <__main__.Person instance at 0x10171f518>
```
### Methods
```
class Person:
    def say_hi(self):
        print('Hello, how are you?')

p = Person()
p.say_hi()
# The previous 2 lines can also be written as
# Person().say_hi()
# Output:
# $ python this_method.py
# Hello, how are you?
```

### The __init__ method
- method is used to do any initialization, or passing initial values to your object
- the `__init__` method does not need to be explicitly called

### Class and Object Variables
- data part, or fields, are ordinary variables bound to the namespaces of the classes and objects
- names are valid within context of these classes and objects only
- class variables and object variables
    - **class variables**: are shared, and can be accessed by instances of the class. Each class variable is unique and changes follow to all instances
    - **object variables**: subset that is owned by individual object/instances. Are not shared and not related to the field of the same name in a different instance.

### Inheritance
- a type and subtype relationship between classes, where a major benefit of OOP is being able to reuse code

```
class SchoolMember:
    '''Represents any school member.'''
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print('(Initialized SchoolMember: {})'.format(self.name))

    def tell(self):
        '''Tell my details.'''
        print('Name:"{}" Age:"{}"'.format(self.name, self.age), end=" ")


class Teacher(SchoolMember):
    '''Represents a teacher.'''
    def __init__(self, name, age, salary):
        SchoolMember.__init__(self, name, age)
        self.salary = salary
        print('(Initialized Teacher: {})'.format(self.name))

    def tell(self):
        SchoolMember.tell(self)
        print('Salary: "{:d}"'.format(self.salary))


class Student(SchoolMember):
    '''Represents a student.'''
    def __init__(self, name, age, marks):
        SchoolMember.__init__(self, name, age)
        self.marks = marks
        print('(Initialized Student: {})'.format(self.name))

    def tell(self):
        SchoolMember.tell(self)
        print('Marks: "{:d}"'.format(self.marks))

t = Teacher('Mrs. Shrividya', 40, 30000)
s = Student('Swaroop', 25, 75)

# prints a blank line
print()

members = [t, s]
for member in members:
    # Works for both Teachers and Students
    member.tell()

# Output:

# $ python oop_subclass.py
# (Initialized SchoolMember: Mrs. Shrividya)
# (Initialized Teacher: Mrs. Shrividya)
# (Initialized SchoolMember: Swaroop)
# (Initialized Student: Swaroop)

# Name:"Mrs. Shrividya" Age:"40" Salary: "30000"
# Name:"Swaroop" Age:"25" Marks: "75"
```

> Summary: We have now explored the various aspects of classes and objects as well as the various terminologies associated with it. We have also seen the benefits and pitfalls of object-oriented programming. Python is highly object-oriented and understanding these concepts carefully will help you a lot in the long run.

## Input and Output
- take input from a user: `input()` and to print results back `print`
- for output, `str` methods may be utilized. i.e. `rjust`, while `help(str)` can give more details.

Improved Palindrome:
```
def reverse(text):
    return text[::-1]


def is_palindrome(text):
    return text == reverse(text)

forbidden = (!, ?, ., ',', )

something = input("Enter text: ")
if is_palindrome(something):
    print("Yes, it is a palindrome")
else:
    print("No, it is not a palindrome")
```
### Files
- `open()` by default considers files to be a 't'ext file and opens it in 'r'ead mode
- `open('file.txt', w)` means open a file.txt with write permissions

### Pickle 
- can be used to store any plain Python object in a file and get it back later, or *persistently*
`import pickle`
`pickle.dump(thing, f)` dump object thing to file
`f. close` close file

### Unicode
- Internet data is sent over using bytes. Translating unicode to bytes is encoding, and a popular one is UTF-8

## Exceptions
### Errors
- Python raises errors at wherever something is located as well as specific issue

### Handling Exceptions
- `try..except` can be used to handle exceptions
```
try:
    text = input('Enter something --> ')
except EOFError:
    print('Why did you do an EOF on me?')
except KeyboardInterrupt:
    print('You cancelled the operation.')
else:
    print('You entered {}'.format(text))
```

### Try...Finally
- Whether or not an exception was raised, using `finally` will ensure the file object is closed properly

### With Statement
- try and finally block is useful for acquiring and releasing a resource respectively. This can be cleaning done using `with`
```
with open("poem.txt") as f:
    for line in f:
        print(line, end='')
```

- with statement. It fetches the object returned by the open statement
- for some 'thefile' object, it always calls the `thefile.__enter__` and `thefile.__exit__` before and after respectively

> Summary: We have discussed the usage of the try..except and try..finally statements. We have seen how to create our own exception types and how to raise exceptions as well.

## More
### Passing Tuples Around
- Using tuples can allow one to return two different values from a function

### Special Methods
- __init__, __del__ methods have special significance in classes
__init__(self, ...)
    - This method is called just before the newly created object is returned for usage.
- __del__(self)
    - Called just before the object is destroyed (which has unpredictable timing, so avoid using this)
- __str__(self)
    - Called when we use the print function or when str() is used.
- __lt__(self, other)
    - Called when the less than operator (<) is used. Similarly, there are special methods for all the operators (+, >, etc.)
- __getitem__(self, key)
    - Called when x[key] indexing operation is used.
- __len__(self)
    - Called when the built-in len() function is used for the sequence object.

### Single Statement Blocks
```
>>> flag = True
>>> if flag: print('Yes')
...
Yes
```
- Reccomendation: avoid this short-cut method except for erro checking

### Lambda Forms
- A lambda statement is used to create new function objects. Essentially, the lambda takes a parameter followed by a single expression
```
points = [{'x': 2, 'y': 3},
          {'x': 4, 'y': 1}]
points.sort(key=lambda i: i['y'])
print(points)

# Output:
# $ python more_lambda.py
# [{'y': 1, 'x': 4}, {'y': 3, 'x': 2}]
```

# Standard Library
## `sys` module
- contains system-specific functionality

## `logging` module
- useful for storing debugging or important messages
- The cat command is used in the command line to read the 'test.log' file. If the cat command is not available, you can open the test.log file in a text editor instead.

