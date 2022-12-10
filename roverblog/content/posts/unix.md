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

###
