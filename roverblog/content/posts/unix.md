+++
author = "Winston Tsia"
authorlink = ""
title = "UNIX"
date = 2022-08-18T14:01:59-07:00
description = "Description"
tags = [
    "UNIX",
    "CIS",
    "Computer Science",
]
categories = [
    "Computer Science",
]
math = true
notaxonomy = false
images = ["/img/UNIX/UnixFamilies.png"]
imagetext = "The 3 major families of the Linux Kernel"
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
# Contents
- [Contents](#contents)
- [Quick Concepts](#quick-concepts)
- [UNIX Systems](#unix-systems)
  - [Introduction](#introduction)
  - [1. Linux Foundation](#1-linux-foundation)
    - [Families](#families)
      - [Summary](#summary)
    - [Debian / Ubuntu Linux: *Searching For Package by Name*](#debian--ubuntu-linux-searching-for-package-by-name)
- [2. Linux Philosophy and Concepts](#2-linux-philosophy-and-concepts)
  - [Boot](#boot)
    - [GUI: X Windows, GNOME](#gui-x-windows-gnome)
      - [SUMMARY](#summary-1)
    - [NTP, Software Management](#ntp-software-management)
    - [Common Apps](#common-apps)
    - [CLI operations](#cli-operations)
      - [SUMMARY](#summary-2)
    - [Documentation](#documentation)
    - [Filesystem](#filesystem)
    - [Editing Text Files](#editing-text-files)
    - [Networking](#networking)
    - [Security](#security)
# Quick Concepts
- `dmidecode`:
- `hostnamectl`: `hostnamectl hostname <name>`
- `htop` vs `atop` vs `iftop`

# UNIX Systems

## Introduction
- Discuss the role of The Linux Foundation.
- Appreciate the learning opportunities provided by The Linux Foundation's training program.
- Describe the software environment required for this course.
- Describe the three major Linux distribution families.

## 1. Linux Foundation
- The Linux Foundation was founded in 2000 by Linus Torvalds and lead maintainer Greg Kroah-Hartman. The Linux Foundation promotes open source collaboration at all vertical levels from software to hardware and applies best practices to make open collaboration sustainable. 
- The Linux System sees use in big data and analytics, networking, embedded systems and IoT, webtools, cloud computing, edge computing, automotive, security, blockchain, and many more

### Families
- Red Hat Family Systems (including CentOS and Fedora)
  - CentOS, CentOS Stream, Fedora and Oracle Linux
    - Fedora: Worked on by non-Red Hat developers. Also used as a testing platform for future RHEL releases.
- SUSE Family Systems (including openSUSE)
- Debian Family Systems (including Ubuntu and Linux Mint).
#### Summary
- Fedora serves as an upstream testing platform for RHEL.
- CentOS is a close clone of RHEL, while Oracle Linux is mostly a copy with some changes (in fact, CentOS has been part of Red Hat since 2014).
- A heavily patched version 3.10 kernel is used in RHEL/CentOS 7, while version 4.18 is used in RHEL/CentOS 8.
- It supports hardware platforms such as Intel x86, Arm, Itanium, PowerPC, and IBM System z.
- It uses the yum and dnf RPM-based yum package managers (covered in detail later) to install, update, and remove packages in the system.
- RHEL is widely used by enterprises which host their own systems.

### Debian / Ubuntu Linux: *Searching For Package by Name*

Use dpkg command. It is a package manager for Debian/Ubuntu Linux. Suppose you want to find out package apache-perl or sudo is installed or not, type command:

`$ dpkg -s <package-name>`

>The Linux Foundation is the umbrella organization for many critical open source projects that power corporations, spanning all industry sectors. Its work today extends far beyond Linux, fostering innovation at every layer of the software stack. The Linux Foundation training is for the community and by the community. Linux training is distribution-flexible, technically advanced, and created with the leaders of the Linux development community. There are three major distribution families within Linux: Red Hat, SUSE and Debian. In this course, we will work with representative members of all of these families throughout.

# 2. Linux Philosophy and Concepts
- Linux borrows heavily from the UNIX operating system, with which its creators were well-versed.
- Linux accesses many features and services through files and file-like objects.
- Linux is a fully multi-tasking, multi-user operating system, with built-in networking and service processes known as daemons.
- Linux is developed by a loose confederation of developers from all over the world, collaborating over the Internet, with Linus Torvalds at the head. Technical skill and a desire to contribute are the only qualifications for participating.
- The Linux community is a far reaching ecosystem of developers, vendors, and users that supports and advances the Linux operating system.
- Some of the common terms used in Linux are: kernel, distribution, boot loader, service, filesystem, X Window system, desktop  environment, and command line.
- A full Linux distribution consists of the kernel plus a number of other software tools for file-related operations, user management, and software package management.

## Boot
- ON -> BIOS -> Master Boot Record (1st Sector on HD) -> Kernel (Linux OS) -> Initial RAM -> /sbin/init (parent process) -> Command Shell using getty -> X Windows System
- BIOS: Basic Input Output System
- POST: Power On Self Test
- Master Boot Record: 512 bytes--finds partition table + bootable partition, searches GRUB and loads into RAM
  - UEFI 
- initramfs
- /sbin/init 
- text-mode login
- Filesystem Hierarchy Standard (Linux storage)
- A partition is a logical part of the disk.
- A filesystem is a method of storing/finding files on a hard disk.
- By dividing the hard disk into partitions, data can be grouped and separated as needed. When a failure or mistake occurs, only the data in the affected partition will be damaged, while the data on the other partitions will likely survive.
- The boot process has multiple steps, starting with BIOS, which triggers the boot loader to start up the Linux kernel. From there, the initramfs filesystem is invoked, which triggers the init program to complete the startup process.
- Determining the appropriate distribution to deploy requires that you match your specific system needs to the capabilities of the different distributions.

### GUI: X Windows, GNOME
- `startx`: runs GUI
- GNOME
  - `gdm` default disp manager @ GNOME, `lightdm` (Ubuntu before 18.04LTS), `kdm` (KDE), `XFCE`, `LXDE`
  - *gnome-tweaks*
#### SUMMARY
- GNOME is a popular desktop environment and graphical user interface that runs on top of the Linux operating system.
- The default display manager for GNOME is called gdm.
- The gdm display manager presents the user with the login screen, which prompts for the login username and password.
- Logging out through the desktop environment kills all processes in your current X session and returns to the display manager login screen.
- Linux enables users to switch between logged-in sessions.
- Suspending puts the computer into sleep mode.
- For each key task, there is generally a default application installed.
- Every user created in the system will have a home directory.
- The Places menu contains entries that allow you to access different parts of the computer and the network.
- Nautilus gives three formats to view files.
- Most text editors are located in the Accessories submenu.
- Each Linux distribution comes with its own set of desktop backgrounds.
- GNOME comes with a set of different themes which can change the way your applications look.

### NTP, Software Management
- It supports many VPN technologies, such as native IPSec, Cisco OpenConnect (via either the Cisco client or a native open source client), Microsoft PPTP, and OpenVPN.
- apt (advanced package tool) -> dpkg-installer -> Debian family Linux
- You can control basic configuration options and desktop settings through the System Settings panel.
- Linux always uses Coordinated Universal Time (UTC) for its own internal time-keeping. You can set the date and time settings from the System Settingswindow.
- The Network Time Protocol is the most popular and reliable protocol for setting the local time via Internet servers.
- The Displays panel allows you to change the resolution of your display and configure multiple screens.
- Network Manager can present available wireless networks, allow the choice of a wireless or mobile broadband network, handle passwords, and set up VPNs.
- dpkg and RPM are the most popular package management systems used on Linux distributions.
- Debian distributions use dpkg and apt-based utilities for package management.
- RPM was developed by Red Hat, and adopted by a number of other distributions, including the openSUSE, Mandriva, CentOS, Oracle Linux, and others.

### Common Apps
- Development Apps
  - `vi`, `emacs` (editors)
  - `gcc`, `clang` (compilers)
  - `gdb, Valgrind` (debuggers)
  - `VSC, Eclipse` (IDEs)

- Graphic Utilities
  - `eog, Inkscape, convert, Scribus`

- Linux offers a wide variety of Internet applications, such as web browsers, email clients, online media applications, and others.
- Web browsers supported by Linux can be either graphical or text-based, such as Firefox, Google Chrome, Epiphany, w3m, lynx, and others.
- Linux supports graphical email clients, such as Thunderbird, Evolution, and Claws Mail, and text mode email clients, such as Mutt and mail.
- Linux systems provide many other applications for performing Internet-related tasks, such as Filezilla, XChat, Pidgin, and others.
- Most Linux distributions offer LibreOffice to create and edit different kinds of documents.
- Linux systems offer entire suites of development applications and tools, including compilers and debuggers.
- Linux systems offer a number of sound players including Amarok, Audacity, and Rhythmbox.
- Linux systems offer a number of movie players, including VLC, MPlayer, Xine, and Totem.
- Linux systems offer a number of movie editors, including Kino, Cinepaint, Blender among others.
- The GIMP (GNU Image Manipulation Program) utility is a feature-rich image retouching and editing tool available on all Linux distributions.
- Other graphics utilities that help perform various image-related tasks are eog, Inkscape, convert, and Scribus.

### CLI operations
- **inode**: The inode (index node) is a data structure in a Unix-style file system that describes a file-system object such as a file or a directory
- terminal programs: xterm, konsole (default on KDE), terminator
```
cat: used to type out a file (or combine files).
head: used to show the first few lines of a file.
tail: used to show the last few lines of a file.
man: used to view documentation.
```
- Virtual Terminals (VT): console sesh that uses display and keyboard outside of a graphical env
- `which | whereis` search commands, local to global
- `whichis | whichever` search programs
- `tree`: shows filesystem top down
- `ln file1 file2`: hard link (shortcuts) inode
- `ln -s file1 file3`: soft link ()
- `pushd | popd`: pushes starting dir on list, `popd` sends you back to said dir
- `cat | tac`: `tac` = ~cat
- `less`: uses console and allows traversal
- `stdin | stdout | stderr`: in out error, generally keyboard input
  - `do_something < input-file` or `>` send output (its directional!)

- Pipes: `$ command1 | command2 | command3` (remember docker commands!)
- Search: `locate | find`
- `grep`: prints only linees containing one or more specified string i.e. `$ locate zip | grep bin`
- wildcards: `?` single character, `*` string of characters, `[set]` matches s, e, t, `[!set]` matches char not in set
- `find`: recurses down the filesystem tree from any particular directory (or set of directories) and locates files that match specified conditions
- `$ find -name "*.swp" -exec rm {} ’;’`: To find and remove all files that end with .swp, `-ok` lets you check removal before unlike `exec`
  ```
  $ find / -ctime 3     # To find files based on time:
  $ find / -size 0  # To find files based on sizes
  $ find / -size +10M -exec command {} ’;’  # For example, to find files greater than 10 MB in size and running a command on those files
  ```
  - Package Management System: level 1, `dpkg | rpm`, level 2: `apt-get, dnf(Open Source RH), yum (RH), zypper (SUSE)`
    - lvl 1: details of unpacking, installing correctly
    - lvl 2: checks dependencies, works with groups of packages and downloads from vendor

#### SUMMARY
- Virtual terminals (VT) in Linux are consoles, or command line terminals that use the connected monitor and keyboard.
- Different Linux distributions start and stop the graphical desktop in different ways.
- A terminal emulator program on the graphical desktop works by emulating a terminal within a window on the desktop.
- The Linux system allows you to either log in via text terminal or remotely via the console.
- When typing your password, nothing is printed to the terminal, not even a generic symbol to indicate that you typed.
- The preferred method to shut down or reboot the system is to use the shutdown command.
- There are two types of pathnames: absolute and relative.
- An absolute pathname begins with the root directory and follows the tree, branch by branch, until it reaches the desired directory or file.
- A relative pathname starts from the present working directory.
- Using hard and soft (symbolic) links is extremely useful in Linux.
- cd remembers where you were last, and lets you get back there with cd -.
- locate performs a database search to find all file names that match a given pattern.
- find locates files recursively from a given directory or set of directories.
- find is able to run commands on the files that it lists, when used with the -exec option.
- touch is used to set the access, change, and edit times of files, as well as to create empty files.
- The Advanced Packaging Tool (apt) package management system is used to manage installed software on Debian-based systems.
- You can use the dnf command-line package management utility for the RPM-based Red Hat Family Linux distributions.
- The zypper package management system is based on RPM and used for openSUSE.

### Documentation
- man pages, GNI Info, help (--help)
- `man –f` generates the same result as typing `whatis`.
- `man –k` generates the same result as typing `apropos`.
- GNU Info" `info`
- `{cmd} --help`
- The main sources of Linux documentation are the man pages, GNU info, the help options and command, and a rich variety of online documentation sources. 
- The man utility searches, formats, and displays man pages.
- The man pages provide in-depth documentation about programs and other topics about the system, including configuration files, system calls, library routines, and the kernel.
- The GNU Info System was created by the GNU project as its standard documentation. It is robust and is accessible via command line, web, and graphical tools using info.
- Short descriptions for commands are usually displayed with the -h or --help argument.
- You can type help at the command line to display a synopsis of built-in commands.
- There are many other help resources both on your system and on the Internet.
- The filesystem tree starts at what is often called the root directory (or trunk, or /).

### Filesystem
- The  Filesystem Hierarchy Standard (FHS) provides Linux developers and system administrators a standard directory structure for the filesystem.
- Partitions help to segregate files according to usage, ownership, and type.
- Filesystems can be mounted anywhere on the main filesystem tree at a mount point. Automatic filesystem mounting can be set up by editing /etc/fstab.
- NFS (Network File System) is a useful method for sharing files and data through the network systems.
- Filesystems like /proc are called pseudo filesystems because they exist only in memory.
- /root (slash-root) is the home directory for the root user.
- /var may be put in its own filesystem so that growth can be contained and not fatally affect the system.
- /boot contains the basic files needed to boot the system.
- patch is a very useful tool in Linux. Many modifications to source code and configuration files are distributed with patch files, as they contain the deltas or changes to go from an old version of a file to the new version of a file.
- File extensions in Linux do not necessarily mean that a file is of a certain type.
- cp is used to copy files on the local machine, while rsync can also be used to copy files from one machine to another, as well as synchronize contents.
- gzip, bzip2, xz and zip are used to compress files.
- tar allows you to create or extract files from an archive file, often called a tarball. You can optionally compress while creating the archive, and decompress while extracting its contents.
- dd can be used to make large exact copies, even of entire disk partitions, efficiently.

### Editing Text Files
- `sed`: stream editor, filter text and perform substitutions in data streams
```
sed -e command <filename>   # Specify editing commands at the command line, operate on file and put the output on standard out (e.g. the terminal)
sed -f scriptfile <filename>    # Specify a scriptfile containing sed commands, operate on file and put output on standard out
echo "I hate you" | sed s/hate/love/    # Use sed to filter standard input, putting output on standard out
```
- `awk`

### Networking
- IPv4 IPv6: 32-bit vs 128-bit
- octets: 8-bit sections (or 1 byte)
- Class A vs B vs C vs D
  - A: Octate 1 always 0, NetID.HostID.HostID.HostID
  - B: Octate 1 first 1 bits always 10, NetID.NetID.HostID.HostID

### Security
- cgroups: Control Groups
- containers: uses cgroups isolated Linux systems
- Virtualization: isolated + insulated guests on one physical host
- 
