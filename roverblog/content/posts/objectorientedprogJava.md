+++
author = "Winston Tsia"
authorlink = ""
title = "Object Oriented Programming"
date = 2022-08-17T01:19:31-07:00
description = "Notes on Object Oriented Programming"
tags = [
    "CIS",
    "Computer Science",
    "Java"
]
categories = [
    "Computer Science",
    "Education"
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++

Student Learning Outcomes (SLO): 
1. Analyze and explain the behavior of programs involving the **fundamental program constructs**.
2. Write short programs that use the fundamental program constructs including **standard conditional** and **iterative control structures**.
3. Identify and correct syntax and logic errors in short programs.
4. Write short programs using *arrays*.
5. Design and implement a *class* based on *attributes* and *behaviors* of **objects**.
6. Construct objects using a *class* and activate methods on them.
7. Use **static** and **instance** members of a class properly.
8. Identify and describe **value**, **scope** and **lifetime** of a variable.
9. Describe the parameter passing **mechanisms** and **method overloading**.

> Keep these concepts in mind for testing. 

## Introduction
![Introduction to Java](/rover/img/ComputerScience/introJava.jpg)
- At its core level, computers are switches, and store information in bytes (8 bits).
  - memory stores information in binary (1 or 0, like a switch!)
  - instructions go to the processor, and turns executable (in binary `1101 1011 ...`), then an assembler creates the high level instruction.
    - Java takes the high level language, runs it through a compiler, which takes it through a virtual processor that turns it executable (bytecode), and finally executes in the Virtual Machine within a processor
      - Java this method allows it to execute on different processors, its design which is reflected in the intention of creating desktop applications.

## Basics of Java
```
import java.util.Scanner; // import scanner

public class Salary {                       
  public static void main (String [] args) {
    // Program starts in main and executes in main's braces {}
    int wage; // declare variable, does not assign 
    // semicolon ends statement, and declaring a variable is paramount to object manipulation

    // wage = 20; assigns the variable's value
    Scanner scnr = new Scanner(System.in);
    // create object scanner, from System.in (keyboard input)
    wage = scnr.nextInt();                      

    System.out.print("Salary is \n");
    // \n creates a new line       
    System.out.println(wage * 40 * 52 + " this is example text");
    /*
     * This is weirdly valid
     *
    */
  }
}
```
- `print` vs `println`: ln encloses the output in its own line, sending the next line to a blank line

### Errors/Troubleshooting
- sometimes a `;` can be put out as an error when its the parenthesis or something earlier up the program line
- Many programmers recommend the good practice of configuring compilers to be more picky with warnings than the default. Ex: `javac` can be run as `javac -Xlint yourfile.java` to enable all recommended warnings

- `CamelCase` should be used for Java classes
- `/` can be used as an escape sequence like:

 `("Hello \"Hello\" \nWorld")`
```
Hello "Hello" 
World
```
- Dereferencing: Dereferencing means the action of accessing an object's features through a reference. Performing any dereferencing on a primitive will result in the error “X cannot be dereferenced”, where X is a primitive type

### Variables
- To declare a constant variable, use `final`: `final double varName = 111`

### Unit Tests

### For loops

### Character methods return values. Each method must prepend `Character.`, as in `Character.isLetter`
```
isLetter(c) true if alphabetic:
a-z or A-Z  
isLetter('x') // true
isLetter('6') // false
isLetter('!') // false
  toUpperCase(c)  Uppercase version 
toUpperCase('a')  // A
toUpperCase('A')  // A
toUpperCase('3')  // 3
isDigit(c)  true if digit: 0-9. 
isDigit('x') // false
isDigit('6') // true
  toLowerCase(c)  Lowercase version 
toLowerCase('A')  // a
toLowerCase('a')  // a
toLowerCase('3')  // 3
isWhitespace(c) true if whitespace. 
isWhitespace(' ')  // true
isWhitespace('\n') // true
isWhitespace('x')  // false
```

### Do/While Loop
- separate the while loop from executing a code block (i.e. a menu)
- for something to happen regardless of condition
- `do/while` vs `while`:
  - `do/while` executes a code block once before condition checking

### Character vs String
- ASCII - merican Standard Code for Information Interchange
- 'char' vs "String"
```
<String>.length(): returns length of *String*
<String>.indexOf(<char/string>): returns index of occurrence
<String>.subString(n, m): returns characters in the form of a string at n and before m
word.toLowerCase();
word.toUpperCase();
```

### Input Validation
```
if (!in.**hasNextDouble()**) {

    String word = in.next();
    System.err.println(word + "is not a number");
}
```
- De Morgans Law:
```
!(A && B)  is the same as   !A || !B

!(A || B)  is the same as   !A && !B
```

### Arrays
```
// Create Arrays
String[] names;
double[] values;

values = new double[size]; 
// new operator allocates memory for the array and automatically initializes all of its elements to a default value
// values refer to an array of doubles; 
// how many elements depends on the value of size 
// (at the time the array is created)
```

- `toString`, returns a string representation of an array.
- `copyOf` , copies an array
  - `double[] data = Arrays.copyOf(values, 3);`

#### Array are references
When you make an assignment to an array variable, it simply **copies the reference**. But it doesn’t copy the array itself. For example:

```
double[] values = new double[3];
double[] data = values;
```
#### Traversing Arrays
```
int[] array = {1, 2, 3, 4, 5};
for (int i = 0; i < array.length; i++) {
    array[i] *= array[i];
}

// Values after the loop: {1, 4, 9, 16, 25}
```
- Search (returning index of occurence), Reducing (i.e. Sum), 

### Midterm
The online midterm test covers chapters 1-8 in the zyBook.

You are expected to know everything that you were asked to do on your assignments, which means you should be able to write Java programs that include:

- Definition of methods besides the main method
  - A method  is a list of statements executed by invoking the method's name (this is known as a method call). There are user defined methods and built in methods.
    - i.e. sqrt(x), pow(x,y), abs(x)
  - These methods may receive arguments/parameters and may or may not return values.
  - Values passed as arguments to methods may be of any type, such as, but not limited to: -
    - int, double, String.
  - Values returned by methods may be of any type, such as, but not limited to: 
    - boolean, int, double, String.
```
<access_modifier> <return_type> <method_name>( list_of_parameters) {
    //body
}


public int subtractNumbers(int m, int n) {
    int p = 0;
    p = m - n;
    System.out.println(p);
    return p;
}
```
> we can see that `public` corresponse to the access modifier, `int` to return type, and `subtractNumbers` to method name. You can infer what the other parts are.
`public static`: `public` means the method may be called from any class in the program, and `static` means the method only uses values that are passed to the method
```
      numElements = scnr.nextInt();
      
      int[] list = new int[numElements];
       for (i = 0; i < list.length; i++) {
         list[i] = scnr.nextInt();
      }
      for (i = list.length - 1; i >= 0; i--){
         System.out.print(list[i] + ",");
      }
```
Code block above is an example of:
- One-dimensional arrays `
- Input values from the standard input using the Scanner object.
- Call methods in main to perform a calculation or an action.
- Output values on the screen.
  - loops
  - for and for-each

```

```
- Strings and string methods, such as: charAt(), indexOf, length(), equals(), equalsIgnoreCase(), compareTo()
- if-else statements
- switch statements

  - while and do-while
- It is helpful to review Discussion posts, homework assignments 1-9 and quizzes 1-3.

The Midterm exam is in 2 parts:
- a multiple-choice section (20 points)
- a programming assignment question that requires a file upload (10 points)
- The test opens on Friday at 12 PM and must be submitted by 11:59 PM. You will have two hours from the time you start.

It is best to upload the programming assignment early, even if your answer is not complete so you don't risk missing the cut-off. After uploading a preliminary version, you can continue to work on the assignment, then re-upload an improved version. You may also earn partial credit if your answer is not complete.

## Hashmaps
### `import java.util.HashMap;`
- The HashMap type is an ADT implemented as a generic class (discussed elsewhere) that supports different types of keys and values. Generically, a HashMap can be declared and created as `HashMap<K, V> hashMap = new HashMap<K, V>();` where K represents the HashMap's key type and V represents the HashMap's value type.

### Table: Common HashMap methods.
```
put() put(key, value) 
Associates key with specified value. If key already exists, replaces previous value with specified value. 
// Map originally empty
exMap.put("Tom", 14); 
// Map now: Tom->14,  
exMap.put("John", 86); 
// Map now: Tom->14, John->86
putIfAbsent() putIfAbsent(key, value) 
Associates key with specified value if the key does not already exist or is mapped to null. 
// Assume Map is: Tom->14, John->86
exMap.putIfAbsent("Tom", 20); 
// Key "Tom" already exists. Map is unchanged.
exMap.putIfAbsent("Mary", 13); 
// Map is now: Tom->14, John->86, Mary->13
get() get(key)
Returns the value associated with key. If key does not exist, return null.  
// Assume Map is: Tom->14, John->86, Mary->13
exMap.get("Tom")  // returns 14 
exMap.get("Bob")  // returns null
containsKey() containsKey(key) 
Returns true if key exists, otherwise returns false.  
// Assume Map is: Tom->14, John->86, Mary->13
exMap.containsKey("Tom")  // returns true 
exMap.containsKey("Bob")  // returns false
containsValue() containsValue(value) 
Returns true if at least one key is associated with the specified value, otherwise returns false. 
// Assume Map is: Tom->14, John->86, Mary->13
exMap.containsValue(86)  // returns true (key "John" associated with value 86)
exMap.containsValue(17)  // returns false (no key associated with value 17)
remove()  remove(key) 
Removes the map entry for the specified key if the key exists.  
// Assume Map is: Tom->14, John->86, Mary->13
exMap.remove("John");  
// Map is now: Tom->14, Mary->13
clear() clear() 
Removes all map entries.  
// Assume Map is: Tom->14, John->86, Mary->13
exMap.clear();  
// Map is now empty
keySet()  keySet() 
Returns a Set containing all keys within the map. 
// Assume Map is: Tom->14, John->86, Mary->13
keys = exMap.keySet();
// keys contains: "Tom", "John", "Mary"
values()  values() 
Returns a Collection containing all values within the map.  
// Assume Map is: Tom->14, John->86, Mary->13
values = exMap.values();
// values contains: 14, 86, 13
```