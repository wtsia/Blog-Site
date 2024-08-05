+++
author = "Winston Tsia"
authorlink = ""
title = "Object Oriented Programming"
date = 2022-08-17T01:19:31-07:00
description = "Notes on Object Oriented Programming: Java"
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
# Java Topics
- [Java Topics](#java-topics)
- [Introduction](#introduction)
  - [Key Features](#key-features)
  - [Notes](#notes)
- [Concepts](#concepts)
  - [Binary](#binary)
    - [8-bit](#8-bit)
  - [Integer Overflow](#integer-overflow)
- [Basics of Java](#basics-of-java)
    - [Errors/Troubleshooting](#errorstroubleshooting)
    - [Variables](#variables)
    - [Unit Tests](#unit-tests)
    - [Formatted Strings](#formatted-strings)
    - [Character methods return values. Each method must prepend `Character.`, as in `Character.isLetter`](#character-methods-return-values-each-method-must-prepend-character-as-in-characterisletter)
    - [Do/While Loop](#dowhile-loop)
    - [Character vs String](#character-vs-string)
    - [Input Validation](#input-validation)
  - [Arrays](#arrays)
      - [Array are references](#array-are-references)
      - [Traversing Arrays](#traversing-arrays)
    - [Summary so far](#summary-so-far)
  - [Enhanced Loops](#enhanced-loops)
  - [Hashmaps](#hashmaps)
    - [`import java.util.HashMap;`](#import-javautilhashmap)
    - [Table: Common HashMap methods.](#table-common-hashmap-methods)
- [Objects](#objects)
    - [Classes](#classes)
    - [Static Fields and Methods](#static-fields-and-methods)
    - [Mutable vs Immutable Objects](#mutable-vs-immutable-objects)
      - [Aliasing](#aliasing)
- [Summary So Far](#summary-so-far-1)
  - [General](#general)
  - [Loops](#loops)
  - [Objects](#objects-1)
- [Objects and Classes: Introduction](#objects-and-classes-introduction)
    - [Operator](#operator)
    - [Methods:](#methods)
  - [Wrapper Classes](#wrapper-classes)
  - [ArrayList](#arraylist)
  - [Output Formatting](#output-formatting)
- [Objects and Classes: Design](#objects-and-classes-design)
    - [*Encapsulation*](#encapsulation)
  - [Garbage Collection in Inheritance](#garbage-collection-in-inheritance)
  - [Instance Data vs Local Variable](#instance-data-vs-local-variable)
  - [Formal vs Actual Parameter](#formal-vs-actual-parameter)
    - [`new`](#new)
    - [`null`](#null)
    - [toString()](#tostring)
    - [hashCode()](#hashcode)
  - [Primitives Review](#primitives-review)
  - [Example Program](#example-program)
- [Inheritance and Polymorphism](#inheritance-and-polymorphism)
  - [Concepts](#concepts-1)
  - [Keywords](#keywords)
  - [Inheritance](#inheritance)
    - [Design](#design)
  - [Polymorphism](#polymorphism)
  - [Programming and Common Errors](#programming-and-common-errors)
- [Algorithms](#algorithms)
  - [O-Notation](#o-notation)
  - [Abstract Data Types (ADT)](#abstract-data-types-adt)
  - [Search Algos](#search-algos)
    - [Linear Search](#linear-search)
    - [Binary Search (Divide and Conquer)](#binary-search-divide-and-conquer)
  - [](#)
    - [AVL Balanced Tree (Adelson-Velsky and Landis)](#avl-balanced-tree-adelson-velsky-and-landis)
- [Data Structures](#data-structures)
  - [Hash Tables](#hash-tables)
    - [Hash Function](#hash-function)
      - [Collisions](#collisions)
- [Conclusion + Usages](#conclusion--usages)
    - [Java](#java)
    - [Spring Framework](#spring-framework)
    - [Relationship and Enhancements](#relationship-and-enhancements)
      - [1. **Dependency Management**](#1-dependency-management)
      - [2. **Aspect-Oriented Programming (AOP)**](#2-aspect-oriented-programming-aop)
      - [3. **Data Access**](#3-data-access)
      - [4. **Transaction Management**](#4-transaction-management)
      - [5. **Web Development**](#5-web-development)
      - [6. **Microservices and Cloud**](#6-microservices-and-cloud)

# Introduction
![Introduction to Java](/rover/img/ComputerScience/introJava.jpg)

Java is a high-level, object-oriented programming language designed for platform independence, allowing it to run on various devices without modification. Developed by James Gosling and his team at Sun Microsystems, Java was released in 1995. Known for its simplicity, portability, and robustness, Java has become a popular choice for building diverse applications, from web and mobile apps to large-scale enterprise systems.

## Key Features

1. **Write Once, Run Anywhere (WORA):** Java's "Write Once, Run Anywhere" philosophy enables the execution of Java programs on any device with a Java Virtual Machine (JVM).

2. **Object-Oriented:** Java is a pure object-oriented programming language, emphasizing the use of classes and objects for modular and scalable code.

3. **Automatic Memory Management:** Java features automatic memory management through garbage collection, simplifying memory handling and reducing the risk of memory leaks.

4. **Security:** Java provides a secure runtime environment, with features such as sandboxing applets and a robust set of APIs for encryption and authentication.

5. **Rich Standard Library:** Java comes with a comprehensive standard library that simplifies common programming tasks, including input/output operations, networking, and GUI development.

6. **Multithreading:** Java supports multithreading, allowing developers to build concurrent and scalable applications efficiently.

7. **Community Support:** Java has a large and active community, providing extensive documentation, tutorials, and support through various forums and resources.

Java remains a prominent language in software development, widely used in web development, mobile app development (Android), enterprise systems, and cloud computing.

## Notes

- At its core level, computers are switches, and store information in bytes (8 bits).
  - memory stores information in binary (1 or 0, like a switch!)
  - instructions go to the processor, and turns executable (in binary `1101 1011 ...`), then an assembler creates the high level instruction.
    - Java takes the high level language, runs it through a compiler, which takes it through a virtual processor that turns it executable (bytecode), and finally executes in the Virtual Machine within a processor
      - Java this method allows it to execute on different processors, its design which is reflected in the intention of creating desktop applications.
- **pointer**: variables that store addresses of other variables. Typically occupies 4 bytes of memory. Think of this like a reference to an originally stored variable.
  - in Java, this may be like string1 = string2. This does not create a new string, but references string2.

# Concepts

## Binary

### 8-bit
- represented in 8 binary, or `10101010` where each number would symbolize:
$$
1*2^8 + 0*2^7 + 1*2^6 + 0*2^5 + 1*2^4 + 0*2^3 + 1*2^2 + 0*2^0
$$

## Integer Overflow
- **Integer overflow** in Java occurs when the result of an arithmetic operation on integers exceeds the maximum value that can be represented by the data type. In Java, integer types (int and long) have fixed sizes and ranges.

| Data Type | Minimum Value | Maximum Value          |
|-----------|---------------|------------------------|
| int       | -2^31         | 2^31 - 1               |
| long      | -2^63         | 2^63 - 1               |


# Basics of Java
```java
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
Unit tests test a programs intended function by inputing data, its expected output, and its real output, or a FAILED statement.

**Single Unit Tests**:
```
// assert testExpression: detailedMessage;
assert (myVal(0,1) == 0) : "Assertion (0,1) failed"; 
```

**Class-wide**:
You can test across a class using multiple methods and printing FAIL statements.

### Formatted Strings
```
%a	floating point (except BigDecimal)	Hex output of floating point number
%b	Any type	“true” if non-null, “false” if null
%c	character	Unicode character
%d	integer (incl. byte, short, int, long, bigint)	Decimal Integer
%e	floating point	decimal number in scientific notation
.n%f	floating point	decimal number with n trailing
%g	floating point	decimal number, possibly in scientific notation depending on the precision and value.
%h	any type	Hex String of value from hashCode() method.
 %n	none	Platform-specific line separator.
%o	integer (incl. byte, short, int, long, bigint)	Octal number
%s	any type	String value
%t	Date/Time (incl. long, Calendar, Date and TemporalAccessor)	%t is the prefix for Date/Time conversions. More formatting flags are needed after this. See Date/Time conversion below.
%x	integer (incl. byte, short, int, long, bigint)	
Hex string.
```

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
```java
count = 0;
num = 6;

do {
   num = num - 1;
   count = count + 1;
} while (num > 4); 
// executes twice, but DO always executes!
// for all num, DO will execute!
```


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
```java
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

## Arrays
```java
// Create Arrays
String[] names;
double[] values;

values = new double[size]; 
// new operator allocates memory for the array and automatically initializes all of its elements to a default value
// values refer to an array of doubles; 
// how many elements depends on the value of size 
// (at the time the array is created)
```

- `toString()`, returns a string representation of an array.
- `copyOf()` , copies an array
  - `double[] data = Arrays.copyOf(values, 3);`

#### Array are references
When you make an assignment to an array variable, it simply **copies the reference**. But it doesn’t copy the array itself. For example:

```java
double[] values = new double[3];
double[] data = values;
```
#### Traversing Arrays
```java
int[] array = {1, 2, 3, 4, 5};
for (int i = 0; i < array.length; i++) {
    array[i] *= array[i];
}

// Values after the loop: {1, 4, 9, 16, 25}
```
- Search (returning index of occurence), Reducing (i.e. Sum), 

### Summary so far

- Definition of methods besides the main method
  - A method  is a list of statements executed by invoking the method's name (this is known as a method call). There are user defined methods and built in methods.
    - i.e. `sqrt(x), pow(x,y), abs(x)`
  - These methods may receive arguments/parameters and may or may not return values.
  - Values passed as arguments to methods may be of any type, such as, but not limited to: -
    - `int, double, String`.
  - Values returned by methods may be of any type, such as, but not limited to: 
    - `boolean, int, double, String`.
```java
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
- `public static`: 
  - `public` means the method may be called from any class in the program 
  - `static` means the method only uses values that are passed to the method

## Enhanced Loops
-  for-each: reduces programming burden but removes incrementing capabilities
   -  cannot change your 'value' within the for each loop.
```java
int[] values = { 1, 2, 3, 4, 5 };

for (int value:values) {
  System.out.println(value);
}
```


## Hashmaps
### `import java.util.HashMap;`
- The HashMap type is an ADT implemented as a generic class (discussed elsewhere) that supports different types of keys and values. Generically, a HashMap can be declared and created as `HashMap<K, V> hashMap = new HashMap<K, V>();` where K represents the HashMap's key type and V represents the HashMap's value type.

### Table: Common HashMap methods.

What is a **Hashmap**?

| Method | Description | Example |
|:----------:|:----------:|:----------:|
| put() put(key, value)  | Associates key with specified value. If key already exists, replaces previous value with specified value. | Map originally empty|
| exMap.put("Tom", 14);  | | |
| | | |
| | | |
| | | |
| | | |
| | | |
| | | |

```
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
# Objects
- objects have features, qualities, functions
- **abstraction**: interaction at a high level with no lower level understanding (encapsulation) i.e. tech priest
- objects highly support abstraction

### Classes
- defines new type that can group data and methods to create objects
  - public member methods: operations a class user can perform on an object
- A **field** is a variable of any type that is declared directly in a class or struct
  - **private** field: accessible to class method but not class users
- **constructor**: class member method that initializes fields

### Static Fields and Methods
- **static** indicates the variable is allocated once in memory. However due to being stored in static memory, it has global scope.
- **static field** is the field of a class instead of distributively to each class object

```
add()	add(element) 
Create space for and add the element at the end of the list.	
// List originally empty
valsList.add(31); // List now: 31 
valsList.add(41); // List now: 31 41

get()	get(index) 
Returns the element at the specified list location known as the index. Indices start at 0.	
// List originally: 31 41 59. Assume x is an int. 
x = valsList.get(0);  // Assigns 31 to x
x = valsList.get(1);  // Assigns 41
x = valsList.get(2);  // Assigns 59
x = valsList.get(3);  // Error: No such element

set()	set(index, element) 
Replaces the element at the specified position in this list with the specified element.	
// List originally: 31 41 59 
valsList.set(1, 119);  // List now 31 119 59

size()	size()
Returns the number of list elements.	
// List originally: 31 41 59. Assume x is an int. 
x = valsList.size();  // Assigns x with 3
```

### Mutable vs Immutable Objects
- **mutable**: may be changed after creation
- **immutable**: cannot be changed after creation

#### Aliasing
- more than one reference to the same object. Below is an example where a new object is not created, but the object box1 is referenced by box2.
```
Rectangle box1 = new Rectangle(0, 0, 100, 200);
Rectangle box2 = box1;
```

# Summary So Far
## General
- Definition of methods besides the main method
  - A method  is a list of statements executed by invoking the method's name (this is known as a method call). There are user defined methods and built in methods.
    - i.e. `sqrt(x), pow(x,y), abs(x)`
- These methods may receive arguments/parameters and may or may not return values.
  - Values passed as arguments to methods may be of any type, such as, but not limited to: -
    - `int, double, String`.
  - Values returned by methods may be of any type, such as, but not limited to: 
    - `boolean, int, double, String`.
- Call methods in main to perform a calculation or an action.
- To call a method:
```
public class VeganClass { 
   public static double calcNum() {
      // some calculations and logic
   }

   public static void main(String[] args) {
      // Calls method calcNum and prints the result
      System.out.println(calcNum());
   }
}

```
- Input values from the standard input using the Scanner object.
- Output values on the screen.
```
import java.util.Scanner;

public class MyClass {
  public static void main (String [] args) {
    Scanner input = new Scanner(System.in);
    // create new Scanner object called 'input' which takes 'System.in'
  }
}
```
- Strings and string methods, such as: charAt(), indexOf, length(), equals(), equalsIgnoreCase(), compareTo()
  - `charAt()`: determines the character at index x of a string
```
String userWord = "myWord";
```
- One-dimensional arrays
  - `myArray = [1, 2, 3, 4, 5];`
  - Two-dim: `int [][] myArray = new int[3][3] // 3x3, 9 elements`
- if-else statements
```
if (myThing == myNum) {
  // do stuff
}
```
- switch statements

```
switch (userVal) {
   case 1: // case userVal == 1
      numItems = 5; 
      break;

   case 3: // case userVal == 3
      numItems = 12; 
      break;

   default:
      numItems = 55;
      break;
}
```
## Loops
- for and for-each (Find: **Enhanced Loops**)
- while and do-while (Find: **Do/While Loop**)
## Objects
- Mutable and Immutable Objects
  - Mutable: can be changed
    - `StringBuilder`, `Point origin`, `Point blank`, `double dist`
  - Immutable: cannot change the content of object once created
    - `String`  
      - creating `for` loop that creates new `String` objects and concatenates them can create a lot of garbage, because a new `String` is declared and stored for use. 
      - i.e. `This String` + `This String and more` + `This String and more more`
  - *Aliasing*: more than one reference to the same object
- Designing your own classes (recall lab):
```
public class myObject {
  // declare private variable (accessible only to method)
	private double thing;

	public myObject() {
    // initialize value
		this.thing = // some value;
	}
	
	public double myMethod(double myInput) {
    // example method
		thing = thing + myInput;
		return thing;
	}
  // get and set methods
}
```
- Creating objects of classes and calling methods on those objects
`myObject myInstanceObject = new myObject();`
- The basics of GUI (Swing/SWT)
  - use Eclipse to generate default Swing application (Final Lab):
    - File>>New>>Create Java Project>>New>>Project Explorer>>New>>Other>>Swing Designer>>Application Window
- It is helpful to review Discussion posts, homework assignments, group projects and quizzes.



# Objects and Classes: Introduction
### Operator
- `instanceof`
  - example: `if(obj instanceof MyObject) { }`
### Methods:
- `equals()`: checks if two objects have the same *reference*.
  - `equalsIgnoreCase()`
## Wrapper Classes
Java's Collectin library only works with objects. For example, you can create an ArrayList of `Integer` elements (not `int`)
## ArrayList
Common Methods:
- `add()`: Create space for and add the element at the end of the list.
- `get()`: Returns the element at the specified list location known as the index. Indices start at 0.
- `set()`: Returns the element at the specified list location known as the index. Indices start at 0.
- `size()`: Returns the number of list elements.

## Output Formatting
| Format specifier |	Data type(s)	| Notes |
|:---:|:---:|:---:|
| %c	| char	| Prints a single Unicode character |
| %d	| int, long, short	| Prints a decimal integer value. |
| %o	| int, long, short	| Prints an octal integer value. |
| %h	| int, char, long, short	| Prints a hexadecimal integer value. |
| %f	| float, double	| Prints a floating-point value. |
| %e	| float, double	| Prints a floating-point value in scientific notation. |
| %s	| String	| Prints the characters in a String variable or literal. |
| %%	| 	| Prints the "%" character. |
| %n	| 	| Prints the platform-specific new-line character. |


```
Sub-specifier	Description	Example
width	Specifies the minimum number of characters to print. If the formatted value has more characters than the width, the value will not be truncated. If the formatted value has fewer characters than the width, the output will be padded with spaces (or 0's if the '0' flag is specified).	printf("Value: %7.2f", myFloat);
Value:   12.34
.precision	Specifies the number of digits to print following the decimal point. If the precision is not specified, a default precision of 6 is used.	printf("%.4f", myFloat);
12.3400

printf("%3.4e", myFloat);
1.2340e+01
flags	-: Left aligns the output given the specified width, padding the output with spaces.
+: Prints a preceding + sign for positive values. Negative numbers are always printed with the - sign.
0: Pads the output with 0's when the formatted value has fewer characters than the width.
space: Prints a preceding space for positive value.	printf("%+f", myFloat);
+12.340000
printf("%08.2f", myFloat);
00012.3
```

```
width	Specifies the minimum number of characters to print. If the formatted value has more characters than the width, the value will not be truncated. If the formatted value has fewer characters than the width, the output will be padded with spaces (or 0's if the '0' flag is specified).	printf("Value: %7d", myInt);
Value:     301
flags	-: Left aligns the output given the specified width, padding the output with spaces.
+: Print a preceding + sign for positive values. Negative numbers are always printed with the - sign.
0: Pads the output with 0's when the formatted value has fewer characters than the width.
space: Prints a preceding space for positive value.	printf("%+d", myInt);
+301

printf("%08d", myInt);
00000301

printf("%+08d", myInt);
+0000301
```

# Objects and Classes: Design
### *Encapsulation*
- single class in charge of respective data/functionality. Self-governing, and implementation hidden from user
## Garbage Collection in Inheritance
- Local and formal released to garbage collecion
## Instance Data vs Local Variable
- Instance Data Variables exist as long as the object does
  - Local variables are released for garbage collection for method runtime

## Formal vs Actual Parameter
- Formal is declared by method header with method scope, for external info
- Actual passed during invocation for sending info to a method

### `new`
- allocates memory, executes constructor, and returns reference to object

### `null`
- allowed as assignment to *Primitives*
> #### Allowed/!Allowed Operations
> Compare with `==`. Can be short-circuiting as null-check.
> Cannot invoke methods on `null`. 

### toString()
- String representation of object
### hashCode()
- returns unique identifier for an object

## Primitives Review

In Java, primitives are basic data types that represent the most fundamental values. They are built-in types provided by the Java language itself. Java has eight primitive types, which include:

- `byte`: 
  - A 1-byte integer type representing values from -128 to 127.
- `short`: 
  - A 2-byte integer type representing values from -32,768 to 32,767.
- `int`: 
  - A 4-byte integer type representing values from -2,147,483,648 to 2,147,483,647.
- `long`: 
  - An 8-byte integer type representing larger integer values.
- `float`: 
  - A 4-byte floating-point type representing single-precision decimal values.
- `double`: 
  - An 8-byte floating-point type representing double-precision decimal values.
- `char`: 
  - A 2-byte type representing a single character using the Unicode encoding scheme.
- `boolean`: 
  - A 1-bit type representing true or false values.
## Example Program 
```
public class myObject {
	private double myInstanceDataVar; 

	public myConstructor(FormalParameter myData) {
    myInstanceDataVar = myData;
	}
	
	public double myMethod(double myInput) {
    // example method
		thing = thing + myInput;
		return thing;
	}

  public static void main(String[] args) {
    FormalParameter myActualParameter = new FormalParameter();
    myClassMethod(myActualParameter);
  }

}
```

# Inheritance and Polymorphism
## Concepts
- Downcasting/Upcasting:
  - Casting an object down and up a hierarchy
  - `Animal myAnimal = new Dog()`
    - Dog is subclass of animal, therefore Dog is upacasted to Animal Animal
## Keywords
- `final`: restricts Inheritance
## Inheritance
| | Re-usability | Abstraction |
|:----------:|:----------:|:----------:|
| Inheritance  | Extending | Parent Classes|
| Composition  | Using | Interfaces |

### Design
1. Always is-a
2. Optimize Reuse--push methods high in the hierarchy
3. Purposeful Overriding
4. Encapsulation
5. Override general Object methods (`toStirng`, `equals`)
6. Optimize visibility modifiers--zero trust
## Polymorphism
Treating different classes as objects of one superclass. Objects have declared and actual types. Utilizes `instanceof` and downcasting. Uses a single interface.

There are two main types of polymorphism: compile-time polymorphism (**overloading**) and runtime polymorphism (**overriding**)
```
public class Animal {
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
    
    // Overloading
    public int add(int a, int b) {
        return a + b;
    }

    public double add(double a, double b) {
        return a + b;
    }
}

public class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}
```

## Programming and Common Errors
- `equals` Method header (Overriding `equals()`):
```
public boolean Object(Employee e) {
// Should be type Object, not Employee i.e. (Object obj)
  if (obj instanceof Employee) {
    Employee otherEmployee = (Employee) obj; // Casting to type Employee
  }
}
```

# Algorithms
[Algorithms notes](./posts/cs.0.algorithms)
## O-Notation
[O-Notation notes](./posts/cs.algorithm-analysis)

## Abstract Data Types (ADT)
**Stacks** are a Last In First Out (**LIFO**) ADT. 

| Operation         | Description                                | Example starting with stack: 99, 77 (top is 99).   |
|-------------------|--------------------------------------------|---------------------------------------------------|
| Push(stack, x)    | Inserts x on top of stack                  | Push(stack, 44). Stack: 44, 99, 77                |
| Pop(stack)        | Returns and removes item at top of stack  | Pop(stack) returns: 99. Stack: 77                |
| Peek(stack)       | Returns but does not remove item at top  | Peek(stack) returns 99. Stack still: 99, 77     |
| IsEmpty(stack)    | Returns true if stack has no items        | IsEmpty(stack) returns false.                   |
| GetLength(stack)  | Returns the number of items in the stack  | GetLength(stack) returns 2.                     |

## Search Algos
### Linear Search
Sequentially evaluating each element. Pseudocode:
```
public static int linearSearch {
  for (start; end; increment) {
    if (element == target) {
      return element;
    } 
  }
  return -1; // not found
}
```

### Binary Search (Divide and Conquer)
Utilizes sorted inputs and divides the list in half repeatedly. For $N$ elements, max steps to reduce searches pace is $[log_{2}N] + 1$.
```
public static int binarySearch {
  int left = beginning;
  int right = end;
  while (left <= right) {
    // take middle value
    // if middle is target, FOUND!
    // compare and either:
    // set left and right to left partition
    // left and right to right partition
  }
  return -1
}
```

## 

### AVL Balanced Tree (Adelson-Velsky and Landis)
An AVL tree is a BST with a height balance property and specific operations to rebalance the tree when a node is inserted or removed. This section discusses the balance property; another section discusses the operations. A BST is height balanced if for any node, the heights of the node's left and right subtrees differ by only 0 or 1. Guarantees $O(log\ n)$ search, insertion, and delete.

# Data Structures
## Hash Tables
$O(1)$ time complexity. 

### Hash Function
index = key % table_size

#### Collisions
Separate Chaining
- Index points to a linked list for same-index values
Open Addressing
- Look for next available slot (linear/quadratic probing or double hashing)


# Conclusion + Usages
Java is a widely-used programming language, while Spring is a powerful framework that builds on Java, enhancing its capabilities especially in the context of enterprise and web applications. Understanding their relationship involves examining how Spring extends Java's functionality and simplifies many of the complex tasks in large-scale application development.

### Java
Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible. It is known for its portability across platforms, which is achieved through the Java Virtual Machine (JVM). Java is used in a variety of computing platforms from embedded devices and mobile phones to enterprise servers and supercomputers.

### Spring Framework
Spring, specifically Spring Framework, is an open source framework created to address the complexity of enterprise application development. One of the primary strengths of Spring is its dependency injection (DI) feature, which promotes loose coupling through DI and inversion of control (IoC). Spring's core container handles the management of application components, using configuration files or annotations.

### Relationship and Enhancements
#### 1. **Dependency Management**
   - **Java** provides the foundation with basic libraries and runtime environment.
   - **Spring** adds a comprehensive DI mechanism that allows developers to define application components and their dependencies abstractly, without hard-coding them in the classes themselves.

#### 2. **Aspect-Oriented Programming (AOP)**
   - **Java** supports object-oriented programming, but managing cross-cutting concerns like logging or transaction management can lead to code scattering and tangling.
   - **Spring** supports Aspect-Oriented Programming which enables separating cross-cutting concerns from the business logic. This makes the system easier to maintain and scale.

#### 3. **Data Access**
   - **Java** provides JDBC (Java Database Connectivity) as a standard API for database interaction, which involves boilerplate code.
   - **Spring** offers templates for JDBC, simplifying the interaction with databases and reducing the need for repetitive boilerplate code.

#### 4. **Transaction Management**
   - **Java** transaction management can be complex and error-prone when handling manually.
   - **Spring** provides a consistent transaction management interface that can scale from local transactions to global transactions (JTA) using a consistent programming model.

#### 5. **Web Development**
   - **Java** provides servlets and Java Server Pages (JSP) for web applications.
   - **Spring** has built upon and extended these technologies with Spring MVC, a component-based framework that uses the Model-View-Controller (MVC) architecture for building web applications more efficiently.

#### 6. **Microservices and Cloud**
   - **Java** is widely used in enterprise environments, but building microservices architectures requires more than just the language.
   - **Spring Boot** (part of the larger Spring ecosystem) makes it easy to create stand-alone, production-grade Spring-based applications that you can "just run". It's particularly useful for microservice architectures with its auto-configuration capabilities and built-in application server.

In summary, while Java provides the foundational elements and syntax for programming, Spring builds on Java to offer a robust framework that simplifies many of the manual processes in enterprise and web application development. It enhances productivity and reduces the complexity associated with large-scale application development.
