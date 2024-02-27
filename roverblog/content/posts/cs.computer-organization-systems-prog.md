+++
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
- [Bits, Bytes, and Integers](#bits-bytes-and-integers)
    - [Bitwise Operations in C](#bitwise-operations-in-c)
    - [Example](#example)
    - [Logical and Arithmetic Shifts in C](#logical-and-arithmetic-shifts-in-c)
    - [Example](#example-1)
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

# Bits, Bytes, and Integers
Bits are stored as `0` or `1`.

Bytes are `8` bits.

| C Data Type  | Typical 32-bit | Typical 64-bit | x86-64 |
|--------------|-----------------|----------------|--------|
| char         | 1               | 1              | 1      |
| short        | 2               | 2              | 2      |
| int          | 4               | 4              | 4      |
| long         | 4               | 8              | 8      |
| float        | 4               | 4              | 4      |
| double       | 8               | 8              | 8      |
| long double  | -               | -              | 10/16  |
| pointer      | 4               | 8              | 8      |

### Bitwise Operations in C

In C, you can perform various bit-level operations using bitwise operators. These operators manipulate individual bits within integer variables.

1. **Bitwise AND (`&`)**:
   - Performs a bitwise AND operation on each pair of corresponding bits.
   - Returns 1 if both bits are 1, otherwise, returns 0.

2. **Bitwise OR (`|`)**:
   - Performs a bitwise OR operation on each pair of corresponding bits.
   - Returns 1 if at least one of the bits is 1, otherwise, returns 0.

3. **Bitwise XOR (`^`)**:
   - Performs a bitwise XOR (exclusive OR) operation on each pair of corresponding bits.
   - Returns 1 if the bits are different, otherwise, returns 0.

4. **Bitwise NOT (`~`)**:
   - Performs a bitwise NOT (complement) operation on each bit.
   - Flips each bit from 0 to 1 and from 1 to 0.

5. **Left Shift (`<<`)**:
   - Shifts the bits of a number to the left by a specified number of positions.
   - Effectively multiplies the number by 2 to the power of the specified shift amount.

6. **Right Shift (`>>`)**:
   - Shifts the bits of a number to the right by a specified number of positions.
   - Effectively divides the number by 2 to the power of the specified shift amount, rounding towards negative infinity for signed integers.
   - **LOGICAL**: Fill with 0s on left
   - **ARITHMETIC**:  Replicate most significant bit on left

### Example

```c
#include <stdio.h>

int main() {
    unsigned int a = 60;    // Binary: 0011 1100
    unsigned int b = 13;    // Binary: 0000 1101

    // Bitwise AND
    printf("a & b = %d\n", a & b);  // Output: 12 (Binary: 0000 1100)

    // Bitwise OR
    printf("a | b = %d\n", a | b);  // Output: 61 (Binary: 0011 1101)

    // Bitwise XOR
    printf("a ^ b = %d\n", a ^ b);  // Output: 49 (Binary: 0011 0001)

    // Bitwise NOT
    printf("~a = %d\n", ~a);        // Output: -61 (Binary: 1100 0011)

    // Left Shift
    printf("a << 2 = %d\n", a << 2); // Output: 240 (Binary: 1111 0000)

    // Right Shift
    printf("a >> 2 = %d\n", a >> 2); // Output: 15 (Binary: 0000 1111)

    return 0;
}
```
### Logical and Arithmetic Shifts in C

In C, when performing right shifts (`>>`) on signed integer types, there are two types of shifts: logical shift and arithmetic shift.

1. **Logical Shift**:
   - In a logical shift, zeros are shifted into the vacant bits, regardless of the sign of the number.
   - Logical right shift (`>>`) on positive numbers behaves like division by powers of 2.
   - Logical right shift on negative numbers is equivalent to dividing the magnitude by powers of 2 and truncating towards zero.

2. **Arithmetic Shift**:
   - In an arithmetic shift, the most significant bit (sign bit) is replicated into the vacant bits.
   - Arithmetic right shift (`>>`) on negative numbers preserves the sign of the number.
   - Arithmetic right shift on positive numbers behaves like division by powers of 2 but preserves the sign.

### Example

```c
#include <stdio.h>

int main() {
    int num1 = -16;  // Binary: 1111 1111 1111 0000
    int num2 = 16;   // Binary: 0000 0000 0001 0000

    // Logical Right Shift
    printf("Logical Right Shift:\n");
    printf("%d >> 2 = %d\n", num1, num1 >> 2); // Output: -4 (Binary: 1111 1111 1111 1100)
    printf("%d >> 2 = %d\n", num2, num2 >> 2); // Output: 4 (Binary: 0000 0000 0000 0100)

    // Arithmetic Right Shift
    printf("\nArithmetic Right Shift:\n");
    printf("%d >> 2 = %d\n", num1, num1 >> 2); // Output: -4 (Binary: 1111 1111 1111 1100)
    printf("%d >> 2 = %d\n", num2, num2 >> 2); // Output: 4 (Binary: 0000 0000 0000 0100)

    return 0;
}
```

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