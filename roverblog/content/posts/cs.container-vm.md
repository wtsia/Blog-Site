+++
author = "Winston Tsia"
authorlink = ""
title = "Containerization"
date = 2022-12-31T22:49:03-08:00
description = "Description"
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
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
# Contents
- [Contents](#contents)
- [Containerization vs VMs: An Application Dependent Choice](#containerization-vs-vms-an-application-dependent-choice)
- [Hypervisor](#hypervisor)
- [Docker Images](#docker-images)
  - [Anatomy](#anatomy)
  - [Kubernetes vs Docker](#kubernetes-vs-docker)

# Containerization vs VMs: An Application Dependent Choice
Containers mimic an OS (Cloud Apps)
- runs on top of phyiscal server + OS
- virtualizes OS only

VMs mimic dedicated hardware, managed by hypervisor (Legacy systems)
- runs on top of a physical server
- need different OS' 
# Hypervisor
May create multiple VMs

# Docker Images
## Anatomy
A Dockerfile is a simple text file with instructions and arguments. Docker can build images automatically by reading the instructions given in a Dockerfile.

![Dockerfile Example](/rover/img/Containers/dockerfile.png)


## Kubernetes vs Docker
- Docker: a containerization platform and runtime
- Kubernetes: platform for running and managing containers from many container runtimes (including Docker)
- 