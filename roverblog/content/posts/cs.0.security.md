+++
author = "Winston Tsia"
authorlink = ""
title = "Security"
description = "Unfinished"
tags = [
    "Security"
]
categories = [
    "Computer Science"
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = true
+++

# Security Topics
- [Security Topics](#security-topics)
- [Introduction](#introduction)
  - [ISC2 Certified in Cybersecurity](#isc2-certified-in-cybersecurity)
- [Secure Shell (SSH)](#secure-shell-ssh)
- [Hypertext Transfer Protocol Secure (HTTPS)](#hypertext-transfer-protocol-secure-https)
  - [Transport Layer Security (TLS)](#transport-layer-security-tls)
    - [RSA or Diffie-Hellman](#rsa-or-diffie-hellman)
      - [Diffie-Hellman](#diffie-hellman)
- [X.509 Digital Certificates](#x509-digital-certificates)
- [Ghidra](#ghidra)
- [Golang](#golang)
- [Reverse Engineering](#reverse-engineering)

# Introduction
## [ISC2 Certified in Cybersecurity](./posts/infosec.ISC2-CC)

# Secure Shell (SSH)
![Secure Shell](https://i.stack.imgur.com/VhMqi.jpg)

# Hypertext Transfer Protocol Secure (HTTPS)

## Transport Layer Security (TLS)
- Formerly known as Secure Socket Layer (SSL)
  - "Public" key is made public, while "Private" key is owned by a client or origin server. 
  - Information is scrambled with a key to make cyphertext, and said key can unscramble the cyphertext
  - Public key cryptography utilizes two keys, one asymmetric for handshake, and the other for symmetric encryption
### RSA or Diffie-Hellman
#### Diffie-Hellman
- exponential key exchange
# X.509 Digital Certificates

# Ghidra
- an open source reverse engineering tool introduced in RSA Conference, first leaked in Wikileaks and released by the NSA in 2019.
 
# Golang
# Reverse Engineering
- Golang compiler preverses some data that may be reverse engineered, and is untouched by the strip utility (on UNIX, see `man strip` for manual pages on strip utility).

