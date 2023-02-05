+++
author = "Winston Tsia"
authorlink = ""
title = "C Programming"
date = 2023-01-23T23:09:27-08:00
description = "Notes on C Programming"
tags = [
    "C++"
]
categories = [
    "Computer Science",
    "Programming"
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
- [Basics of C++ Programming](#basics-of-c-programming)
  - [Compiling](#compiling)

# Basics of C++ Programming
- Program begins with `main()`, executing statements in braces `{}`
- statements on a line ends with a semicolon

```
#include <iostream>

main() {
    /*
    Enter statements here
    cin >> "Input goes into this thing"
    cout << "This thing prints out"

    */
    // or here
}
```

## Compiling
Programs can still compile with logic errors. Compile to show all logic errors via:
```
g++ -Wall yourfile.cpp
```


