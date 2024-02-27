+++
author = "Winston Tsia"
authorlink = ""
title = "ISC2 CC"
date = 2023-08-10T17:50:41-07:00
description = "Notes on ISC2 CC"
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
- [Overview](#overview)
- [Security Principles:](#security-principles)
  - [Information Assurance](#information-assurance)
    - [CIA Triad](#cia-triad)
    - [Authentication](#authentication)
    - [Privacy](#privacy)
  - [Risk Management](#risk-management)
    - [Methods of Risk Management](#methods-of-risk-management)
    - [Security Controls, Governance, Ethics](#security-controls-governance-ethics)
      - [Regulation and Laws](#regulation-and-laws)
      - [Standards](#standards)
- [Business Continuity, Disaster Recovery, Incidence Response](#business-continuity-disaster-recovery-incidence-response)
  - [Business Continuity Plan](#business-continuity-plan)
  - [Disaster Recovery](#disaster-recovery)
  - [Incidence Response](#incidence-response)
- [Access Control Concepts](#access-control-concepts)
  - [Defense Strategies](#defense-strategies)
  - [Physical Access](#physical-access)
  - [Logical Access](#logical-access)
    - [Access Controls:](#access-controls)
- [**Network Security**](#network-security)

# Overview
5 Chapters, 20+ modules

# Security Principles:
## Information Assurance
### CIA Triad
Confidentiality-Integrity-Availability
- C: Access management (sensitivity)
- I: Accurate, consistent data (baseline and state)
- A: Timely + Reliable access (criticality)
>The CIA triad is the cornerstone of information security, and as a security professional you will use all its components—confidentiality, integrity, and availability—to protect the information in your charge. Think of it as a three-dimensional way of thinking. There are many different aspects to protecting information and the more you think about it, the more you realize how complex it can be.

### Authentication
- Knowledge, Token, or Characteristic

### Privacy
Laws to act in accordance with:
- HIPAA (Health Insurance Portability and Accountability Act)
- GDPR (General Data Protection Regulation)

## Risk Management
**Risk assessment, analysis, mitigation, remediation and communication**. IT Risk $\subset$ Business Risk. Threat actors utilize threat vectors and stand at the opposing side to mitigating risk. **Probability** and **Impact** are important concepts in a subjective risk analysis.

### Methods of Risk Management
- Acceptance: Deeming something an "acceptable" risk 
- Transfer: i.e. Insurance Policy
- Avoidance: Desisting operations to "avoid"
- Mitigation: Preventative measures like controls, policies, procedures, hiring expertise
  
Risk may be presented with a risk matrix, a graph with an $x(+)$ and $y(+)$ axis, one corresponding to **likelihood** and the other axis corresponding to **impact**.

### Security Controls, Governance, Ethics
Security Controls are the physical (entry badge), technical (logical controls, computer implemented) and administrative mechanisms that act as safeguards or countermeasures prescribed for an information system to protect the confidentiality, integrity and availability of the system and its information
- Policy: Sets guidelines/standards
- Procedure: Explicit sets of actions to undertake

#### Regulation and Laws
- (HIPAA, 1996) Health Insurance Portability and Accountability Act: must keep protected health information (PHI) secure, 1996.
- (GDPR, 2016) General Data Protection Regulation: EU provisions for personally identifiable information (PII) protections

#### Standards
- (ISO) International Organization for Standardization
- (NIST) National Institute of Standards and Technology: Dept. of Commerce, US Infosec standards. 
- (IETF) Internet Engineering Task Force: Body that regulates communication standards
- (IEEE) Institute of Electrical and Electronic Engineers: sets subject standards

# Business Continuity, Disaster Recovery, Incidence Response
## Business Continuity Plan
Components include: team members, procedures/checlists, notifications, guidence for managers, how/when, critical supply chain contacts.
- Red Book: "Red Book" typically refers to a comprehensive document or set of guidelines that outlines security policies, procedures, and best practices for a specific organization or system (often given to entities outside the facility)

## Disaster Recovery
The Disaster Recovery (DR) plan may include the following components: executive summary providing a high-level overview of the plan, department-specific plans, technical guides for IT personnel responsible for implementing and maintaining critical backup systems, full copies of the plan for critical disaster recovery team members, and checklists for certain individuals.

## Incidence Response
The four main components of Incident Response are: Preparation; Detection and Analysis; Containment, Eradication and Recovery; and Post-Incident Activity

# Access Control Concepts
- Subjects
- Objects
- Rule

## Defense Strategies
- Defense in Depth
- Least Privilege 
- Privileged Access Management
  - Privileged Accounts
  - Segregation of Duties
    - Two-Person Integrity: paired access to secure objects
  - User Provisioning: Creating accounts and managing access privileges for users
  

## Physical Access
- Badge/Gate Entry
- Enviromental Design
- Biometrics (Physiological, Behavioral)
  - Behavioral: Keystroke analysis

## Logical Access
General:
- Passwords
- Biometrics
- Badge/token

### Access Controls:
- Discretionary Access Control: subjects who have been granted access to information may pass, grant, change security, choose security, change access control on objects
- Mandatory Access Control: administrator based access control on objects, and subset of subjects are given a subset of objects to access
- Role-based Access Control: user based roles

# **Network Security**
Basic networks include LAN, WAN networks. 
- Recall [OSI Layers](./posts/cs.networks/#osi)

| Layer | Name                    | Description                                                                                          |
|-------|-------------------------|------------------------------------------------------------------------------------------------------|
|Upper (Host) Layer|||
| 7     | Application Layer       | Provides network services directly to end-users or applications. It includes protocols like HTTP, SMTP, and FTP. |
| 6     | Presentation Layer      | Responsible for data translation, encryption, and compression. It ensures that data is presented in a format that the application layer can understand. |
| 5     | Session Layer           | Manages communication sessions between applications, including establishing, maintaining, and terminating connections. |
|Lower Layer|||
| 4     | Transport Layer         | Ensures reliable data transfer between hosts. It manages flow control, error correction, and segmentation of data. Protocols include TCP and UDP. |
| 3     | Network Layer           | Handles logical addressing and routing of data packets between different networks. IP is the primary protocol at this layer. |
| 2     | Data Link Layer         | Responsible for the physical addressing of data packets and the transmission of data frames within a single network segment. Ethernet and Wi-Fi are examples of data link layer protocols. |
| 1     | Physical Layer          | Deals with the physical transmission of data over the network medium. It includes specifications for cables, connectors, and other hardware components. |

- TCP/IP is easy to hack, as it was designed for usability not security
- **Encapsulation**: the addition of header and possibly a footer (trailer) data by a protocol used at that layer of the OSI model
