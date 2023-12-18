+++
author = "Winston Tsia"
authorlink = ""
title = "Javascript"
date = 2023-09-29T23:31:11-07:00
description = "Notes on Javascript"
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

![Replacement Text](/rover/img/<topic>/<image>.png)

# Contents
- [Contents](#contents)
- [Introduction](#introduction)
  - [Interpreting Syntax](#interpreting-syntax)
- [Async-await](#async-await)
- [Debugging](#debugging)
- [Destructuring](#destructuring)
- [Template literals](#template-literals)
- [Review](#review)
  - [JavaScript: Introduction](#javascript-introduction)
  - [JavaScript: Control Statements](#javascript-control-statements)
  - [JavaScript: Functions](#javascript-functions)
  - [JavaScript: Arrays](#javascript-arrays)
  - [JavaScript: Objects](#javascript-objects)
  - [JavaScript: Object Model and Misc jQuery](#javascript-object-model-and-misc-jquery)
  - [Ajax](#ajax)
  - [Misc jQuery](#misc-jquery)

# Introduction

## Interpreting Syntax
```
const ageStr = age > 5 ? 'old' : 'young' 
// if age > 5 is true, 'old', else 'young'
```
# Async-await
Express asynchronous code in synchronous format
```
const sumRandomAsyncNums = async() => {
    const first = await random();
    const second = await random();
    const third = await random();
}
```

# Debugging
**Computer Property Names**: Console logging may be input into an object with css styling:
```
console.log('%c Title', 'color: orange');
console.log({ var1, var2, var3});

// track time
console.time('name_given');
// run logic
console.timeEnd('name_given');

// find origination of console log
const deleteMe = () => console.trace('bye bye database');
```

# Destructuring
When a function takes in an object, we can make readability simpler by passing in the object's properties into the function:
```
function feed(object) {
    const { prop1, prop2, prop3 } = object;
    return `This sentence: ${prop1} ${prop2} ${prop3}`;
}
```

# Template literals
You can interpolate instead of concatenating values together
```
const { prop1, prop2, prop3 } = object;

newVar = `Backticks are needed to ${prop1} ${prop2} ${prop3}`;
console.log(newVar);
```

# Review
## JavaScript: Introduction
- object
- method
- document.write
- var
- alert
- document.forms["myform"].elements["num"].value
- elementById
- innerHTML
- equality and relational operators
- parseInt
- parseFloat
- toFixed()
- if statement

## JavaScript: Control Statements
- if...else statement
- nested if
- while statement
- assignment operators such as +=
- increment operators such as ++
- switch statement
- break
- default
- continue
- for statement
- nested for statements
- logical operators such as ||
- isNaN

## JavaScript: Functions
- function definition syntax
- function call
- function argument
- Math.pow
- Math.round
- Math.floor
- Math.random
- local and global variables

## JavaScript: Arrays
- definition of array
- subscript
- defining a new array
- array initialization
- 2-dimensional array
- looping through an array using the for statement
- pull-down menu
- form field validation

## JavaScript: Objects
- string.split
- string.charAt
- string.indexOf
- string.substr
- string.substring
- indexOf
- Date methods
- Math.floor
- Math.round
- regular expressions
- window.open

## JavaScript: Object Model and Misc jQuery
- className
- document style elements
- onload
- onmouseover
- onmouseout
- getElementsByTagname
- jQuery navigation bar
- jQuery login slider

## Ajax
- What is Ajax
- XMLHttpRequest
- "try and catch" statement
- onreadystatechange
- xmlHttp.readyState
- sending a Request to the Server

## Misc jQuery
- Show/hide instructions
- Fade an element
- Validate input form data for numeric
- Masking input form data
- val()


