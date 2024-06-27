cdc+++
author = "Winston Tsia"
authorlink = ""
title = "Computer Organization Systems Programming"
date = 2023-01-23T00:30:07-08:00
description = "Notes on Computer Organization and Systems Programming"
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

# Contents
- [Contents](#contents)
- [CPU Architecture](#cpu-architecture)
  - [Arithmetic Logic Unit](#arithmetic-logic-unit)
- [Bits, Bytes, and Integers](#bits-bytes-and-integers)
- [Assembly x86](#assembly-x86)
  - [Basics](#basics)
    - [C++ vs Assembly:](#c-vs-assembly)
      - [C++](#c)
      - [Assembly](#assembly)
    - [Data Representation](#data-representation)
- [C Programming](#c-programming)
  - [Memory Hierarchy](#memory-hierarchy)
    - [SRAM vs DRAM](#sram-vs-dram)
    - [ROM: Read-Only Memory](#rom-read-only-memory)
    - [Nonvolatile vs Volatile Memory](#nonvolatile-vs-volatile-memory)
    - [Bus](#bus)
    - [Memory Systems](#memory-systems)
      - [Disk Drive](#disk-drive)
      - [PCI vs PCI Express Bus](#pci-vs-pci-express-bus)
      - [Process of DMA: Direct Memory Access](#process-of-dma-direct-memory-access)
  - [Programming Introduction](#programming-introduction)
    - [Datatypes](#datatypes)
    - [Arithmetic Operations](#arithmetic-operations)
      - [Additional Notes:](#additional-notes)
    - [Format Specifiers](#format-specifiers)
    - [`include<stdio.h>`](#includestdioh)
    - [Math Functions](#math-functions)
    - [if-else, switch](#if-else-switch)
      - [Usage Examples:](#usage-examples)
        - [`if` Statement:](#if-statement)
        - [`if-else` Statement:](#if-else-statement)
        - [`if-else if-else` Statement:](#if-else-if-else-statement)
        - [`switch` Statement:](#switch-statement)
    - [Logical Operators](#logical-operators)
        - [Ternary Operator](#ternary-operator)
    - [Functions](#functions)
      - [User-Defined Functions](#user-defined-functions)
      - [Function Prototype](#function-prototype)
      - [Example: User-Defined Function with Prototype](#example-user-defined-function-with-prototype)
      - [Why Use Function Prototypes?](#why-use-function-prototypes)
      - [Best Practices](#best-practices)
    - [String Functions](#string-functions)
    - [Loops](#loops)
      - [Examples](#examples)
      - [`for` Loop:](#for-loop)
      - [`while` Loop:](#while-loop)
      - [`do-while` Loop:](#do-while-loop)
    - [Arrays](#arrays)
      - [Basics of Arrays](#basics-of-arrays)
        - [Declaration](#declaration)
        - [Initialization](#initialization)
        - [Accessing Array Elements](#accessing-array-elements)
      - [Properties of Arrays](#properties-of-arrays)
      - [Multidimensional Arrays](#multidimensional-arrays)
      - [Dynamic Arrays](#dynamic-arrays)
      - [Limitations and Considerations](#limitations-and-considerations)
    - [Structs](#structs)
      - [Understanding Structs](#understanding-structs)
        - [Example of Struct Declaration:](#example-of-struct-declaration)
      - [Using Typedef with Structs](#using-typedef-with-structs)
        - [Example Using Typedef:](#example-using-typedef)
      - [Practical Usage of Structs and Typedef](#practical-usage-of-structs-and-typedef)
    - [Bitwise Operators](#bitwise-operators)
    - [List of Bitwise Operators in C:](#list-of-bitwise-operators-in-c)
    - [Practical Applications of Bitwise Operators](#practical-applications-of-bitwise-operators)
    - [Pointers](#pointers)
      - [Concepts of Pointers](#concepts-of-pointers)
      - [Example Uses of Pointers](#example-uses-of-pointers)
      - [Table of Pointer Operations](#table-of-pointer-operations)
      - [Key Points](#key-points)
  - [Combinatorial Logic](#combinatorial-logic)
    - [Boolean Laws](#boolean-laws)
      - [1. Identity Laws](#1-identity-laws)
      - [2. Null Laws](#2-null-laws)
      - [3. Idempotent Laws](#3-idempotent-laws)
      - [4. Dominance Laws](#4-dominance-laws)
      - [5. Complement Laws](#5-complement-laws)
      - [6. Commutative Laws](#6-commutative-laws)
      - [7. Associative Laws](#7-associative-laws)
      - [8. Distributive Laws](#8-distributive-laws)
      - [9. Absorption Laws](#9-absorption-laws)
      - [10. Involution Law](#10-involution-law)
      - [11. De Morgan's Theorems](#11-de-morgans-theorems)
    - [Final Practice](#final-practice)

# CPU Architecture
Comprised of the ALU, Control Unit, Clock, and Memory Registers
## Arithmetic Logic Unit

# Bits, Bytes, and Integers
Bits are stored as `0` or `1`.

Bytes are `8` bits.

Integers

# Assembly x86
## Basics
### C++ vs Assembly:
C++ has limitations if it uses certain libraries on a single operating system. *Assembly* is **not** portable. They are designed for specific processor families (Motorola 68x00, x86, SUN Sparc, Vax, and IBM-370). Language may be translated during execution in a processor by a *microcode interpreter*.
#### C++
```
int Y;
int X = (Y + 4) * 3;
```
#### Assembly
Example program:
```
mov  eax,Y   ; move Y to the EAX register
add  eax,4   ; add 4 to the EAX register
mov  ebx,3   ; move 3 to the EBX register
imul ebx     ; multiply EAX by EBX
mov  X,eax   ; move EAX to X
```


- linkers vs assemblers: assemblers compile the s.c. programs from assembly into machine instruction, linkers are a utility program that combine individual files made by assemblers into an executable program
- *virtual machine*: a software program that emulates the functions of some physical or virtual computer


### Data Representation
| Decimal | Binary | Hex |
|:-----|:-----:|-----:|
|1 | 0000 0001| 1|
|10 | 0000 1010 | A |
|100 | 0000 0000 | |
|1024 | 0000 0000 | |

# C Programming
## Memory Hierarchy
### SRAM vs DRAM
- Static vs Dynamic Random-Access-Memory
  - volatile--does not maintain data when powered off

### ROM: Read-Only Memory
- Erasable, E-Erasable, Programmable, Flash Memory

### Nonvolatile vs Volatile Memory
Nonvolatile: ROMS, maintains data when powered off

### Bus
wires that carry address data/control signals
- memory operations involving the bus take longer

### Memory Systems
- register operations in the CPU are sub nanoseconds

#### Disk Drive
- made of platters that form cylinders, with tracks containing sectors separated by gaps
- recording zone: disjoint subsets of the track/sectors
  - capacity = average recording zone
$$
Capacity = byte/sector * sector/track * 
  \\track/surface * surface/platter * platter/disk
$$

#### PCI vs PCI Express Bus
- Express is point-to-point, whereas PCI is broadcast

#### Process of DMA: Direct Memory Access
```
CPU -> Controller -> Disk -> Load to Main Memory -> Controller sends signal to CPU
```

## Programming Introduction
### Datatypes
| Data Type             | Size (Typical) | Range of Values                                         |
|-----------------------|----------------|---------------------------------------------------------|
| `char`                | 1 byte         | -128 to 127 or 0 to 255                                 |
| `unsigned char`       | 1 byte         | 0 to 255                                                |
| `signed char`         | 1 byte         | -128 to 127                                             |
| `int`                 | 4 bytes        | -2,147,483,648 to 2,147,483,647                         |
| `unsigned int`        | 4 bytes        | 0 to 4,294,967,295                                      |
| `short`               | 2 bytes        | -32,768 to 32,767                                       |
| `unsigned short`      | 2 bytes        | 0 to 65,535                                             |
| `long`                | 4 or 8 bytes   | -2,147,483,648 to 2,147,483,647 (4 bytes)               |
| `unsigned long`       | 4 or 8 bytes   | 0 to 4,294,967,295 (4 bytes)                            |
| `long long`           | 8 bytes        | -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 |
| `unsigned long long`  | 8 bytes        | 0 to 18,446,744,073,709,551,615                         |
| `float`               | 4 bytes        | Approximately 1.2E-38 to 3.4E+38 (7 digits precision)   |
| `double`              | 8 bytes        | Approximately 2.3E-308 to 1.7E+308 (15 digits precision)|
| `long double`         | 8 or 16 bytes  | Varies, often 3.4E-4932 to 1.1E+4932 (19 digits precision)|


Additional Notes:
- The exact size and range can depend on the architecture, compiler, and whether the system is 32-bit or 64-bit. For instance, long on many Unix-like systems on 64-bit architectures is typically 8 bytes.
- The size of long double can vary significantly between different systems and compilers.
- char can be either signed or unsigned by default, which depends on the compiler and system settings. This affects whether char interprets its bits as ranging from -128 to 127 or 0 to 255.

### Arithmetic Operations
| Operator | Description        | Syntax        | Example        | Result Description          |
|----------|--------------------|---------------|----------------|-----------------------------|
| `+`      | Addition           | `a + b`       | `5 + 3`        | Adds `a` and `b`            |
| `-`      | Subtraction        | `a - b`       | `5 - 3`        | Subtracts `b` from `a`      |
| `*`      | Multiplication     | `a * b`       | `5 * 3`        | Multiplies `a` by `b`       |
| `/`      | Division           | `a / b`       | `6 / 3`        | Divides `a` by `b`          |
| `%`      | Modulus            | `a % b`       | `5 % 3`        | Remainder of `a` divided by `b` |
| `++`     | Increment          | `a++` or `++a`| `a = 5; a++`   | Increments `a` by 1         |
| `--`     | Decrement          | `a--` or `--a`| `a = 5; a--`   | Decrements `a` by 1         |

#### Additional Notes:
- **Division (`/`)**: When used with integers, this operation performs integer division (i.e., the fractional part is discarded). If either operand is a floating-point number, the division will result in a floating-point quotient.
- **Modulus (`%`)**: Only applicable to integer types. It returns the remainder of dividing the first operand by the second operand.
- **Increment (`++`)** and **Decrement (`--`)**: These operators can be used in two forms—postfix (`a++`, `a--`), where the operation is performed after the value is used in an expression, and prefix (`++a`, `--a`), where the operation is performed before the value is used.
- **Important**: In the case of division by zero, the behavior is undefined in C.

### Format Specifiers
| Format Specifier | Description                                       | Data Type              |
|------------------|---------------------------------------------------|------------------------|
| `%d`             | Decimal integer                                  | `int`                  |
| `%ld`            | Long decimal integer                             | `long`                 |
| `%lld`           | Long long decimal integer                        | `long long`            |
| `%u`             | Unsigned decimal integer                         | `unsigned int`         |
| `%lu`            | Unsigned long decimal integer                    | `unsigned long`        |
| `%llu`           | Unsigned long long decimal integer               | `unsigned long long`   |
| `%o`             | Octal integer                                    | `int`                  |
| `%lo`            | Long octal integer                               | `long`                 |
| `%llo`           | Long long octal integer                          | `long long`            |
| `%x` or `%X`     | Hexadecimal integer                              | `int`                  |
| `%lx` or `%lX`   | Long hexadecimal integer                         | `long`                 |
| `%llx` or `%llX` | Long long hexadecimal integer                    | `long long`            |
| `%c`             | Character                                        | `char`                 |
| `%s`             | String                                           | `char *`               |
| `%f`             | Floating-point number (standard notation)        | `float` or `double`    |
| `%e` or `%E`     | Floating-point number (scientific notation)      | `float` or `double`    |
| `%g` or `%G`     | Floating-point number (compact notation)         | `float` or `double`    |
| `%p`             | Pointer                                          | `void *`               |
| `%n`             | Stores the number of characters written so far   | `int *`                |


### `include<stdio.h>`
The `#include <stdio.h>` directive is a preprocessor command in the C programming language that instructs the compiler to include the Standard Input/Output library, known as `stdio.h`, into a program before the actual compilation begins. This header file contains declarations of functions and macros that provide input and output facilities. Here’s a breakdown of its main components and functionalities:

1. **Input/Output Functions**:
   - `printf()`: Used to print the formatted output to the standard output (usually the screen).
   - `scanf()`: Used for formatted input, it reads data from the standard input (usually the keyboard).
   - `puts()`: Writes a string to stdout and appends a newline character.
   - `gets()`: Reads a string from stdin until a newline character is encountered (not safe to use because of buffer overflow issues).

2. **File Handling Functions**:
   - `fopen()`: Opens a file and returns a pointer to a `FILE` object associated with the file name specified.
   - `fclose()`: Closes an open file associated with a `FILE` pointer.
   - `fprintf()`, `fscanf()`: Similar to `printf()` and `scanf()`, but these work with file streams.
   - `fread()`, `fwrite()`: Used for reading and writing binary data to and from files.
   - `feof()`, `ferror()`: Check for end-of-file or errors when reading from or writing to files.

3. **Character Input/Output**:
   - `fgetc()`, `getc()`, `getchar()`: Used for reading a single character from a file or standard input.
   - `fputc()`, `putc()`, `putchar()`: Write a single character to a file or standard output.

4. **Buffer Manipulation**:
   - `setbuf()`, `setvbuf()`: Functions to set the buffer for a file stream, which can optimize I/O performance by reducing the number of actual input and output operations.

5. **Error Handling**:
   - `perror()`: Prints an error message to standard error, describing the last error encountered during a call to a standard I/O function.

6. **Positioning**:
   - `rewind()`, `fseek()`, `ftell()`: Functions to move the read/write position in a file.

7. **Temporary Files**:
   - `tmpfile()`, `tmpnam()`: Functions for creating temporary files and names, useful in situations where a short-lived file is needed without leaving traces on the file system.

Including `stdio.h` in a C program is essential for performing standard input and output operations, which are fundamental to most applications. This header is part of the C Standard Library, included in the C Standard defined by the ISO/IEC 9899:2011 (commonly known as C11) and its predecessors. Using `#include <string.h>` for `fgets()`.

### Math Functions
Often includes `#include <math.h>`
| Function           | Description                                  |
|--------------------|----------------------------------------------|
| `fabs(x)`          | Absolute value of `x`                        |
| `ceil(x)`          | Smallest integer not less than `x`           |
| `floor(x)`         | Largest integer not greater than `x`         |
| `sqrt(x)`          | Square root of `x`                           |
| `pow(x, y)`        | `x` raised to the power of `y`               |
| `exp(x)`           | Exponential function (e^x)                   |
| `log(x)`           | Natural logarithm (base `e`) of `x`          |
| `log10(x)`         | Base 10 logarithm of `x`                     |
| `sin(x)`           | Sine of `x` (in radians)                     |
| `cos(x)`           | Cosine of `x` (in radians)                   |
| `tan(x)`           | Tangent of `x` (in radians)                  |
| `asin(x)`          | Arcsine of `x` (in radians)                  |
| `acos(x)`          | Arccosine of `x` (in radians)                |
| `atan(x)`          | Arctangent of `x` (in radians)               |
| `sinh(x)`          | Hyperbolic sine of `x`                       |
| `cosh(x)`          | Hyperbolic cosine of `x`                     |
| `tanh(x)`          | Hyperbolic tangent of `x`                    |
| `asinh(x)`         | Inverse hyperbolic sine of `x`               |
| `acosh(x)`         | Inverse hyperbolic cosine of `x`             |
| `atanh(x)`         | Inverse hyperbolic tangent of `x`            |
| `fmod(x, y)`       | Floating-point remainder of `x/y`            |
| `remainder(x, y)`  | Floating-point remainder of `x/y`            |
| `hypot(x, y)`      | Euclidean distance function sqrt(x^2 + y^2)  |

### if-else, switch

| Statement             | Description                                                                                               |
|-----------------------|-----------------------------------------------------------------------------------------------------------|
| `if` statement        | Conditional statement that executes a block of code if the given condition is true.                       |
| `if-else` statement   | Conditional statement that executes one block of code if the condition is true, and another if false.     |
| `if-else if-else`     | Chain of conditional statements where each `else if` condition is evaluated only if previous conditions fail. |
| `switch` statement    | Multi-way decision statement that evaluates an expression and executes code based on matching case labels.  |

#### Usage Examples:

##### `if` Statement:
```c
int x = 10;
if (x > 0) {
    printf("Positive\n");
}
```

##### `if-else` Statement:
```c
int x = 0;
if (x > 0) {
    printf("Positive\n");
} else {
    printf("Non-positive\n");
}
```

##### `if-else if-else` Statement:
```c
int x = 0;
if (x > 0) {
    printf("Positive\n");
} else if (x < 0) {
    printf("Negative\n");
} else {
    printf("Zero\n");
}
```

##### `switch` Statement:
```c
int day = 3;
switch (day) {
    case 1:
        printf("Monday\n");
        break;
    case 2:
        printf("Tuesday\n");
        break;
    case 3:
        printf("Wednesday\n");
        break;
    default:
        printf("Invalid day\n");
}
```
- Note the use of `break;` statements to stop continuation of the cases.

### Logical Operators
| Operator | Description                 | Example        | Result |
|----------|-----------------------------|----------------|--------|
| `&&`     | Logical AND                 | `a && b`       | True if both `a` and `b` are true, false otherwise |
| `\|\|`   | Logical OR                  | `a \|\| b`     | True if at least one of `a` or `b` is true, false otherwise |
| `!`      | Logical NOT (negation)      | `!a`           | True if `a` is false, false if `a` is true |

##### Ternary Operator
Shortcut to an if/else statement when assigning/returning a value.

`condition ? expression1 : expression2`

```c
#include <stdio.h>

int main() {
    int num = 10;
    char* result = (num % 2 == 0) ? "even" : "odd";
    printf("%d is %s\n", num, result); // 10 is even
    return 0;
}
```

### Functions
User-defined functions are custom functions that you write to perform specific tasks, making your code modular, reusable, and easier to read. These functions allow you to break complex problems into smaller, manageable parts.

#### User-Defined Functions
User-defined functions are declared and defined by the programmer, specifying what operations the function will carry out. Each function typically performs a dedicated task that can be used throughout the program.

**Structure of a User-Defined Function**:
1. **Function Declaration/Prototype**: Introduces the function to the compiler before its actual implementation. It specifies the function's name, return type, and parameters (if any).
2. **Function Definition**: Contains the actual body of the function—i.e., the code that executes when the function is called.
3. **Function Call**: This is where you use the function in your code.

#### Function Prototype
> Note: many C compilers do not check for parameter matching

A function prototype is a declaration of a function that specifies the function’s name, return type, and its parameters (type and order), but not the body. It tells the compiler what the function looks like. It allows the compiler to handle the function call correctly and is particularly useful for managing and maintaining code where functions are defined after they are called.

**Syntax of a Function Prototype**:
```c
return_type function_name(type1 parameter1, type2 parameter2, ...);
```

#### Example: User-Defined Function with Prototype
```c
#include <stdio.h>

// Function prototype
int add(int, int);

int main() {
    int result = add(10, 20);
    printf("The sum is: %d\n", result);
    return 0;
}

// Function definition
int add(int a, int b) {
    return a + b;
}
```

In this example:
- The function prototype for `add(int, int)` is declared before the `main()` function.
- The function `add` is defined after `main`. It takes two integers, adds them, and returns the sum.
- The prototype ensures that the compiler knows about the `add` function when it is called in `main`.

#### Why Use Function Prototypes?
- **Type Checking**: Function prototypes enable the compiler to perform type checks on the function arguments, reducing errors.
- **Program Organization**: They help in organizing the program into logical blocks and can be declared in header files for use across multiple source files.
- **Forward Declarations**: Useful in scenarios involving mutually recursive functions or when functions are defined in a different order than their calls.

#### Best Practices
- Always declare function prototypes at the beginning of your files or in a header file.
- Match the function prototype with the function definition exactly to avoid any mismatch and compiler errors.
- Use meaningful function names and parameter names to make your code self-explanatory.


### String Functions
| Function        | Description                                                     | Header       | Notes                                                                                         |
|-----------------|-----------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------|
| `strlen()`      | Returns the length of a string excluding the null terminator    | `<string.h>` | Counts characters until the null terminator                                                  |
| `strcpy()`      | Copies a string from source to destination                       | `<string.h>` | Destination must have enough space to hold the source string                                   |
| `strncpy()`     | Copies a portion of a string from source to destination          | `<string.h>` | Allows you to specify the number of characters to copy                                         |
| `strcat()`      | Concatenates two strings                                        | `<string.h>` | Appends the contents of the source string to the destination string                           |
| `strncat()`     | Concatenates a portion of a string to another string             | `<string.h>` | Allows you to specify the number of characters to concatenate                                 |
| `strcmp()`      | Compares two strings lexicographically                          | `<string.h>` | Returns 0 if strings are equal, negative value if str1 < str2, positive value if str1 > str2  |
| `strncmp()`     | Compares a portion of two strings lexicographically              | `<string.h>` | Allows you to specify the number of characters to compare                                     |
| `strchr()`      | Returns a pointer to the first occurrence of a character        | `<string.h>` | Searches for the first occurrence of the specified character in the string                    |
| `strrchr()`     | Returns a pointer to the last occurrence of a character         | `<string.h>` | Searches for the last occurrence of the specified character in the string                     |
| `strstr()`      | Returns a pointer to the first occurrence of a substring        | `<string.h>` | Searches for the first occurrence of the specified substring in the string                   |
| `strtok()`      | Splits a string into tokens based on delimiters                  | `<string.h>` | Used for tokenizing strings                                                                   |
| `sprintf()`     | Formats and stores a series of characters into a string          | `<stdio.h>`  | Similar to `printf()` but writes output to a string instead of stdout                         |
| `snprintf()`    | Writes formatted data to a string with specified maximum length | `<stdio.h>`  | Same as `sprintf()` but specifies maximum length to prevent buffer overflow                   |
| `strcmp()`      | Compares two strings lexicographically                          | `<string.h>` | Returns 0 if strings are equal, negative value if str1 < str2, positive value if str1 > str2  |
| `strncmp()`     | Compares a portion of two strings lexicographically              | `<string.h>` | Allows you to specify the number of characters to compare                                     |
| `strstr()`      | Returns a pointer to the first occurrence of a substring        | `<string.h>` | Searches for the first occurrence of the specified substring in the string                   |
| `strtok()`      | Splits a string into tokens based on delimiters                  | `<string.h>` | Used for tokenizing strings                                                                   |
| `sprintf()`     | Formats and stores a series of characters into a string          | `<stdio.h>`  | Similar to `printf()` but writes output to a string instead of stdout                         |
| `snprintf()`    | Writes formatted data to a string with specified maximum length | `<stdio.h>`  | Same as `sprintf()` but specifies maximum length to prevent buffer overflow                   |

### Loops
| Loop            | Description                                                                                      |
|-----------------|--------------------------------------------------------------------------------------------------|
| `for` loop      | Executes a block of code a specified number of times, with initialization, condition, and increment/decrement expressions |
| `while` loop    | Executes a block of code as long as the specified condition evaluates to true                    |
| `do-while` loop | Executes a block of code at least once, and then repeatedly as long as the specified condition evaluates to true |

#### Examples
#### `for` Loop:
```c
#include <stdio.h>

int main() {
    for (int i = 0; i < 5; i++) {
        printf("%d ", i);
    }
    // Outputs: 0 1 2 3 4
    return 0;
}
```

#### `while` Loop:
```c
#include <stdio.h>

int main() {
    int i = 0;
    while (i < 5) {
        printf("%d ", i);
        i++;
    }
    // Outputs: 0 1 2 3 4
    return 0;
}
```

#### `do-while` Loop:
```c
#include <stdio.h>

int main() {
    int i = 0;
    do {
        printf("%d ", i);
        i++;
    } while (i < 5);
    // Outputs: 0 1 2 3 4
    return 0;
}
```

### Arrays
Arrays in C are fundamental data structures that allow you to store multiple items of the same data type under a single variable name. Arrays provide a convenient way to access and manipulate collections of data systematically using an index. Here’s an in-depth exploration of arrays in C:

#### Basics of Arrays
An array is a collection of elements of the same type placed in contiguous memory locations. Each element in the array can be uniquely identified by an array index.

##### Declaration
To declare an array in C, you specify the type of its elements and the number of elements required by it:

```c
int arr[10]; // Declares an array of ten integers
```

##### Initialization
Arrays can be initialized at the time of declaration. If some elements are initialized, the rest will be automatically initialized to the default zero value of the declared type.

```c
int arr[5] = {1, 2, 3}; // Initializes the first three elements, others set to 0
```

If you provide an initializer list with fewer values than the size of the array, the remaining elements are set to zero:

```c
int arr[5] = {1, 2}; // Output: arr = {1, 2, 0, 0, 0}
```

You can also omit the size of the array if you initialize it at declaration:

```c
int arr[] = {1, 2, 3, 4, 5}; // The compiler will size the array as 5
```

##### Accessing Array Elements
Array elements are accessed using the subscript (index) notation. The index of the first element is 0, the second element is 1, and so forth.

```c
arr[0] = 10; // Set the first element
int x = arr[1]; // Read the second element
```

#### Properties of Arrays
- **Fixed Size**: Once declared, the size of the array cannot be changed.
- **Contiguous Memory Allocation**: Elements are stored in contiguous memory locations, which allows efficient access using indices.
- **Index Based Access**: Elements are accessed using indices, which are zero-based.

#### Multidimensional Arrays
C supports multidimensional arrays, which are arrays of arrays. The most common type is the two-dimensional array.

```c
int matrix[3][4]; // Declare a 2D array (3 rows and 4 columns)
```

Initialize a 2D array:

```c
int matrix[2][3] = {
    {1, 2, 3},
    {4, 5, 6}
};
```

Access elements in a 2D array:

```c
int value = matrix[0][2]; // Accesses the third element of the first row
```

#### Dynamic Arrays
While C does not directly support dynamic arrays as part of its standard array data structure, you can simulate them using pointers and memory management functions (`malloc`, `realloc`).

```c
int* arr = malloc(10 * sizeof(int)); // Dynamically allocated array of 10 integers
if (arr != NULL) {
    arr[0] = 1; // Set the first element
    // Use the array
    free(arr); // Don't forget to free the allocated memory
}
```

#### Limitations and Considerations
- **No Bounds Checking**: C does not perform bounds checking on arrays. Accessing out-of-bounds elements can lead to undefined behavior and potential security risks, such as buffer overflows.
- **Fixed Length**: The length of a static array is determined at compile-time and cannot be modified at runtime.

> Arrays are a powerful, low-level data structure that forms the basis for more complex data structures in C and other programming languages. They allow efficient data storage and access but require careful management to avoid common pitfalls such as buffer overflows.

### Structs
In C programming, a `struct` (or structure) is a user-defined data type that allows you to combine different data types into a single logical unit. This is particularly useful for grouping related data together to form more complex data structures. `typedef` is a keyword used to create an alias for a data type, making the code more readable and easier to manage, especially when dealing with structs and other compound data types.

#### Understanding Structs

A `struct` is defined using the `struct` keyword followed by the structure name and a block of member declarations enclosed in braces. Each member can be of any data type, including other structs or pointers.

##### Example of Struct Declaration:
```c
struct Person {
    char name[50];
    int age;
    float height;
};
```

#### Using Typedef with Structs

`typedef` can be used with structs to simplify the syntax when declaring variables of the struct type. Without `typedef`, you need to use the `struct` keyword each time you declare a variable of that type.

##### Example Using Typedef:
```c
typedef struct Person {
    char name[50];
    int age;
    float height;
} Person;

Person person1, person2; // Now you can declare variables without the 'struct' keyword
```

| Keyword  | Usage                        | Description                                                         | Example                                                       |
|----------|------------------------------|---------------------------------------------------------------------|---------------------------------------------------------------|
| `struct` | `struct StructName {...};`   | Defines a new structure type with various mixed data types.         | `struct Person { char name[50]; int age; float height; };`   |
| `typedef`| `typedef existingType NewType;` | Creates an alias for an existing data type for easier referencing. | `typedef struct Person { char name[50]; int age; float height; } Person;` |


#### Practical Usage of Structs and Typedef

- **Complex Data Structures**: Structs are used to model real-world entities into programmable structures, like creating a `Person` or `Car` model with relevant attributes.
- **Readability and Maintainability**: Using `typedef` with structs improves code readability and makes it easier to handle complex nested structures.
- **Type Abstraction**: `typedef` provides a level of abstraction which can help in making the code less dependent on specific data types, making it easier to modify the data type later if needed.

### Bitwise Operators
Bitwise operators in C are used for manipulating data at the bit level, which is essential in low-level programming where direct control over bits is required. These operators are used to perform bit-level operations on integers (both signed and unsigned).

### List of Bitwise Operators in C:

1. **AND (`&`)**: Performs a binary AND operation on each bit of its integer arguments. Each bit of the output is 1 if the corresponding bits of the operands are both 1, otherwise 0.
2. **OR (`|`)**: Performs a binary OR operation on each bit of its integer arguments. Each bit of the output is 1 if at least one of the corresponding bits of the operands is 1.
3. **XOR (`^`)**: Performs a binary XOR operation on each bit of its integer arguments. Each bit of the output is 1 if the corresponding bits of the operands are different, otherwise 0.
4. **NOT (`~`)**: Performs a binary NOT operation on each bit of its integer argument. Inverts the bits of its operand (0 becomes 1 and 1 becomes 0).
5. **Left Shift (`<<`)**: Shifts the bits of its left operand to the left by the number of positions specified by the right operand. New bits on the right are filled with zeros.
6. **Right Shift (`>>`)**: Shifts the bits of its left operand to the right by the number of positions specified by the right operand. For unsigned data, the new bits on the left are filled with zeros. For signed data, the behavior is implementation-defined (commonly, the sign bit is propagated).

| Operator | Symbol | Operation                                         | Example         | Result Explanation              |
|----------|--------|---------------------------------------------------|-----------------|---------------------------------|
| AND      | `&`    | Bitwise AND                                       | `5 & 3`         | `0101 & 0011` gives `0001` (1)  |
| OR       | `|`    | Bitwise OR                                        | `5 | 3`         | `0101 | 0011` gives `0111` (7)  |
| XOR      | `^`    | Bitwise XOR                                       | `5 ^ 3`         | `0101 ^ 0011` gives `0110` (6)  |
| NOT      | `~`    | Bitwise NOT                                       | `~5`            | `~0101` gives `1010` (varies based on bit width) |
| Left Shift | `<<` | Shift bits left, fill with 0s on the right       | `5 << 1`        | `0101 << 1` gives `1010` (10)  |
| Right Shift| `>>` | Shift bits right, fill based on the data type     | `5 >> 1`        | `0101 >> 1` gives `0010` (2)   |

**Note**: When using Markdown, especially in a context where you're using the pipe character (`|`) as text, make sure to either escape it using a backslash (`\|`) or format your document so that it's not confused with a table delimiter.

### Practical Applications of Bitwise Operators

- **Low-Level Hardware Interaction**: Bitwise operations are crucial for interacting with hardware where certain bits in registers need to be set or cleared.
- **Data Compression**: Bitwise operators can be used for compressing data by packing multiple information pieces in a single byte or sequence of bytes.
- **Efficiency**: Operations involving bits are very fast and can be used to improve performance in high-performance applications.

Bitwise operators provide a powerful toolset for control and optimization in embedded systems, graphics, communications, and wherever direct manipulation of data at the bit level is necessary.

### Pointers
Pointers in C are fundamental to programming in this language, providing powerful and flexible tools for manipulating memory and enhancing performance. A pointer is a variable that stores the memory address of another variable, allowing for direct access and modification of its value.

#### Concepts of Pointers

1. **Definition**: A pointer is defined by specifying the data type of the variable it points to. This determines the type of data the pointer can address.
   
2. **Initialization**: A pointer can be initialized to the address of a variable using the address-of operator (`&`).

3. **Dereferencing**: Using the dereference operator (`*`), you can access or modify the value at the address the pointer is pointing to.

4. **Pointer Arithmetic**: C allows arithmetic operations on pointers, where you can increment (`++`), decrement (`--`), or perform other arithmetic to traverse through memory locations.

5. **Null Pointer**: A special value (typically `0` or `NULL`) used to signify that a pointer does not point to any valid memory area.

6. **Pointer to Pointer**: C allows for multiple levels of indirection, e.g., a pointer to a pointer, which can further increase the flexibility of memory access.

#### Example Uses of Pointers

- **Array Traversal**: By incrementing a pointer initialized to the address of an array, you can traverse the array.
- **Dynamic Memory Allocation**: Using pointers with functions like `malloc()`, `calloc()`, and `free()`, you can allocate and manage dynamic memory during runtime.
- **Function Pointers**: Pointers to functions allow for dynamic invocation of functions and are used extensively in callback mechanisms.
- **Pass-by-Reference**: C uses pointers to achieve pass-by-reference, allowing functions to modify the value of the arguments.

#### Table of Pointer Operations

| Concept               | Syntax/Example                                 | Description                                                   |
|-----------------------|------------------------------------------------|---------------------------------------------------------------|
| Pointer Declaration   | `int *ptr;`                                    | Declare a pointer to an integer.                              |
| Initialization        | `int x = 10; ptr = &x;`                        | Initialize a pointer to the address of variable `x`.          |
| Dereferencing         | `int value = *ptr;`                            | Access the value at the address stored in `ptr`.              |
| Address-of Operator   | `int *ptr = &x;`                               | Get the address of variable `x`.                              |
| Pointer Arithmetic    | `ptr++;`                                       | Move the pointer to the next integer position.                |
| Null Pointer          | `int *ptr = NULL;`                             | Assign a null value to a pointer.                             |
| Pointer to Pointer    | `int **pptr = &ptr;`                           | Declare a pointer to another pointer.                         |
| Function Pointer      | `void (*funcPtr)() = &functionName;`           | Declare a pointer to a function `functionName`.               |
| Dynamic Memory        | `ptr = (int*)malloc(10 * sizeof(int));`        | Allocate memory dynamically for 10 integers.                  |


#### Key Points

- **Memory Safety**: Incorrect usage of pointers, such as dereferencing uninitialized pointers (wild pointers) or pointers to freed memory (dangling pointers), can lead to undefined behavior and security vulnerabilities.
- **Type Safety**: It is crucial to ensure that pointers are used with the correct type to avoid runtime errors and data corruption. The pointers type must be the same as the referenced variable's type.
- **Memory Leaks**: Mismanagement of dynamic memory (e.g., not freeing allocated memory) can lead to memory leaks, which are problematic in long-running programs.

Understanding and using pointers effectively is crucial for developing efficient and powerful C programs, as they provide direct access to memory and facilitate complex data structures like linked lists, trees, and more.

## Combinatorial Logic
Boolean algebra is a branch of algebra that deals with binary variables and logical operations. It forms the basis for designing and analyzing digital circuits and systems. Here are the fundamental properties of Boolean algebra that are commonly used:

### Boolean Laws
#### 1. Identity Laws
- **Identity Law for OR**: \( A + 0 = A \)
- **Identity Law for AND**: \( A \cdot 1 = A \)

#### 2. Null Laws
- **Null Law for OR**: \( A + 1 = 1 \)
- **Null Law for AND**: \( A \cdot 0 = 0 \)

#### 3. Idempotent Laws
- **Idempotent Law for OR**: \( A + A = A \)
- **Idempotent Law for AND**: \( A \cdot A = A \)

#### 4. Dominance Laws
- **Dominance Law for OR**: \( A + 1 = 1 \)
- **Dominance Law for AND**: \( A \cdot 0 = 0 \)

#### 5. Complement Laws
- **Complement Law for OR**: \( A + A' = 1 \)
- **Complement Law for AND**: \( A \cdot A' = 0 \)

#### 6. Commutative Laws
- **Commutative Law for OR**: \( A + B = B + A \)
- **Commutative Law for AND**: \( A \cdot B = B \cdot A \)

#### 7. Associative Laws
- **Associative Law for OR**: \( (A + B) + C = A + (B + C) \)
- **Associative Law for AND**: \( (A \cdot B) \cdot C = A \cdot (B \cdot C) \)

#### 8. Distributive Laws
- **Distributive Law for OR over AND**: \( A + (B \cdot C) = (A + B) \cdot (A + C) \)
- **Distributive Law for AND over OR**: \( A \cdot (B + C) = (A \cdot B) + (A \cdot C) \)

#### 9. Absorption Laws
- **Absorption Law for OR**: \( A + AB = A \)
- **Absorption Law for AND**: \( A(A + B) = A \)

#### 10. Involution Law
- **Involution**: \( (A')' = A \)

#### 11. De Morgan's Theorems
- **De Morgan's for OR**: \( (A + B)' = A' \cdot B' \)
- **De Morgan's for AND**: \( (A \cdot B)' = A' + B' \)

These properties and theorems are instrumental in simplifying Boolean expressions, which can reduce the complexity of logic circuits. They are also essential for proving equivalences between different Boolean expressions or circuits, which is a critical task in digital logic design and optimization.


### Final Practice
Complete the following functions to generate different sequences of numbers:

- `int* Fibonacci(int n)`
  - Create an array of integers and size n
  - Fill in the array with the first n Fibonacci numbers. The Fibonacci sequence begins with 0 and then 1 follows. All subsequent values are the sum of the previous two, ex: 0, 1, 1, 2, 3, 5, 8, 13.
  - Return the array
- `int* Squares(int n)`
  - Create an array of integers and size n
  - Fill in the array with the squares of 1 to n (inclusive). Ex: 1, 4, 9, …, n2
  - Return the array
- `int* Concatenate(int* array1, int size1, int* array2, int size2)`
  - Create an array of integers and size = size1 + size2
  - Fill in the array with the elements of array1 followed by the elements of array2
  - Return the array
  - main() reads the size of the Fibonacci and the squares sequences and calls the three functions above to create the arrays. Then main() calls PrintArray() provided in the template to print the arrays.

Ex: If the input is:

```
6 4
```
the output is:

```
0 1 1 2 3 5 
1 4 9 16 
0 1 1 2 3 5 1 4 9 16
```
> My Interpretation: 


```c
#include <stdio.h>
#include <stdlib.h>

void PrintArray(int* array, int size) {
   for (int j = 0; j < size; ++j) {
      printf("%d ", array[j]);
   }
}

// Return the first n Fibonacci numbers
int* Fibonacci(int n) {
   int* seq = malloc(n * sizeof(int)); // Allocate memory for n integers
   if (n > 0) seq[0] = 0; // First Fibonacci number
   if (n > 1) seq[1] = 1; // Second Fibonacci number

   for (int j = 2; j < n; ++j) {
      seq[j] = seq[j - 1] + seq[j - 2];
   }

   return seq;
}

// Return sequence of squares for 1..n (inclusive)
int* Squares(int n) {
   int* seq = malloc(n * sizeof(int)); // Allocate memory for n integers

   for (int j = 0; j < n; ++j) {
      seq[j] = (j + 1) * (j + 1); // Square of (j + 1)
   }

   return seq;
}

// Return an array that is a copy of array1 followed by the elements of array2
int* Concatenate(int* array1, int size1, int* array2, int size2) {
   int* seq = malloc((size1 + size2) * sizeof(int)); // Allocate memory for size1 + size2 integers

   for (int j = 0; j < size1; ++j) {
      seq[j] = array1[j]; // Copy elements of array1
   }
   for (int j = 0; j < size2; ++j) {
      seq[size1 + j] = array2[j]; // Copy elements of array2
   }

   return seq;
}

int main(void) {

   int fibn; // Number of Fibonacci numbers
   int sqrn; // Number of squares
   scanf("%d %d", &fibn, &sqrn);

   int* fibs;
   int* sqrs;
   int* conc;

   fibs = Fibonacci(fibn);
   PrintArray(fibs, fibn);
   printf("\n");

   sqrs = Squares(sqrn);
   PrintArray(sqrs, sqrn);
   printf("\n");

   conc = Concatenate(fibs, fibn, sqrs, sqrn);
   PrintArray(conc, fibn + sqrn);
   printf("\n");

   // Free the dynamically allocated memory
   free(fibs);
   free(sqrs);
   free(conc);

   return 0;
}
```

Program Breakdown:

1. **Including Headers and Defining Functions:**
   - `#include <stdio.h>`: This includes the Standard Input Output header file, allowing the use of input/output functions like `printf` and `scanf`.
   - `#include <stdlib.h>`: This includes the Standard Library header file, which is necessary for memory allocation and management functions such as `malloc` and `free`.

2. **PrintArray Function:**
   - `void PrintArray(int* array, int size)`: This function takes a pointer to an integer array and the size of the array as arguments. It iterates through the array and prints each element followed by a space. This function is used to output the results of the various sequences generated in the program.

3. **Fibonacci Function:**
   - `int* Fibonacci(int n)`: This function generates the first `n` Fibonacci numbers and returns a pointer to the array containing these numbers. Memory for `n` integers is allocated using `malloc`. The Fibonacci sequence starts with 0 and 1, and every subsequent number is the sum of the two preceding ones. The function fills the array accordingly and returns it.

4. **Squares Function:**
   - `int* Squares(int n)`: This function calculates the squares of integers from 1 to `n` and returns a pointer to the array containing these square numbers. Memory for `n` integers is allocated, and each element at index `j` is set to `(j+1)*(j+1)`.

5. **Concatenate Function:**
   - `int* Concatenate(int* array1, int size1, int* array2, int size2)`: This function takes two arrays and their sizes as input, allocates memory for a new array that can hold the contents of both input arrays, and then fills this new array first with the elements of `array1` and then with `array2`. It returns a pointer to the concatenated array.

6. **Main Function:**
   - `int main(void)`: This is the main function where execution begins. The user is prompted to enter two integers, `fibn` and `sqrn`, which represent the number of Fibonacci numbers and square numbers to be generated, respectively.
   - The Fibonacci numbers for `fibn` and the square numbers for `sqrn` are generated by calling `Fibonacci(fibn)` and `Squares(sqrn)`. The results are stored in dynamically allocated arrays `fibs` and `sqrs`.
   - The `PrintArray` function is called three times to print the Fibonacci sequence, the square numbers, and their concatenated result.
   - Memory cleanup is performed using `free` to release the dynamically allocated memory for `fibs`, `sqrs`, and the concatenated array `conc`.

7. **Memory Management:**
   - The program carefully manages memory using `malloc` for allocation and `free` for deallocation, ensuring no memory leaks occur.