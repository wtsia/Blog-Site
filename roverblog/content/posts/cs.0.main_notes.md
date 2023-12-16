+++
author = "Winston Tsia"
authorlink = ""
title = "Computer Science Notes"
date = 2022-08-28T16:52:54-07:00
description = "Notes on Data Structures, Algorithms, and other broad topics in computer science"
tags = [
    "Data Structures",
    "Algorithms"
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

![Replacement Text](/rover/img/ComputerScience/rubik.jpg)

# Contents
- [Contents](#contents)
- [Basics](#basics)
  - [Bits/Bytes](#bitsbytes)
  - [Computer](#computer)
  - [8 Patterns Everyone Should Know](#8-patterns-everyone-should-know)
    - [Factory (Creational)](#factory-creational)
    - [Builder (Creational)](#builder-creational)
    - [Singleton (Creational)](#singleton-creational)
    - [Observer (Behavioral)](#observer-behavioral)
    - [Iterator (Behavioral)](#iterator-behavioral)
    - [*Strategy* (Behavioral)](#strategy-behavioral)
    - [Adapter (Structural)](#adapter-structural)
    - [Facade (Structural)](#facade-structural)
- [Complexity](#complexity)
  - [Time Complexity (TC)](#time-complexity-tc)
  - [Space Complexity (SC)](#space-complexity-sc)
- [Data Structures and Algorithms](#data-structures-and-algorithms)
  - [Algorithms](#algorithms)
  - [Dynamic Programming \& Memoization](#dynamic-programming--memoization)
  - [Algorithm Efficiency: Big $O/\\Omega$-Notation](#algorithm-efficiency-big-oomega-notation)
    - [O-notation](#o-notation)
    - [$\\Omega$-notation](#omega-notation)
# Basics
Some good development practices:
1. being resourceful (Learn to solve problems, develop critical thinking, discuss issues with teammates, read documentation) 
2. version control (advanced concepts in GIT and GITHUB)
3. data structure & code efficiency ( learn how to manipulate data in a creative way so that you can save time and storage)
4. scripting and automation (learn how to speed making scripts of tasks that are repetitive and that can make you save a ton of time)
5. Asynchronous programming  (learn how run programs in "parallel" )
6. CI & CD : continuous integration and continuous deployment (take at least the basic concepts)
7. clear and precise and accurate communication
## Bits/Bytes
- `0`s and `1`s are known as bits--*binary digits*
- Bytes are `8` bits

## Computer
- `input/output device`: peripherals, keyboards, screens.
- `storage`: non-volatile. Magnetic particles orientated in a `0`/`1` position. Disk vs memory. Disk applies a head that pulses electricity. Other method tunnel electrons into special circuits on memory's chip, and removes it with a 'flash' of electrcity. 
- `memory`: RAM. volatile. Gives the ability to access memory in arbitrary order in a few ticks over hundreds from disks. 
- `processor`: executes read/write instructions, accesses memory as well as memory from cache (a mini-RAM, accessible in 1 clock tick). Initiates BIOS, then OS. 
- `clock`: The clock speed is typically measured in Hertz (Hz) and represents the number of clock cycles a CPU can execute in one second. Common units for clock speed include Megahertz (MHz) and Gigahertz (GHz), where 1 MHz equals one million cycles per second, and 1 GHz equals one billion cycles per second

## 8 Patterns Everyone Should Know
Creational, Structural, Behvaioral Patterns (in `Python`)
### Factory (Creational)

Create a 'factory' that instantiates an object for us using parameters as input for what 'type' of object we want.
```
class Dog:
    def __init__(self, name):
        self._name = name

    def speak(self):
        return "Woof!"

class Cat:
    def __init__(self, name):
        self._name = name

    def speak(self):
        return "Meow!"

def get_pet(pet="dog"):
    pets = dict(dog=Dog("Hope"), cat=Cat("Peace"))
    return pets[pet]

my_pet = get_pet("dog")
print(my_pet.speak())  # Output: Woof!

```

### Builder (Creational)
Create a builder that has methods to "build" our object instead of passing parameters during instantiation.
```
class Burger:
    def __init__(self, size, cheese=False, pepperoni=False, lettuce=False):
        self.size = size
        self.cheese = cheese
        self.pepperoni = pepperoni
        self.lettuce = lettuce

class BurgerBuilder:
    def __init__(self, size):
        self.burger = Burger(size)

    def add_cheese(self):
        self.burger.cheese = True
        return self

    def add_pepperoni(self):
        self.burger.pepperoni = True
        return self

    def add_lettuce(self):
        self.burger.lettuce = True
        return self

    def build(self):
        return self.burger

builder = BurgerBuilder(4)
burger = builder.add_cheese().add_pepperoni().build()

```

### Singleton (Creational)
An object which only has a single instance instantiated, which is referenced by other objects. AKA a shared mutable state. 
```
class Singleton:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(Singleton, cls).__new__(cls)
        return cls._instance

# Usage
s1 = Singleton()
s2 = Singleton()

print(s1 is s2)  # Output: True

```
### Observer (Behavioral)
A subject/publisher can maintain a list of observers to which one action may be called and act on observers. 
```
class Subject:
    def __init__(self):
        self._observers = []

    def attach(self, observer):
        self._observers.append(observer)

    def detach(self, observer):
        self._observers.remove(observer)

    def notify(self, message):
        for observer in self._observers:
            observer.update(message)

class Observer:
    def __init__(self, name):
        self._name = name

    def update(self, message):
        print(f"{self._name} received message: {message}")

# Usage
subject = Subject()
observer1 = Observer("Observer 1")
observer2 = Observer("Observer 2")

subject.attach(observer1)
subject.attach(observer2)

subject.notify("Hello!")

# Output:
# Observer 1 received message: Hello!
# Observer 2 received message: Hello!

```

### Iterator (Behavioral)
Defines how the values of an object can be iterated through.
```
class MyIterator:
    def __init__(self, data):
        self._data = data
        self._index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self._index < len(self._data):
            result = self._data[self._index]
            self._index += 1
            return result
        else:
            raise StopIteration

# Usage
my_list = [1, 2, 3, 4, 5]
my_iter = MyIterator(my_list)

for item in my_iter:
    print(item)

# Output:
# 1
# 2
# 3
# 4
# 5

```
### *Strategy* (Behavioral)
Fancy version of using an interface. Uses Open/Closed principle. You create an interface and define logic under it. 

>"programming at an interface level"

```
class PaymentStrategy:
    def pay(self, amount):
        pass

class CreditCardPayment(PaymentStrategy):
    def pay(self, amount):
        print(f"Paid ${amount} with Credit Card")

class PayPalPayment(PaymentStrategy):
    def pay(self, amount):
        print(f"Paid ${amount} with PayPal")

class ShoppingCart:
    def __init__(self, payment_strategy):
        self._items = []
        self._payment_strategy = payment_strategy

    def add_item(self, item):
        self._items.append(item)

    def checkout(self):
        total = sum(item.price for item in self._items)
        self._payment_strategy.pay(total)

# Usage
cart = ShoppingCart(CreditCardPayment())
cart.add_item(Item("Item 1", 25))
cart.add_item(Item("Item 2", 15))
cart.checkout()

# Output: Paid $40 with Credit Card

```
### Adapter (Structural)
Adapting a class into another s.t. it allows two incompatible interfaces to work together. It acts as a bridge between two existing classes, making them work together without changing their source code.
```
# Existing class with an incompatible interface
class OldSystem:
    def do_old_stuff(self):
        return "Old System is doing its stuff."

# Adapter class that adapts the OldSystem to a new interface
class Adapter:
    def __init__(self, old_system):
        self._old_system = old_system

    def do_new_stuff(self):
        # Delegate the call to the old system's method
        return self._old_system.do_old_stuff()

# Client code
def client_code(target):
    result = target.do_new_stuff()
    print(result)

# Usage
old_system = OldSystem()          # Existing class instance
adapter = Adapter(old_system)     # Adapter wraps the existing class
client_code(adapter)              # Client interacts with the adapter


```
### Facade (Structural)
Design pattern that provides a simplified, higher-level interface to a complex system, a set of interfaces, or a group of classes. It hides the complexities of the underlying components and provides a unified interface that is easier to use. The facade pattern is often used to improve the usability and maintainability of a system by reducing the dependencies between clients and subsystems.
```
class SubsystemA:
    def operation_a(self):
        return "Subsystem A is doing its operation."

class SubsystemB:
    def operation_b(self):
        return "Subsystem B is doing its operation."

class Facade:
    def __init__(self):
        self._subsystem_a = SubsystemA()
        self._subsystem_b = SubsystemB()

    def do_complex_operation(self):
        result_a = self._subsystem_a.operation_a()
        result_b = self._subsystem_b.operation_b()
        return f"Complex operation: {result_a} {result_b}"

# Usage
facade = Facade()
result = facade.do_complex_operation()

```


# Complexity
## Time Complexity (TC)
Time complexity measures time taken to execute each statement of code in an algorithm. It is going to give information about the variation (increase or decrease) in execution time when the number of operations (increase or decrease) in an algorithm. Time complexity is a function of input length $l$, where output is time $t$ or:
$$
f(l) = t
$$

or more commonly:
$$
O(x), x \in 1, n, n^2, \log n, n \log n, 2^n, n! ...
$$

Where $O(x)$ denotes O-notation, or "Order" notation. See [Algorithm Efficiency](#algorithm-efficiency-big-o-notation).

A time-complexity analysis will require evaluating run time on each step of a program.

> Time complexity deals with finding out how the computational time of an algorithm changes with the change in size of the input.

## Space Complexity (SC)
While Space Complexity may also be described by O-notation, they are unrelated and not dependent on each other. For example, an $O(1)$ space complexity denotes the same amount of space usage per input data of any size.

A program that uses a variable to swap values, while swapping multiple values for the variable, will still only use one variable.

> Space complexity deals with finding out how much (extra) space would be required by the algorithm with change in the input size.

References: [Differences between time complexity and space complexity?](https://stackoverflow.com/questions/18686121/differences-between-time-complexity-and-space-complexity#:~:text=Time%20complexity%20deals%20with%20finding,change%20in%20the%20input%20size.)

# Data Structures and Algorithms

## [Algorithms](./posts/cs.0.algorithms)
See section header link for detailed notes.

## Dynamic Programming & Memoization
A way of making algorithms more efficient by storing the intermediary results.
- Memoization: In computing, memoization or memoisation is an optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again

Examples: 
- `fib(n)`

## Algorithm Efficiency: Big $O/\Omega$-Notation
- Space complexity: relationship between growth of input size and growth of space needed

### O-notation
Ranked closeness from Elements to Operations (Also good to bad)

$O(1)$, $O(log n)$, $O(n)$, $O(n log n)$, $O(n^2)$, $O(2^n)$, $O(n!)$
- denotes **maximum** bound for runtime.
### $\Omega$-notation
$\Omega (n)$
- denotes **minimum** bound for runtime. 

