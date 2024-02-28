+++
author = "Winston Tsia"
authorlink = ""
title = "Cs.console Notes"
date = 2024-02-27T15:40:22-08:00
description = "Notes on Cs.console Notes"
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
- [Windows](#windows)
  - [Command Prompt](#command-prompt)
    - [Creating Files](#creating-files)
  - [Scripts](#scripts)
    - [Creating Scripts](#creating-scripts)
    - [CLI](#cli)

# Windows
## Command Prompt
### Creating Files
To create a file in Windows, you can use several methods:

1. **Using Command Prompt:**
   Open Command Prompt and use the `echo` command to create a file. For example:
   ```
   echo Hello, world! > myfile.txt
   ```
   This will create a file named `myfile.txt` with the content "Hello, world!".

2. **Using Notepad:**
   Open Notepad, write the content you want in the file, then go to File > Save As, choose the location and filename, and click Save.

3. **Using PowerShell:**
   You can use PowerShell to create files. For example:
   ```
   Set-Content -Path "myfile.txt" -Value "Hello, world!"
   ```

4. **Using File Explorer:**
   You can also create a file by right-clicking in the File Explorer, selecting New > Text Document, and then renaming the file as needed.

## Scripts

### Creating Scripts

To create a batch script (a file with a `.bat` extension) using the Command Line Interface (CLI) in Windows, you can use any text editor like Notepad or you can use the command prompt itself. Here's how to create a batch script using the command prompt:

1. Open Command Prompt.
2. Navigate to the directory where you want to create the batch script using the `cd` command (e.g., `cd path\to\directory`).
3. Type `copy con filename.bat` and press Enter. Replace `filename` with the name you want for your batch script.
4. Type your batch script commands.
5. Press `Ctrl + Z`, then Enter to save the file and exit.

For example, to create a batch script that displays "Hello, World!" when executed:

```
copy con hello.bat
echo Hello, World!
^Z
```

This will create a batch script named `hello.bat` in the current directory, containing the single line `echo Hello, World!`.

After creating the batch script, you can execute it by simply typing its name in the command prompt and pressing Enter (e.g., `hello.bat`).

### CLI 
EXAMPLE: removing duplicate `mp3` files (first echoing):

```bat
FOR %f IN ("C:\Directory\SubDirectory\*(?).mp3") DO echo "%f"
```
This Windows command is a `for` loop that iterates over files matching a specific pattern in a given directory and its subdirectories:

1. **`FOR %f IN ("C:\Directory\SubDirectory\*(?).mp3") DO`:** This is the beginning of the `for` loop. It sets up a loop that iterates over files that match the specified pattern.

   - `FOR %f`: This sets up a loop variable `%f` that represents each file matched by the pattern.
   - `IN ("C:\Directory\SubDirectory\*(?).mp3")`: This specifies the set of files to iterate over. The pattern `"C:\Directory\SubDirectory\*(?).mp3"` is enclosed in double quotes and represents the path to a directory (`C:\Directory\SubDirectory`) and a wildcard pattern for files (`*(?).mp3`). The `*` represents any sequence of characters, `?` represents any single character, and `.mp3` specifies that the files should have a `.mp3` extension. This will be replaced by `del "%f"`.

2. **`echo "%f"`:** This is the command executed for each file matched by the pattern. It echoes (prints) the name of the file enclosed in double quotes (`"`). `%f` is replaced with the name of each matched file during each iteration of the loop.
 - Note that a batch script will interpret the `"%f"`, so `"%%f"` must be used.
