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