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
  - [OSI Layers](#osi-layers)
  - [TCP/IP](#tcpip)
  - [Secure Ports](#secure-ports)
  - [Threats](#threats)
  - [Tools](#tools)
- [Network Security Architecture](#network-security-architecture)
  - [Network Design](#network-design)
    - [Defense In Depth](#defense-in-depth)
  - [Zero Trust and Microsegmentation](#zero-trust-and-microsegmentation)
    - [Comparison and Relationship](#comparison-and-relationship)
- [**Security Operations**](#security-operations)
  - [Data Security](#data-security)
  - [System Hardening](#system-hardening)
  - [Security Policies](#security-policies)
  - [Security Awareness Training](#security-awareness-training)

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
## OSI Layers
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

> **A**pps **P**resent **S**ession, **T**ransporting **N**etwork **D**ata **P**hysically
- TCP/IP is easy to hack, as it was designed for usability not security
- **Encapsulation**: the addition of header and possibly a footer (trailer) data by a protocol used at that layer of the OSI model

## TCP/IP 
**A**pplication, **T**ransport, **I**nternet, **N**etwork Interface

**IPv4 vs IPv6**
- IPSec optional in IPv4, mandatory in IPv6
- IPv6: uses 8 groups of Hexadecimal 
## Secure Ports
Note: * denotes secure. All susceptible to sniffing. 
| Port Number | Protocol        | Description                                        |
|-------------|-----------------|----------------------------------------------------|
| 21 / 22*         | FTP / SFTP*          | File Transfer Protocol for transferring files. SFTP Encrypted     |
| 23  / 22*        | Telnet / SSH*         | Unsecured text communications protocol.            |
| 25 / 587*         | SMTP / +TLS           | Simple Mail Transfer Protocol for email routing.   |
| 37 / 123*         | Time / Network Time Protocol           | Protocol for synchronizing time over a network.    |
| 53 / 853*         | DNS / +TLS            | Domain Name System for translating domain names.   |
| 80 / 443         | HTTP / HTTPS           | Hypertext Transfer Protocol for web traffic. SSL/TLS has been compromised and is no longer considered secure. TLS 1.3 or higher recommended (2022)       |
| 143 / 993        | IMAP / +SSL/TLS           | Internet Message Access Protocol for email retrieval. |
| 161/162     | SNMP / +SNMPv3           | Simple Network Management Protocol for network management. |
| 445 / 2049*        | SMB / NFS            | Server Message Block for file sharing over a network. Network File System is also not recommended through firewalls |
| 389 / 636        | LDAP / LDAPS (Secure)           | Lightweight Directory Access Protocol for directory services. Can use SSL/TLS |


**SYN, SYN-ACK, ACK**
- SYN >> SYN-ACK << ACK

## Threats
| Type of Threat               | Description                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| Spoofing                     | The act of masquerading as a legitimate entity to gain unauthorized access. |
| Phishing                     | Attempting to acquire sensitive information by pretending to be trustworthy.|
| DOS/DDOS                     | Denial of Service / Distributed Denial of Service attacks to disrupt service.|
| Virus                        | Malicious software that replicates by modifying other computer programs.    |
| Worm                         | Standalone malware that replicates itself to spread to other computers.     |
| Trojan                       | Malware that misleads users of its true intent.                             |
| On-path Attack               | Intercepting data packets as they travel across a network.                  |
| Side-channel                 | Attacks based on information gained from the physical implementation of a system. |
| Advanced Persistent Threat (APT) | A prolonged and targeted cyberattack in which an intruder gains access to a network and remains undetected.|
| Insider Threat               | A security risk that originates from within the targeted organization.      |
| Malware                      | Software designed to disrupt, damage, or gain unauthorized access to a computer system.|
| Ransomware                   | Malware that encrypts the victim's files and demands a ransom for the decryption key.|

## Tools
| Tools                              | Description                                                   | Identifies Threats | Prevent Threats |
|------------------------------------|---------------------------------------------------------------|--------------------|-----------------|
| Intrusion Detection System (IDS)   | A form of monitoring to detect abnormal activity; it detects intrusion attempts and system failures. | ✔️                |                 |
| Host-based IDS (HIDS)              | Monitors activity on a single computer.                       | ✔️                |                 |
| Network-based IDS (NIDS)           | Monitors and evaluates network activity to detect attacks or event anomalies. | ✔️                |                 |
| SIEM                               | Gathers log data from sources across an enterprise to understand security concerns and apportion resources. | ✔️                |                 |
| Anti-malware/Antivirus             | Seeks to identify malicious software or processes.            | ✔️                | ✔️               |
| Scans                              | Evaluates the effectiveness of security controls.             | ✔️                |                 |
| Firewall                           | Filters network traffic - manages and controls network traffic and protects the network. | ✔️                | ✔️               |
| Intrusion Protection System (IPS-NIPS/HIPS) | An active IDS that automatically attempts to detect and block attacks before they reach target systems. | ✔️                | ✔️               |

# Network Security Architecture
**Memorandum of Understanding (MOU)/Memorandum of Agreement (MOA)**

A mutual pact/agreement to share resources during downtime.

| Term | Definition | Characteristics | Examples |
|------|------------|-----------------|----------|
| SaaS (Software as a Service) | A software distribution model in which applications are hosted by a vendor or service provider and made available to customers over a network, typically the internet. | - Accessible from anywhere<br> - Subscription-based<br> - Managed from a central location<br> - No need to install or run applications on individual devices | Google Workspace, Salesforce, Dropbox, Microsoft Office 365 |
| IaaS (Infrastructure as a Service) | A form of cloud computing that provides virtualized computing resources over the internet. | - Scalable computing resources<br> - Pay-as-you-go model<br> - No need for physical hardware management<br> - Greater flexibility and control over infrastructure | Amazon Web Services (AWS), Microsoft Azure, Google Compute Engine (GCE), IBM Cloud |
| PaaS (Platform as a Service) | A cloud computing model that provides customers a platform allowing them to develop, run, and manage applications without the complexity of building and maintaining the infrastructure. | - Built-in development tools and database management<br> - Middleware and development tools are provided<br> - Platform management is handled by the provider<br> - Simplifies the development process | Heroku, Google App Engine, OpenShift, Microsoft Azure App Services |
| SLA (Service Level Agreement) | A contract between a service provider and the end user that defines the level of service expected from the service provider. | - Specifies performance benchmarks<br> - Details remedies for service failures<br> - Sets expectations for service availability and support response times<br> - May define service scope and customer obligations | Varies by provider and service; typically a part of enterprise-level agreements for cloud services |


## Network Design
| Network Security Concept | Description |
|--------------------------|-------------|
| Network Segmentation     | Network segmentation involves controlling traffic among networked devices. Complete or physical network segmentation occurs when a network is isolated from all outside communications, so transactions can only occur between devices within the segmented network. |
| Demilitarized Zone (DMZ) | A DMZ is a physical or logical subnetwork that contains and exposes an organization's external-facing services to an untrusted network, usually the internet. |
| Virtual Local Area Network (VLAN) | VLANs allow network administrators to partition a network for better traffic management. |
| Virtual Private Network (VPN) | A VPN extends a private network across a public network, allowing users to send and receive data across shared or public networks as if their computing devices were directly connected to the private network. |
| Defense in Depth | A multi-layered strategy that uses several different components to protect operations and information. |
| Network Access Control (NAC) | NAC is used to define and implement policies that control access to network nodes by devices when they initially attempt to access the network. |


### Defense In Depth
![Defense In Depth](/rover/img/ISCCC/image.png)

## Zero Trust and Microsegmentation
### Comparison and Relationship
- **Overlap**: While different, these concepts can be complementary. Zero Trust can use microsegmentation as one of its strategies to enforce its no-trust policy by strictly limiting access to applications and environments based on user and device credentials and roles.
- **Implementation**: In practice, an organization could use microsegmentation techniques to implement a Zero Trust security model, as microsegmentation can provide the granular control over traffic and access required by Zero Trust.
- **Security Strategy**: Zero Trust is an overarching strategy or approach to security, while microsegmentation is a tactic or method that can be used to achieve the objectives of a Zero Trust model.

# **Security Operations**

## Data Security
**Data Handling**: Classification -> Labeling -> Retention -> Destruction

**Event Logging**:

***Ingress monitoring*** refers to surveillance and assessment of all inbound communications traffic and access attempts. Devices and tools that offer logging and alerting opportunities for ingress monitoring include: 
Examples:
- Firewalls
- Gateways
- Remote authentication servers
- IDS/IPS tools
- SIEM solutions
- Anti-malware solutions

***Egress monitoring***
- Email (content and attachments)
- Copy to portable media
- File Transfer Protocol (FTP)
- Posting to web pages/websites
- Applications/application programming interfaces (APIs) 

## System Hardening
Inventory >> Baselines >> Updates >> Patches

## Security Policies
| Policy                       | Key Points                                                                                                 |
|------------------------------|------------------------------------------------------------------------------------------------------------|
| Data Handling Policy         | - Outlines proper handling and classification of data.<br>- Restrictions based on user roles and data sensitivity.<br>- Compliance with legal and regulatory requirements.<br>- Encryption requirements for sensitive data. |
| Password Policy              | - Specifies complexity requirements (length, characters, etc.).<br>- Enforces regular password changes.<br>- Prohibits password reuse.<br>- May include two-factor authentication guidelines. |
| Acceptable Use Policy (AUP)  | - Defines acceptable and prohibited uses of the organization's IT resources.<br>- Sets guidelines for internet use, email conduct, and software installation.<br>- Outlines consequences for violations. |
| Bring Your Own Device (BYOD) Policy | - Details security requirements for personal devices used for work.<br>- Covers data segregation between personal and work data.<br>- May include remote wipe authority for company data.<br>- Defines support boundaries for personal devices. |
| Privacy Policy               | - Explains how personal data is collected, used, stored, and protected.<br>- Includes user rights regarding their data.<br>- Details about data sharing with third parties.<br>- Compliance with privacy laws like GDPR or CCPA. |
| Change Management Policy     | - Procedures for requesting, reviewing, and implementing changes in the IT environment.<br>- Roles and responsibilities for change management.<br>- Testing and backout plans.<br>- Documentation and communication of changes. |


## Security Awareness Training
- **Education**: The overall goal of education is to help learners improve their understanding of these ideas and their ability to relate them to their own experiences and apply that learning in useful ways.
- **Training**: Focuses on building proficiency in a specific set of skills or actions, including sharpening the perception and judgment needed to make decisions as to which skill to use, when to use it and how to apply it. Training can focus on low-level skills, an entire task or complex workflows consisting of many tasks.
- **Awareness**: These are activities that attract and engage the learner’s attention by acquainting them with aspects of an issue, concern, problem or need.