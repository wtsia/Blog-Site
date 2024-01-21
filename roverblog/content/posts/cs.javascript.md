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
  - [Must Know Mentions](#must-know-mentions)

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

Certainly! Here's the information about the JavaScript topics you provided, formatted in Markdown:

# Review

## JavaScript: Introduction

- **Object:** In JavaScript, an object is a complex data type that can contain key-value pairs. Objects are used to represent and organize data in a structured way.

- **Method:** A method is a function that is associated with an object. It can be invoked using dot notation, like `object.method()`.

- **document.write:** `document.write` is a method in JavaScript that allows you to write HTML content directly to the document. While it's a simple way to add content, it's not commonly used in modern web development due to potential issues with document structure and performance.

- **var:** `var` is a keyword used to declare variables in JavaScript. In modern JavaScript, it's often replaced with `let` or `const`.

- **alert:** `alert` is a method that displays a dialog box with a specified message and an OK button. It is often used for debugging or showing information to the user.

- **document.forms["myform"].elements["num"].value:** This expression accesses the value of an input element with the name "num" inside a form with the name "myform".

- **elementById:** `getElementById` is a method used to get a reference to an HTML element based on its unique ID.

- **innerHTML:** `innerHTML` is a property that represents the HTML content within an element. It can be used to retrieve or modify the content of an element.

- **Equality and Relational Operators:** Equality operators (`==` and `===`) are used to compare values for equality. Relational operators (`<`, `>`, `<=`, `>=`) are used to compare values in terms of their order.

- **parseInt:** `parseInt` is a function used to parse a string and convert it into an integer.

- **parseFloat:** `parseFloat` is a function used to parse a string and convert it into a floating-point number.

- **toFixed():** `toFixed` is a method that rounds a number to a specified number of decimal places and returns the result as a string.

- **if statement:** The `if` statement is a control flow statement that executes a block of code if a specified condition is true.

## JavaScript: Control Statements

- **if...else statement:** The `if...else` statement is used to execute a block of code if a condition is true and another block if the condition is false.

- **Nested if:** A nested `if` statement is an `if` statement inside another `if` or `else` block.

- **while statement:** The `while` statement creates a loop that executes a block of code as long as a specified condition is true.

- **Assignment Operators (e.g., +=):** Assignment operators are used to assign values to variables. `+=` is an example that adds the right operand to the left operand and assigns the result to the left operand.

- **Increment Operators (e.g., ++):** Increment operators are used to increase the value of a variable. `++` adds 1 to the variable.

- **switch statement:** The `switch` statement is used to perform different actions based on different conditions.

- **break:** `break` is used to exit a loop or switch statement prematurely.

- **default:** `default` is used in a switch statement as a default case when no other case matches.

- **continue:** `continue` is used to skip the rest of the code inside a loop and continue with the next iteration.

- **for statement:** The `for` statement creates a loop that consists of three optional expressions: initialization, condition, and iteration.

- **Nested for statements:** A nested `for` statement is a `for` statement inside another `for` loop.

- **Logical Operators (e.g., ||):** Logical operators are used to combine conditional statements. `||` represents the logical OR.

- **isNaN:** `isNaN` is a function that checks if a value is NaN (Not a Number).

## JavaScript: Functions

- **Function Definition Syntax:** Functions are defined using the `function` keyword, followed by the function name, parameters in parentheses, and a block of code in curly braces.

- **Function Call:** A function is called or invoked by using its name followed by parentheses, containing any required arguments.

- **Function Argument:** A function argument is a value provided to a function when it is called.

- **Math.pow:** `Math.pow` is a method that returns the base to the power of the exponent.

- **Math.round:** `Math.round` is a method that rounds a number to the nearest integer.

- **Math.floor:** `Math.floor` is a method that rounds a number down to the nearest integer.

- **Math.random:** `Math.random` is a method that generates a pseudo-random floating-point number between 0 (inclusive) and 1 (exclusive).

- **Local and Global Variables:** Local variables are declared within a function and have local scope, while global variables are declared outside any function and have global scope.

## JavaScript: Arrays

- **Definition of Array:** An array is a data structure that stores a collection of elements, each identified by an index or a key.

- **Subscript:** A subscript is the index used to access individual elements in an array.

- **Defining a New Array:** Arrays can be defined using square brackets and can contain elements of any data type.

- **Array Initialization:** Array initialization is the process of assigning values to the elements of an array during its creation.

- **2-Dimensional Array:** A 2-dimensional array is an array of arrays, forming a matrix-like structure.

- **Looping Through an Array Using the for Statement:** The `for` statement can be used to iterate through the elements of an array.

- **Pull-Down Menu:** A pull-down menu, often implemented using a `<select>` element, allows users to choose from a list of options.

- **Form Field Validation:** Arrays can be used to store and validate form field values efficiently.

## JavaScript: Objects

- **string.split:** `split` is a method that splits a string into an array of substrings based on a specified delimiter.

- **string.charAt:** `charAt` is a method that returns the character at a specified index in a string.

- **string.indexOf** `indexOf` is a method that returns the index of the first occurrence of a specified value in a string.

- **string.substr:** `substr` is a method that returns a portion of a string starting from a specified index and for a specified number of characters.

- **string.substring:** `substring` is a method that returns a portion of a string between two specified indices.

- **indexOf:** `indexOf` is a method that returns the index of the first occurrence of a specified value in a string.

- **Date Methods:** JavaScript provides methods to work with dates, including creating Date objects and accessing various components like day, month, year, etc.

- **Math.floor:** `Math.floor` is a method that rounds a number down to the nearest integer.

- **Math.round:** `Math.round` is a method that rounds a number to the nearest integer.

- **Regular Expressions:** Regular expressions (regex) are patterns used to match character combinations in strings.

- **window.open:** `window.open` is a method that opens a new browser window or tab.

## JavaScript: Object Model and Misc jQuery

- **className:** `className` is a property that gets or sets the class attribute of an element.

- **Document Style Elements:** Document style elements allow you to dynamically manipulate the styles of HTML elements.

- **onload:** `onload` is an event that occurs when a document or an image finishes loading.

- **onmouseover:** `onmouseover` is an event that occurs when the mouse pointer is moved over an element.

- **onmouseout:** `onmouseout` is an event that occurs when the mouse pointer leaves an element.

- **getElementsByTagname:** `getElementsByTagname` is a method that returns a collection of all elements in the document with the specified tag name.

- **jQuery Navigation Bar:** jQuery can be used to create dynamic navigation bars that enhance the user experience.

- **jQuery Login Slider:** jQuery sliders can be implemented to create interactive elements on a web page.

## Ajax

- **What is Ajax:** Ajax (Asynchronous JavaScript and XML) is a technology that allows web pages to be updated asynchronously by exchanging small amounts of data with the server behind the scenes.

- **XMLHttpRequest:** `XMLHttpRequest` is an API used in Ajax to make HTTP requests from the browser.

- **"try and catch" statement:** The `try` and `catch` statements are used to handle exceptions in JavaScript code.

- **onreadystatechange:** `onreadystatechange` is an event handler that is triggered when the `readyState` property of an `XMLHttpRequest` changes.

- **xmlHttp.readyState:** `readyState` is a property of `XMLHttpRequest` that represents the state of the request.

- **Sending a Request to the Server:** Ajax allows sending requests to the server without reloading the entire page, enabling dynamic and interactive user experiences.

## Misc jQuery

- **Show/Hide Instructions:** jQuery can be used to dynamically show or hide elements on a web page, providing an interactive user experience.

- **Fade an Element:** jQuery provides methods to create fade-in and fade-out effects on elements, enhancing the visual appeal of a web page.

- **Validate Input Form Data for Numeric:** jQuery can be used to validate input form data, ensuring it meets specific criteria such as being numeric.

- **Masking Input Form Data:** Input masking involves formatting user input as it is entered, providing a structured and user-friendly experience. jQuery can be used for this purpose.

- **val():** `val()` is a jQuery method used to get or set the value of form elements like input fields and text areas.

## Must Know Mentions
- **Dynamic Imports:** JS bundles may be split into a by-need basis and sent over the network to decrease load times.

- **JS Bundles:** HTML and JavaScript code that must be bundled into usable static assets by web browsers.
```
const lazyBundle = await import('./lazy.js');
```

-**TypeScript:** may be used to improve static code quality.