+++
author = "Winston Tsia"
authorlink = ""
title = "Infosec.Cysa+"
date = 2024-02-11T14:23:05-08:00
description = "Notes on Infosec.CySA+"
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

# Security Operations

# Threat Hunting Concepts/Tools 
## Windows Event Logging with PowerShell Script


# Process Improvement and Vulnerability Methods
Documentation, Adherence (ISO/IEC 27001), and Uniform Protocols
## Streamlining Operations
Automation, Integration (consolidation), and Optimization (preplanning)

**Threat Intelligence Cycle**
1. Planning and Direction
2. Collection and Processing
3. Analysis
4. Report Production
5. Dissemination/Feedback

Single Pane of GLass: The consolidation of information/controls into a single dashboard.

## Assets: 
1. Identification
2. Scoping Scan
3. Asset Prioritization
4. Scan Execution
5. Detection 
6. Asset Management Integration
7. Remediation Planning
8. Continuous Monitoring
   
**Management and Criticality**: Cataloguing assets and identifying critical assets aid in creating a defensive plan. Tagging assets and managing it via database can allow for more security control. 

## Vulnerability Scanning
**Scope** establishes allowable actions

Some Vulnerability databases include:
- NIST National Vulnerability Database
- Common Platform Enumeration (CPE)
- Common Weakness Enumeration (CWE)
- Common Vulnerabilities and Exposures (CVE)

CVE: https://cve.mitre.org/cve/data_feeds.html

NIST: https://nvd.nist.gov/ 

CPE: http://cpe.mitre.org/ 

### Internal, External, Credentialed, non-Credentialed, Active, and Passive Scans
External and Internal mirror respective perspectives of outside attackers and insiders.

Common credentialed vulnerabilities:
- URL Parameter Pollution
- weak configurations
- missing patches.

Common non-credentialed (user) vulnerabilities
- Cross Site Scripting (XXS)
- SQL Injection
- Cross Site Request Forgery (CSRF)

#### Active/Passive Scans
**Active**: Creates noise due to sending packets for servers or Wi-Fi
- TCP SYN: Sends a SYN packet to a server, and listens for a SYN ACK to determine information. If unable to get through, a RST is sent to scan the next port
  
**Passive**: Listens for surrounding or incoming packets instead of querying

#### Code Analysis: Static/Dynamic
Static, or source code analysis, analyzes code before compilation using Static Analysis Security Tools (SAST). Ran during SDLC (Software Development Life Cycle?).

**Web App Vulnerability Scanning**: Nikto can be used to analyze a published environment

**Fuzzing**: examining for defects/vulnerabilities

**Interception Proxy**: Man-in-the-Middle attack which crawls application

Tools: Nmap, Zenmap, Nessus, OSWAP Zap, Metasploit