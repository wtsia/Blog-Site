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
- [Closing Ideas](#closing-ideas)
    - [Loops](#loops)

# Introduction
![Introduction to Java](/rover/img/ComputerScience/introJava.jpg)
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
- **overflow** occurs when

# Basics of Java
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
```
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

## Arrays
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

### Summary so far

- Definition of methods besides the main method
  - A method  is a list of statements executed by invoking the method's name (this is known as a method call). There are user defined methods and built in methods.
    - i.e. `sqrt(x), pow(x,y), abs(x)`
  - These methods may receive arguments/parameters and may or may not return values.
  - Values passed as arguments to methods may be of any type, such as, but not limited to: -
    - `int, double, String`.
  - Values returned by methods may be of any type, such as, but not limited to: 
    - `boolean, int, double, String`.
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
- `public static`: 
  - `public` means the method may be called from any class in the program 
  - `static` means the method only uses values that are passed to the method

## Enhanced Loops
-  for-each: reduces programming burden but removes incrementing capabilities
   -  cannot change your 'value' within the for each loop.
```
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

# Closing Ideas
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
   public static double calcVegan() {
      // some calculations and logic
   }

   public static void main(String[] args) {
      // Calls method calcVegan and prints the result
      System.out.println(calcVegan());
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
### Loops
- for and for-each (Find: **Enhanced Loops**)
- while and do-while (Find: **Do/While Loop**)
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
