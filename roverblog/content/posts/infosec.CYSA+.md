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
- [Security Operations](#security-operations)
    - [ELK Stack](#elk-stack)
    - [Agents](#agents)
    - [Use in a Homelab](#use-in-a-homelab)
  - [Operating System Concepts](#operating-system-concepts)
- [Threat Hunting Concepts/Tools](#threat-hunting-conceptstools)
  - [Windows Event Logging with PowerShell Script](#windows-event-logging-with-powershell-script)
- [Process Improvement and Vulnerability Methods](#process-improvement-and-vulnerability-methods)
  - [Streamlining Operations](#streamlining-operations)
  - [Assets:](#assets)
  - [Vulnerability Scanning](#vulnerability-scanning)
    - [Internal, External, Credentialed, non-Credentialed, Active, and Passive Scans](#internal-external-credentialed-non-credentialed-active-and-passive-scans)
      - [Active/Passive Scans](#activepassive-scans)
      - [Code Analysis: Static/Dynamic](#code-analysis-staticdynamic)
- [Attack Models and Responses](#attack-models-and-responses)
  - [Attack Models](#attack-models)
    - [Cyber Kill Chain](#cyber-kill-chain)
    - [Diamond Model of Intrusion Analysis](#diamond-model-of-intrusion-analysis)
      - [Adversary](#adversary)
      - [Victim](#victim)
    - [MITRE ATT\&CK](#mitre-attck)
    - [Open Source Security Testing Methodology Manual (OSSTMM)](#open-source-security-testing-methodology-manual-osstmm)
    - [Open Web Application Security Project (OWASP)](#open-web-application-security-project-owasp)
      - [OWASP ESAPI (Enterprise Security API)](#owasp-esapi-enterprise-security-api)
      - [OWASP ESAPI](#owasp-esapi)
      - [OWASP ModSecurity](#owasp-modsecurity)
- [Core Content](#core-content)

# Security Operations
ELK and agents are essential components for monitoring and analyzing network traffic and system logs to enhance security.

### ELK Stack
**ELK** stands for Elasticsearch, Logstash, and Kibana, which are three open-source tools used together for searching, analyzing, and visualizing log data in real time.

- **Elasticsearch** is a highly scalable search engine that allows for the storage, search, and analysis of large volumes of data quickly and in near real time.
- **Logstash** is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a "stash" like Elasticsearch.
- **Kibana** is a visualization layer that works on top of Elasticsearch, providing users with the ability to visualize data with charts and graphs and perform advanced data analysis.

### Agents
In the ELK context, **agents** refer to lightweight data shippers that you install on different servers in your network to send specific types of log data or metrics to Logstash or directly to Elasticsearch. These are often crucial for gathering the necessary data from various sources, which then becomes searchable and analyzable via the ELK stack. Some common agents used with ELK include:

- **Filebeat**: A lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- **Metricbeat**: This agent collects metrics from your systems and services. From CPU to memory, Redis to NGINX, and much more, Metricbeat is a lightweight way to send system and service statistics.

### Use in a Homelab
In a cybersecurity homelab, using ELK with these agents can help you simulate and monitor security incidents. For example, you can:
- Gather logs from all your network devices to a central location to analyze potential security breaches or anomalies.
- Set up dashboards in Kibana to visualize network traffic, login attempts, and other security-related events in real-time.
- Experiment with rules and filters in Logstash to detect unusual activities or configurations that could indicate a security issue.

Setting up an ELK stack in your homelab involves planning the network architecture to ensure all critical data points are covered by agents, configuring Elasticsearch to handle the data influx, designing Logstash filters for data processing, and building dashboards in Kibana to analyze the data effectively. This setup gives hands-on experience with real tools used in enterprise environments, enhancing your understanding and skills in network security monitoring and incident response.


## Operating System Concepts
- Hardware Abstraction
- Process Management: Process, Threads, Scheduling, Synchronization, Multitasking, Process Isolation
- Memory Management: Virtual Memory, Memory Allocation
- File Systems/Permissions
- Device Drivers & I/O Management: Device Drivers, I/O Buffering, Interrupt Handling
- User Interface
- Network Management: Network Stack, Protocols, VPNs
- Error Handling/Recovery 
- Security/Access Control: Authentication, Sandboxing, Least Privilege, Antivirus

**Logging**
- Logging/Auditing: System logs, Audit Trails
- Log Ingestion: Generation, Collection, Transmission, Normalization and Parsing, Storage, Indexing
- Logging Levels: Trace/Verbose, Debug, 

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


# Attack Models and Responses
## Attack Models
### Cyber Kill Chain
| Stage               | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| Reconnaissance (Recon) | The attacker gathers information about the target, such as vulnerabilities, network architecture, and potential entry points. |
| Weaponization       | The attacker creates or obtains the necessary tools or exploits to carry out the attack based on the information gathered during reconnaissance. |
| Delivery            | The attacker delivers the weaponized payload to the target system or network. This could be through various means such as email attachments, compromised websites, or physical access. |
| Exploitation       | The attacker exploits vulnerabilities in the target system or network using the delivered payload to gain unauthorized access or execute malicious code. |
| Installation        | The attacker installs malware or establishes a persistent presence within the compromised system or network, ensuring continued access and control. |
| Command & Control (C&C) | The attacker establishes communication channels and infrastructure to remotely manage and control the compromised systems, enabling further malicious activities. |
| Action              | The attacker executes their intended objectives, which could range from data theft and surveillance to system disruption or destruction. |

### Diamond Model of Intrusion Analysis

| Actor             | Infrastructure        | Capability       |
|-------------------|-----------------------|------------------|
| **Adversary**    | TTPs (Tactics, Techniques, Procedures) | Tools & Methods |
| **Victim**       | Targeted Infrastructure             | Vulnerabilities  |

#### Adversary
- **TTPs (Tactics, Techniques, Procedures):** Methods employed by the adversary to carry out the attack, including reconnaissance, weaponization, delivery, exploitation, installation, command & control, and action.
- **Tools & Methods:** The specific tools, malware, or techniques used by the adversary, such as exploit kits, phishing emails, remote access trojans (RATs), etc.

#### Victim
- **Targeted Infrastructure:** Systems, networks, or assets targeted by the adversary for exploitation or compromise.
- **Vulnerabilities:** Weaknesses or flaws in the victim's infrastructure that the adversary exploits to gain unauthorized access or achieve their objectives.

### MITRE ATT&CK

### Open Source Security Testing Methodology Manual (OSSTMM)

### Open Web Application Security Project (OWASP)
| Security Practice                                                     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                        |
|-----------|----------|
| Incorporate Security Early and Throughout the Software Development Lifecycle (SDLC) | Integrate security practices from the beginning of the development process and throughout all stages, including design, development, testing, and deployment.                                                                                                                                                                                                                                                                                    |
| Perform Regular Security Assessments and Audits                       | Conduct regular security assessments, including penetration testing, code reviews, and vulnerability assessments to identify and address security issues.                                                                                                                                                                                                                                                                                           |
| Input Validation                                                      | Ensure all user input is validated for type, length, format, and range. This helps prevent injection attacks like SQL Injection and Cross-Site Scripting (XSS).                                                                                                                                                                                                                                                                                |
| Output Encoding and Escaping                                          | Properly encode or escape data output to the user to prevent XSS attacks and ensure that user-supplied data is rendered safely.                                                                                                                                                                                                                                                                                                                   |
| Implement Proper Authentication and Session Management                | Use strong authentication mechanisms and ensure that session management is secure to prevent attacks like session hijacking and fixation.                                                                                                                                                                                                                                                                                                           |
| Enforce Strong Access Control Measures                                | Implement robust access control policies to ensure users can only access resources and perform actions that they are authorized to.                                                                                                                                                                                                                                                                                                                 |
| Protect Data in Transit and at Rest                                   | Use encryption, such as TLS, for data in transit and encrypt sensitive data at rest to protect it from unauthorized access.                                                                                                                                                                                                                                                                                                                        |
| Error Handling and Logging                                            | Implement proper error handling to avoid revealing sensitive information in error messages. Ensure that logs capture sufficient information for security monitoring but do not contain sensitive data.                                                                                                                                                                                                                                                |
#### OWASP ESAPI (Enterprise Security API)
The OWASP Enterprise Security API (ESAPI) is a free, open-source, web application security control library. Its primary goal is to provide developers with a way to write lower-risk applications by offering a set of security controls that help prevent vulnerabilities in the code.

#### OWASP ESAPI 
Includes functions for authentication, access control, data validation, encoding, and encryption. It is designed to be easily adaptable to fit the specific needs of applications. It also assists developers in writing more secure code by providing a set of well-tested security functions.

#### OWASP ModSecurity
ModSecurity is an open-source, cross-platform web application firewall (WAF) engine. It provides protection from a range of attacks against web applications and allows for HTTP traffic monitoring, logging, and real-time analysis. The platform uses a flexible rule engine to perform various types of checks. It offers virtual patching capabilities to mitigate vulnerabilities quickly. OWASP ModSecurity platform allows the creation of custom rules tailored to specific applications. It immensely helps in monitoring HTTP traffic and provides detailed logging for analysis.

# Core Content
Skip to main content
Completion requirements
 Done: View
Operating System Concepts
An operating system (OS) is software that manages computer hardware and software resources and provides common services for computer programs. It is a software program that acts as an intermediary between computer hardware and the user. It provides a set of services and functionalities that allow users and applications to interact with the computer’s hardware resources.

The primary functions of an operating system include:

Hardware Abstraction
The operating system abstracts hardware complexities, providing a uniform interface for applications and users. This abstraction allows software to interact with the hardware without needing detailed knowledge of the underlying components.

Bootstrapping: The process of starting a computer and loading the operating system.
System Calls: The interface between OS and user programs.
Application Programming Interfaces: These are sets of routines and protocols for building software and applications
Process Management
The OS manages processes, which are instances of executing programs. It allocates resources, schedules tasks, and ensures the proper execution of processes, enabling multitasking and efficient use of system resources.

Processes: A process is a program in execution, which includes the program code, its current activity, and the resources assigned to it.
Threads: Threads are the smallest sequence of programmed instructions that can be managed independently by a scheduler.
Scheduling: The OS schedules processes and threads for execution on the CPU.
Synchronization: Mechanisms to control the access of multiple processes to shared resources.
Multitasking: Running multiple processes simultaneously.
Process Isolation: Process Isolation ensures that processes operate in separate memory spaces to prevent one process from interfering with another.
Memory Management
Operating systems oversee memory allocation and deallocation. They manage the computer's memory, ensuring that each process has the necessary memory space and preventing conflicts between programs.

Virtual Memory: It is an abstraction of the main memory that extends the available memory via disk storage.
Memory Allocation: It is the process of assigning blocks of memory to various processes.
File System Management
The OS handles file management, organizing and controlling access to files and directories on storage devices. It provides a hierarchical structure for organizing data and ensures data integrity.

File Systems: The methods and data structures that an OS uses to keep track of files on a disk or partition.
File Permissions: These manage access controls for files and directories.
Device Drivers and I/O Management
Device drivers, components of the operating system, facilitate communication between the OS and hardware devices such as printers, keyboards, and storage devices. The OS manages input and output operations to and from these devices.

Device Drivers: These are Software that allow operating systems to communicate with hardware devices.
I/O Buffering: Temporary storage for I/O to handle speed mismatches between the computer and peripheral devices.
Interrupt Handling: These are responses to hardware and software interrupts.
User Interface
The OS provides a user interface, which can be command-line-based, graphical, or a combination of both. This interface allows users to interact with the system, run applications, and perform tasks.

Network Management
Operating systems include networking capabilities to enable communication between devices on a network. They manage network connections, protocols, and data transfer.

Network Stack: The software that provides network functionality.
Protocols: Rules and standards that allow computers to communicate.
Virtual Private Networks (VPNs): Using VPNs to secure remote connections.
Error Handling and Recovery
The OS is responsible for handling errors, both hardware and software-related. It provides mechanisms for error detection, reporting, and recovery to ensure system stability and reliability.

Security and Access Control
Operating systems implement security measures, including user authentication, access controls, and encryption, to protect the system and its data from unauthorized access and malicious activities.

Authentication Mechanisms: Ensuring that only authenticated users can access the system. This includes password protection, biometrics, two-factor authentication, etc.
Sandboxing: Sandboxing is termed as running programs in a restricted environment (a "sandbox") to limit their access to system resources and reduce the risk of security breaches.
Least Privilege Principle: Ensuring that users and processes have only the minimum privileges necessary to perform their tasks, reducing the risk of misuse or exploitation.
Antivirus and Anti-malware Software: Using specialized software to detect, prevent, and remove malicious software.
Logging and Auditing
Logging and auditing fall under the broader category of Security and Access Management, but their purpose in an operating system is to provide a mechanism for recording events, activities, and security-related information within the system.

System Logs: These maintain detailed logs of system activities to monitor for unusual or unauthorized activities.
Audit Trails: It is keeping records of who did what on the system, which is essential for investigating security incidents.
Common examples of operating systems include Microsoft Windows, macOS, Linux, and Unix. Each operating system has its unique features and functionalities, but they all serve as a crucial layer of software that manages and coordinates the resources of a computer system.

Log Ingestion
Log ingestion refers to the process of collecting, importing, and processing log data from various sources into a centralized system for analysis, monitoring, and management. This process is a critical component of modern IT operations, cybersecurity, and network management. Let's break down the concept for a clearer understanding:

Log Generation:
Various systems, applications, and devices generate logs. These logs contain records of events, transactions, and activities. Examples include server logs, application logs, network device logs, and security logs.

Log Collection:
The process begins with collecting these logs. This can be performed through agents installed on servers or devices, or through centralized log collectors that pull or receive logs from various sources.

Log Transmission:
Once collected, logs are transmitted to a central location. This transmission can be done over the network using protocols like Syslog, HTTP/HTTPS, or FTP.

Normalization and Parsing:
Logs from different sources often have varied formats. Normalization is the process of converting these logs into a consistent format. Parsing involves breaking down the log entries into identifiable fields for easier analysis (e.g., timestamps, IP addresses, error codes).

Storage:
The ingested logs are stored in a database or a log management system. This storage needs to be scalable and efficient, as log data can be voluminous.

Indexing:
To facilitate quick retrieval and analysis, logs are indexed. Indexing involves organizing the data in a way that makes it easily searchable.

Logging Levels
Logging levels are a way of categorizing the severity or importance of the messages logged by an application or system. These levels allow developers and system administrators to control the granularity of log output, making it easier to diagnose issues and understand system behavior. Here are the most common logging levels, typically found in many logging frameworks and systems:

Trace (or Verbose): The most detailed level, used for fine-grained informational events. It's typically used for full visibility during development or debugging. Trace logs include detailed information about the application's behavior and are usually too verbose for use in a production environment.
Debug: Provides information useful for debugging. Debug logs contain less granular detail than trace logs but more than higher levels. They are often used to diagnose problems in development and test environments but are usually turned off in production due to their potentially high volume.
Info (or Information): Used for informational messages that highlight the progress of the application at a coarse-grained level. Info logs provide general information about the application's operation, such as startup and shutdown events, configuration details, or major operations being performed.
Warn (or Warning): Indicates potentially harmful situations or unexpected events that might require attention but are not necessarily critical. Warnings are used to log issues that are not errors but could potentially lead to errors or other issues in the future.
Error: Used to log error events that might still allow the application to continue running. Error logs are critical for logging exceptions or other issues that disrupt the current flow of execution but do not necessarily cause the application to stop.
Fatal (or Critical): Represents very severe error events that presumably lead the application to abort. Fatal logs are used for unrecoverable errors that cause the application to crash or terminate. These are the highest priority logs and indicate serious problems that need immediate attention.
Off: This level is used to turn off logging. When set, no logs will be written at all.
 

Event Logs
Understanding which events within the Windows Event Log indicate a security breach is important. Normally, critical settings can be changed only by users with privileges. One such user is the Domain Admins. If one or more users have been added to this or any other privileged group, be sure to verify a Request for Change (RFC) has been submitted and approved before making the addition. 

In the Application log, event IDs 1000, 1001, and 1002 might indicate multiple attempts at a service disruption. It is good practice to keep an eye on business applications. Clearing event logs and changes in audit policy may indicate a malicious user has attempted to erase evidence of wrongdoing. Additionally, events 4719 and 4739 may indicate unauthorized modifications to Audit or Account policies. 

Event logs provide details about a system and connected components. Administrators can view all Windows system’s event logs via the Event Viewer utility. This feature makes it much easier to browse through the thousands of entries related to system activity, as shown in Figure 2.5. It is an essential tool for understanding the behavior of complex systems like Windows and particularly important for servers. Servers are not designed to always provide feedback through the user interface.





Figures 1.1: The Event Viewer main screen in Windows 10

Syslogs 
The Syslog protocol does not have a standard messaging format. Some messages are in human-readable form, while others are not. Syslog servers should be configured to respond to specific alerts and alarms with their corresponding messages. In Syslog, ‘facility’ denotes the source of a message on any system. Facility 0 refers to a kernel message and facility 11 to an (File Transfer Protocol) FTP message. Severity level indicates the level of importance. A message with a severity of 0 indicates an emergency. Severity 1 means there is a need for urgent action. Syslog packet size is limited to 1024 bytes.

Syslog servers enable a Security Analyst to probe for any vulnerabilities and threats that require urgent attention.

Syslog is widely used to log events from distributed systems because it enables centralized logging of events from multiple sources and has an open format for event logging messages. Syslog messages from servers, workstations, routers, and switches can be collected into a single database. This makes it convenient to view and analyze data.

A dedicated syslog server must follow the Syslog “Standard”

Three distinct layers are in the Syslog Standard:

Syslog content - this refers to the information and data found in a syslog-based event message.
Syslog application - this generates, interprets, routes, and stores the respective event message. 
Syslog transport - this transmits the event message over the network in the client server topology.
The Syslog Server does not proactively seek out event messages being transmitted across the client server network topology. Rather, it is reactive, meaning that it only discerns and analyzes the event messages fed into it from other network devices.

A syslog server should have a large hard drive with lots of CPU and specialized memory. Such servers are required to run and analyze large reports and archive all event messages from every device on the client server network.

The syslog data packet is comprised of three components:

The Priority Value
It is a numerical value to indicate the priority level of the event message as recorded by the Syslog Server. The priority value is calculated using the following formula:  Facility Value * 8 + The Severity Value = The Priority Value 

For example, if the event message “Mail System” is received, the facility value is 2. If the corresponding event message is “Emergency: Alert:  Action Must Be Taken Immediately,” the severity value is 1.  The priority value is, <17>.  All priority numerical values are denoted in brackets.

The Header
This part of the syslog data packet consists of the timestamp, the hostname and/or the IP address of the specific network device. In the header, the priority level, the version history of the content of the created event message, the application(s) using the syslog mechanism, the process ID, and the message ID are found.

The Message
The Message is the last component of the syslog data packet and takes up the remaining space in the packet. The message contains metadata about the network device as well as the relevant content of the message.

Intrusion Detection System (IDS) report 
Retaining Intrusion Detection System (IDS) reports to analyze IDS results over a length of time can give a clear sense of system activity during a specified time. 

IDS software can scan system log files to detect an intrusion, but log files contain a great deal of information. To save time, a filter can be used to scan specific entries. A port-sniffing IDS examines network activity. Maintaining several IDS reports enhances the understanding of the information systems environment.

Skip to main content
Completion requirements
 Done: View
Infrastructure Concepts
Infrastructure refers to the fundamental physical and virtual resources and services that are necessary to operate, manage, and expand an organization's IT environment. Here are some key infrastructure concepts:

Hardware Infrastructure:
Hardware structure includes Physical or Virtual machines that provide computing power for running applications and services. The storage systems are also part of it. These include devices and technologies used for storing data, such as Hard Drives, SSDs, NAS (Network Attached Storage), and SAN (Storage Area Network). Moreover, Networking Equipment with devices like routers, switches and firewalls, that enable network connectivity and security are part of Hardware Infrastructure.

Software Infrastructure:
Software Infrastructure primarily includes Operating Systems. It manages hardware resources and ensures common services for Computer programs. The Software infrastructure also includes Middleware. It enables communication and data management between operating systems and applications.

Network Infrastructure:
Network Infrastructure is the interconnected framework that allows computers and other devices to communicate with each other. This communication can be both within an organization and externally. This infrastructure consists of hardware and software components designed to ensure smooth and secure data transmission.

The hardware part of network infrastructure includes routers, switches, and firewalls. Routers play a crucial role in directing data traffic, ensuring that information sent over the network reaches the correct destination. Switches connect multiple devices on a local network, facilitating communication and data sharing among computers, printers, and servers. Firewalls act as security guards for the network, monitoring incoming and outgoing traffic to protect against unauthorized access and cyber threats.

On the software side, network infrastructure relies on various protocols, like TCP/IP, which set the rules for data transmission over the network. This ensures that devices with different designs and programming can communicate effectively.

Another key component is the physical network connections, which include copper cables, fiber optics, and wireless technology. These connections can form local area networks (LANs) within a single building or wide area networks (WANs) that connect multiple locations.

Cloud Infrastructure:
Cloud infrastructure refers to the virtualized resources that deliver computing services over the internet. It's a powerful model that allows users to access and store data, run applications, and manage processes without needing physical hardware on-site. At the heart of cloud infrastructure are servers, storage, and networking capabilities, all hosted in remote data centers. These resources are maintained and managed by cloud service providers, offering users scalability, flexibility, and cost-efficiency.

Cloud infrastructure comes in various forms, including public clouds, where services are offered over the public internet; private clouds, which provide dedicated resources for a single organization; and hybrid clouds, which combine elements of both public and private clouds.

Data Center Infrastructure:
Data center infrastructure includes the physical and hardware-based resources essential for running an organization's critical IT operations. It primarily comprises Data Servers which store and process data, and storage systems that securely hold vital information. These are supported by a network of power supplies, cooling systems, and connectivity solutions that ensure the smooth and uninterrupted functioning of the data center.

Security Infrastructure
Security infrastructure refers to the comprehensive framework of technologies, processes, and practices designed to protect networks, computers, programs, and data from attack, damage, or unauthorized access. This infrastructure is essential for safeguarding an organization's information assets and maintaining the trust of stakeholders and customers.

At the core of security infrastructure are various technologies like firewalls, antivirus software, intrusion detection and prevention systems (IDPS), and encryption tools. Firewalls act as barriers between trusted and untrusted networks, controlling incoming and outgoing network traffic based on security rules. Antivirus software scans for and removes malicious software, while IDPS monitor network and system activities for malicious activities or policy violations.

Physical security measures, such as biometric scanners, surveillance cameras, and secure access controls to data centers and server rooms, are also integral to security infrastructure. They prevent unauthorized physical access to critical hardware and storage systems.

Network Architecture

Network architecture refers to the design of a network of computers. It provides a framework for the specification of a network's components, their functional configuration and organization, and the protocols used. Many different types of network architecture exist. Essentially it describes how computers in an organization talk to each other.

Physical
Numerous physical components are involved in a network. These typically include servers, clients, peers, transmission media, and connecting devices. Servers are computers with a high-configuration that manage the resources of the network. Clients are the computers requesting and receiving services from the servers allowing them to access and use the resources of the network. Peers are computers providing and receiving services from other peers in a workgroup network. Transmission media are the various channels where data is transferred from one device to another in a network. Examples include fiber optic cables and coaxial cables. Connection devices act as the middleware between networks and computers. They work by binding the network media together and include the following hardware devices: routers, hubs, bridges, repeaters, gateways, and switches.

Software-Defined Networking (SDN)
SDN is a collection of technologies separating the network control plane from the forwarding plane. This allows for more automated provisioning and policy-based management of all network resources. In other words, it is a network architecture design which allows the network to be centrally controlled using software programs. SDN makes it much easier for organizations to manage the network more consistently regardless of the underlying network technology. SDN also provides companies with more control over the network through the use of a centralized approach and allows them more control over things like bandwidth, security and policies.

Diagram of SDN
Virtual Private Cloud (VPC)
A VPC is an isolated section of the cloud allowing customers to launch resources in a virtual network they define. Consequently, customers have complete control over their virtual networking environment. Some advantages of this include the ability to select IP address range, configuration of route tables, and network gateways as well as the creation of subnets. VPCs can be used for multiple purposes, including placing a public facing subnet for web servers with internet access in a VPC. Additionally, the backend system could be placed in a private facing subnet with no internet access. Multiple layers of security can be added according to set requirements. This model is useful and allows for a great deal of customization for customers.

Virtual Private Network (VPN)

A VPN is software enabling an encrypted connection over the internet from a device to a network. This ensures data transmitted over the connection is secure from anybody who may be eavesdropping on the same network. A VPN is a particularly useful piece of software when using public networks where anybody could be eavesdropping on transmitted data. Organizations will also use VPNs as a means for employees to securely connect to the internal servers and allow them to conduct work remotely.

Employees typically connect to the Remote Access Server (RAS) via the Internet, using various remote access methods and mechanisms. If a hacker manages to exploit a remote access point, the VPN server can be penetrated. It is imperative to ensure hosts can connect to the network only if their laptops or other devices meet security requirements, including up-to-date patches and anti-virus definitions. Access controls must be enforced to prevent unauthorized users from using remote access ports.  

When using a VPN, use: 

An Internet Service Provider (ISP)
A public based TCP/IP address
A Tunneling Protocol which is a secure tunnel for data packets as they move across a public network, such as the Internet. It enables encapsulation of data from private networks.
Below are a number of common VPN protocols to be familiar with:

Point-to-Point Tunneling Protocol (PPTP) - This is one of the oldest VPN protocols developed by Microsoft in the 1990s and first integrated into Windows 95 for dial-up connections. As technology advanced, PPTP’s encryption protocols were cracked and are no longer considered secure. However, as it lacks the security features found in other VPNs, it can offer the fastest connection speeds for users who do not require heavy encryption.

Layer 2 Tunnel Protocol (L2TP/IPSec) - A replacement of the PPTP protocol, L2TP offers no encryption or privacy and is often paired with the IPSec security protocol. Once these are paired, L2TP/IPSec is very secure and has no known vulnerabilities. It is widely used and has good speeds but is easily blocked due to reliance of UDP on a single port.

OpenVPN - An open-source protocol which has grown in popularity due to its use of AES-256-bit key encryption with 2048-bit RSA authentication and a 160-bit SHA1 hash algorithm, which is virtually unbreakable. This protocol offers the strongest encryption but slower speeds as a result.

Secure Socket Tunneling Protocol (SSTP) - A popular protocol offering full integration with every Microsoft OS. It uses 2048-bit SSL/TLS certificates for authentication and 256-bit keys for encryption. This option offers good security and is difficult to detect or block.

Internet Key Exchange version 2 (IKEv2) - This is a common tunneling protocol providing a secure key exchange session. IKEv2 is usually paired with IPSec for encryption and authentication, similar to L2TP. This protocol is great at re-establishing the link after a temporary connection loss and specializes in switching connections across network types such as from WIFI to cellular. It is fast, mobile friendly, offers network switching capabilities, and open-source options.

Skip to main content
Completion requirements
 Done: View
Identity and Access Management
Identity and Access Management (IAM) is a comprehensive framework of policies, processes, and technologies designed to ensure that the right individuals have the appropriate access to a system's resources. IAM is a crucial component of cybersecurity, aiming to establish and manage digital identities, control access permissions, and safeguard sensitive data within an organization.

Privilege Management
This involves controlling and administering digital user identities and assigning rights to those identities to perform actions on specified resources.

Multi Factor Authentication (MFA)
MFA is a security control requiring more than one mode of authentication from users when they attempt to sign into accounts or use services. An example would be the user signing into their account using their password followed by entering a code the system sends to their phone. This ensures that even if the user's password is weak or compromised, an attacker is unable to login unless they also have the person's phone. MFA greatly increases the security of an organization’s accounts and critical services.

Attribute-based Access Control (ABAC)
ABAC defines access control rules through the use of attributes as building blocks in a structured language. These attributes are sets or properties used to describe every entity which must be considered for authentication to an account or service. Every attribute consists of a key-value pair, for example “Role=Employee”. ABAC is used to control security and access on a more fine-grained basis. For example, instead of granting an employee access to a server all the time, ABAC can restrict access to certain times of the day or until they are in a certain location. This helps reduce security issues. Essentially, ABAC draws on a number of attributes, namely user attributes, environmental attributes, and resource attributes to make more secure decisions around access control.

Mandatory Access Control (MAC)
MAC is based on a hierarchical model.  MAC uses security levels assigned to users and all objects are assigned a security label. Users can only access objects matching a security level equal to or lower than theirs. The administrator controls access in this model and they set all permissions. Users cannot set their own permissions, even if they own the object.

As a result, MAC systems are considered very secure. The use of centralized administration is a key part of this. Due to the high security level in MAC systems, this model is often used in government systems. It ensures users can only access data they are authorized to access. However, this model can be quite cumbersome for the administrator assigning all permissions to all users.

Cloud Access Security Broker (CASB)
CASB’s are security policy enforcement policies on-premises or cloud-based. They are placed between cloud service customers and providers to enforce security policies as the cloud-based resources are accessed. Examples of security policies used in this scenario include authentication, encryption, single-sign-on, logging, etc. A CASB protects systems against cyberattacks through the use of malware prevention. They also provide data security through the use of encryption, making data streams unreadable to outside parties.

Encryption

Encryption ensures that the information is received by the correct entity and that it is not modified either during transmission or at rest. Information assets can be protected from being accessed by unauthorized parties by encrypting data at rest (while stored) and data in transit (when crossing a network). Encryption uses an algorithm to scramble or encrypt data and then uses a key for the receiving party to unscramble or decrypt the information. The message contained in an encrypted message is referred to as plaintext. In its encrypted, unreadable form it is referred to as ciphertext.

Hashing Algorithms
Password hashing is a basic security technique. The principles of cryptography are primarily used to encrypt or decrypt messages sent between two parties, (sender and receiver). However, cryptography accomplishes other important functions as well.

One applicable example of how cryptography is applied is the case of a third party receiving a message. The receiver of the message may be able to decrypt the ciphertext message, but does not have the assurance the actual message has not been tampered with or altered by a malicious third party. There is no foolproof way to ensure a message has not been tampered with, and some malicious third parties are very good at covering their tracks.

Currently, the only way to determine if a ciphertext message has been altered is to create and implement a special alert for it through the “Hashing Algorithm.”  In technical terms, the Hashing Algorithm takes a variable ciphertext message string and converts it into a fixed length value.

The Hashing Algorithm is a one-way function; it can only confirm the integrity of the message from the sending party to the receiving party. Hashing Algorithms also facilitate the following two functions:

A Hashing Algorithm provides the necessary checks to ensure the integrity of the ciphertext message remains intact while in transit between the sending and receiving parties.
If a Hashing Algorithm is received, compared with the originally transmitted hash, and found to be identical, the sending and receiving parties can then feel confident the message has been received without modification. 
The larger the Hashing Algorithm, the higher the likelihood the ciphertext message will remain intact while in transit between the point of origination and the point of destination.   

The following Hashing Algorithms have been developed over the last several decades:

The MD5 Hashing Algorithm: This generates a Message Digest of 128 Bits.
The SHA-1 Hashing Algorithm: This generates a Message Digest of 160 Bits.
The SHA-2 Hashing Algorithm: The SHA-2 generates longer digests between 256 and 512 bits.
The RIPEMD Hashing Algorithm: This generates a Message Digest of varying lengths, from 128 to 160 to 256, or even 320 Bits.
Hashing Algorithms are also used to confirm the integrity of both downloaded files accessed from the corporate intranet, as well as the login credentials used by employees. When using a Hashing Algorithm, keep the following in mind:

To guarantee maximum effectiveness, a Hashing Algorithm should be used across the entire plain text message, not just part of it.
The most robust Hashing Algorithms consist of a property known as “High Amplification.” This means that even a small alteration to the ciphertext message will change the mathematical value of the Hashing Algorithm almost exponentially.
A Hashing Algorithm should consist of a property known as “Collision Resistance.” This means that the same mathematical value derived after a ciphertext message is received cannot be used again in a corresponding reply to the sending party.
Authorities need the data analyzed as an exact replica of the data on disk to prove no tampering.  This can be done by creating a fingerprint or cryptographic hash of the contents.

Cryptographic hash functions include the Message Digest Algorithm (MDA / MD5) and the Secure Hash Algorithm (SHA).

The MD5, which is more widely used than MDA, is not necessarily a secure means of protecting passwords or digital-certificate signatures. Hackers have found vulnerabilities to exploit. However, MD5 remains the default option for quite a few forensic utilities because it scores a little higher than SHA on speed of execution and compatibility with other tools.

SHA was developed by NIST for the US government as a more secure alternative to MDA and MD5. The two versions in use today are SHA--1 and SHA-- 2. Though neither version is considered completely secure, security protocols such as IPsec and SSL employ SHA–2.

Image acquisition tools usually feature automated fingerprint calculation and verification capabilities. Some tools implement both MD5 and SHA hashes.

Command-line tools such as Windows certutil and Linux md5sum and sha512sum can also be employed for this task.

MD5sum – md5sum is a Linux tool used to calculate the fingerprint of a file.
SHAsum – sha1sum, sha256sum, and sha512sum are used to calculate and verify file fingerprints.

Appliances also run the risk of being compromised through web-administrative interfaces. Protecting against vulnerabilities such as cross-site scripting (XSS) and cross-site request forgery (CSRF or XSRF) is essential. Secure Shell (SSH) was developed for UNIX operating systems. SSH should be used to encrypt remote logins by employees of a business and network/system administrators. Another option is to prevent system-management stations responsible for configuring network appliances from accessing the Internet. This can help protect these devices from being exploited through unsecured browsers.

Active Defense
Active defense is a term used to describe the use of offensive actions to outsmart a real attacker and make an attack more difficult for them to carry out. Slowing down the attacker to prevent advancement or completion of the attack increases the chances the adversary will make a mistake, expose their presence, or reveal their attack vector.

Sometimes active defense will include striking back at an attacker in a process known as a hack back. This is a process usually only available to military and law enforcement who have the resources and authority to carry out such an action.

An example of a common active defense technology would include deception technology designed to detect an attacker as early in the attack cycle as possible by obfuscating the attack surface with realistic decoy devices, bait, and breadcrumbs all intended to mislead the attacker from the real systems. Active defense can also be used as a means of gathering threat intelligence about a target. This is done by analyzing how an attacker acts when they come across one of the decoy systems.

Sensitive Data Protection
Some types of data require special considerations with regard to storage and transmission. Unauthorized disclosure of the following types of data may have serious, adverse effects on the associated business, government, or individual.

Personally Identifiable Information (PII)
PII refers to personal identifiers such as name, date of birth, address, and social security or other unique identification numbers. Social security numbers are unique, but more than one individual can have the same name or birthdate. Therefore, individuals should be identified by a combination of their full name, birth date, address, or social security or other unique identification number.

In order to reset a password or confirm an identity, a PII may be required. For example, questions such as “Who was your favorite teacher in school?” may be asked. If the answer matches the response recorded when the account was set up or the personal information was changed, it is taken as a confirmation of identity.

Criminals are always looking for ways to steal PII to help commit credit-card fraud, wipe out bank balances, and launch other such attacks on consumers. It is imperative that organizations treat PII as highly sensitive data and implement multiple robust controls to protect PII databases.

Personal Health Information (PHI)
PHI includes information about pathological and other medical tests, medical history, and medical insurance. If PHI is used for disease-and health-related research and analysis, all personal identifiers must be removed from PHI to protect individual identities of participants. This anonymized data set includes codes to enable reconstruction of data. The reasons criminals target PHI include medical-insurance fraud, blackmail, and to damage the organization. PHI is different from bank-account and other financial information in that it cannot be changed. Therefore, by compromising PHI, criminals can wreck an organization’s reputation.

Sensitive Personal Information (SPI) 
SPIs are types of information that receive special treatment and have certain standards designed to protect this information. An example is Payment Card Information. Payment card information refers to a unique card number, the date of expiration, and the Card Verification Value (CVV). The Personal Identification Number (PIN) is not to be revealed to the bank or the merchant and is known only by the card holder. Hackers may also try to obtain an individual’s name and address in order to misuse payment cards. The Payment Card Industry Data Security Standard (PCI DSS) provides guidelines for the secure transmission, processing, and storage of payment card information.



Figure 1.2: PCI DSS goals and requirements for merchants and other entities involved in payment card processing.

High Value Assets (HVA)
HVA includes information critical to the function of an organization. Examples include sensitive controls, instructions, formulas, and operating data housed in the system. Loss of this data would have a catastrophic impact on the organization’s ability to operate. Given its importance to organizations, HVAs are often targeted by adversaries seeking to disrupt an organization via data destruction or ransomware attacks.

Intellectual Property (IP)
In a business context, IP comprises product or service specific information created by the organization or associated individuals such as employees. IP includes patents, industrial designs, and trademarks. Logos, symbols, processes and brand names. Foreign governments may also attempt to steal sensitive data from organizations, especially those involved in the defense industry.

IP also refers to literary, artistic, and other creative ideas and inventions by individuals.

Corporate Confidential
It is fairly common for companies to want to know about the profits, market share, cash flow, and other aspects of business operations of their competitors.

Accounting Data
Accounting information, including data about cash accounts, needs to be protected with multiple security controls, especially since hacks can be launched from within the organization. In addition to access controls, restricted permissions, and the separation of duties, continuous monitoring is necessary to prevent misappropriation of funds by insiders.

Mergers and Acquisitions (M&A)
Information pertaining to the merging or acquiring of one business by another is highly sensitive and should be kept strictly confidential. Bad actors will try and obtain M&A data in order to disrupt deals or impact share prices. Lawyers, financial companies, and accounting firms hired for M&A operations need to undertake due-diligence procedures in order to demonstrate that they are able to implement necessary security controls.

Data Loss

Data loss plays a significant role in the context of data protection, and understanding its implications is crucial for implementing effective security measures. Data loss refers to the unintentional or accidental destruction, corruption, or compromise of data, leading to its unavailability or irretrievability.

Skip to main content
Completion requirements
 Done: View
Analyzing indicators of potentially malicious activity is a fundamental aspect of security operations, involving the systematic examination of various signals and anomalies to identify potential security threats. Security analysts rely on a combination of tools, technologies, and human expertise to scrutinize network traffic, system logs, and user behavior for irregular patterns that may indicate malicious intent. Indicators such as unusual login attempts, unexpected system modifications, or abnormal network communication can be early signs of a security incident. Advanced threat intelligence feeds, machine learning algorithms, and behavioral analysis play key roles in discerning between normal and suspicious activities. Timely and accurate identification of these indicators enables security teams to respond swiftly, mitigating potential risks, and fortifying the overall cybersecurity posture. In essence, the proactive analysis of indicators of potentially malicious activity is a cornerstone in the continuous effort to detect, investigate, and neutralize security threats within a dynamic and evolving digital landscape.

Skip to main content
Completion requirements
 Done: View
Network monitoring yields significant volumes of data for security analysts to study and interpret. Automated tools and visualization programs will help detect signs of incidents and threats. However, it requires experience and expertise to interpret information correctly. It is important to know information about an organization’s bandwidth consumption, beaconing, irregular peer-to-peer communication, rogue devices on the network, scan/sweep, unusual traffic spike, and common protocol over non-standard ports.

Bandwidth Consumption
Because high bandwidth consumption can indicate malicious activity, it’s always good practice to investigate and pinpoint the cause of any abnormally high bandwidth consumption. Regularly monitoring network traffic for deviations from the average packet size can help. 

Beaconing
Beaconing refers to traffic flowing out of the network at regular intervals. While authorized programs also beacon, beaconing can happen if malware is attempting to download tools and updates or communicate with a remote Command and Control (C2) network or host. Most beacons use the HTTP or HTTPS protocol. The use of HTTPS is increasingly common as attackers encrypt data transfers and their C2 communications. 

One way to detect beaconing is to bag and analyze metadata relating to every established or attempted session. Analysts should always investigate any unusual patterns. A nuanced analysis is necessary because beacons are also used for legitimate purposes. Analysts should watch for endpoint devices with untrustworthy IP addresses, packet size, and timing of beacons.   

Irregular Peer-to-Peer Communication
Normally, user traffic on networks moves between clients and servers. A traffic map will show traffic flowing from several clients to fewer servers. However, instances of workstations directly connecting with each other or hosts on the Internet need to be investigated, particularly if this happens at unusual times or is accompanied by high bandwidth consumption. Anomalous traffic flows are difficult to detect if an attacker manages to breach one or more servers.

If signs of communication with a dubious internet host are detected, they should be investigated immediately. IP addresses of unreliable internet hosts should be kept on file. Lists of doubtful hosts are available from providers who evaluate the reputation of internet hosts.

Rogue Devices on the Network
Rogue devices are unauthorized infrastructure on the network. Several different technologies are used to detect the presence of rogue devices. These technologies include network appliances, network taps, servers, workstations, mobile devices, and smart appliances.

Network Appliances – Attackers employ rogue wireless routers or switches to collect address data and authentication credentials when authorized clients attempt to connect to the network. An insider can use unauthorized network appliances to intercept data packets by configuring a rogue device to function as the Man-in-the-Middle. They can also alter and release data for transmission to authorized devices to escape detection and continue to access the network. Analysts need to be on the lookout for anomalous addressing actions and deviations in routing or switching activity.

Network Taps – These are physical appliances affixed to network cabling to log data packets moving over a section. Network monitoring software will not normally distinguish taps that have been attached to wiring from other authorized devices. Consequently, the only option is to conduct a physical inspection of network cables.

Workstations and Mobile Devices – Endpoint devices can remove data, survey the network, or be the source of malware. Unauthorized cameras may also be installed on the network. Legitimate devices can also be utilized for unauthorized activity if a device is stolen or an insider launches an attack. An example would be using an authorized workstation to run an unauthorized scan.

Implementing Network Access Control (NAC) tools will help prevent an attacker from installing rogue devices on a network. If a user logs into their email account from an unfamiliar device, an authentication code is sent to a secondary email account or device to determine if they have authorized access. This helps prevent the unauthorized use of accounts. NAC software can also detect unauthorized attempts to connect to a network. By implementing access controls and firewalls with appropriate permissions, analysts can ensure all network management and administration activities execute only from authorized devices 

Servers – Attackers sometimes set up a server to collect IP addresses in bulk or other data, particularly in a virtualized zone. They can then initiate a DoS attack and divert traffic by providing wrong IP addresses. Intrusion detection systems configured with relevant signatures will enable analysts to counter rogue servers.

Smart Appliances – Monitoring of printers, webcams, and other smart devices is necessary to prevent attackers from exploiting firmware vulnerabilities. It is also good practice to monitor TVs and other appliances that have embedded computing and networking capabilities.

Scan Sweeps
While intrusion detection systems are capable of detecting unauthorized scanning in most cases, hackers have discovered several methods to evade detection. Sparse scanning is one of these methods. One way of minimizing the risk of unauthorized scans is to ensure that legitimate network scans are only executed from a limited number of hosts. A scan traced to an unapproved IP address must be investigated.

Unusual Traffic Spikes
Sudden surges in network traffic from hosts on the Internet may indicate a DDoS attack. Thwarting a DDoS attack is challenging. Analysts will need to differentiate between legitimate and malicious connections. In order to neutralize an ongoing attack, log data needs to be analyzed in real time. This will enable analysts to detect unusual traffic as it occurs and act to immediately divert such traffic to a sinkhole. Analysts can also move processing from the compromised server to other servers. Hosts on a network may also have been affected if the attacker is using them as bots. Surges in outbound traffic can be a sign of this happening.    

Common Protocol over Non-standard Port  
Common protocols such as FTP, SMTP, and SNMP use standardized default port numbers. However, it is possible to run these protocols over different port numbers. Whenever this is being done, treat the transmission with suspicion because using a non-standard port is not normal. It also is a way of evading ACLs that prevent traffic on the default standard ports. Running a common protocol over a non-standard port is also used legitimately to prevent DoS attacks on default standard ports by shifting a well-known service to a non-standard port number. So, it is a technique used by both sides.

 
Skip to main content
Completion requirements
 Done: View
In cybersecurity, a point of compromise refers to a vulnerable or exploited component within a system or network that enables unauthorized access, data breaches, or other security incidents. Identifying and addressing points of compromise are critical for enhancing the overall security posture

Indicator of Compromise (IoC) Generation
IoCs are pieces of forensic data that identify potentially malicious activity on a system or network. IoCs often act as a breadcrumb trail leading IT professionals to detect the early stages of malicious activity on the corporate network or systems. 

IoCs can be difficult to find and can range from simple metadata elements or a complex series of code. This data may consist of system log entries, files, Intrusion Detection System (IDS) alerts, etc. IoCs help security researchers detect data breaches, malware infections, and other threat activity. It is important that organizations monitor for indicators of compromise. If an IoC is found, it should be acted on quickly in order to limit the potential damage. 

Organizations should include these indicators to their rules in their intrusion detection or prevention system (IDS/IPS). A wider net can be cast by sharing IoCs with business partners and even competitors in the industry. This is where organizations such as the US-CERT and the ISACs can be helpful in keeping large groups of organizations informed and protected against known attacks.

Monitoring
After the CSIRT team has successfully responded to the incident, implemented new controls, and run updated vulnerability scans to ensure everything is on the up and up, the team still needs to ensure they improve the ability to react to similar attacks from the same bad actor. Armed with the information on the adversary’s TTPs, a monitoring plan can be updated to help detect similar attacks.

Host-Related Indicators of Compromise
Substantial increase in resource consumption is not always due to malware. Numerous applications starting up simultaneously when starting Windows can cause spikes in resource usage. To detect signs of malware, analysts should monitor performance over an extended period.

System logs are just one method of investigating a host for signs of malicious activity. A number of other software utilities are available to detect breaches. Many types of malware are programmed to recognize process analysis utilities and prevent the tool from running.  The malware can also shut the tool down as soon as it detects the tool is starting up. Consequently, it is advisable to run these tools from a different OS instead of the host. Analysts can use incident analysis software, such as Windows Sysinternals, Windows Forensic Toolchest (WFT), or FireEye’s Redline.

After noticing unusual network behaviors such as those discussed in the previous section, the next step is to look at the suspicious host to see if a benign explanation is to blame for anomalous behavior. Following the evidence and not jumping to conclusions is important, because it is often difficult to get a clear picture of an intrusion simply by examining network traffic or behaviors.

Processor Consumption
One method of threat detection is to determine process-specific resource consumption. Doing so will enable the identification of which process/processes are consuming CPU resources. Analysts can then investigate each process to find the reason.

Memory Consumption
High memory usage does not necessarily point to malicious activity. For example, Windows operating systems are programmed to make maximum use of memory. Something could be wrong if memory consumption by a particular process continuously increases without being freed up again. This is a “memory leak” and can occur due to malfunctioning software or malware. Online resources are available to help analysts discover memory usage according to file size. When deviations in typical memory usage occur, it warrants further investigation. 

Drive Capacity Consumption
Malware can also consume high drive capacity. Unauthorized network scanning can generate large log files, as well as files intended for exfiltration via USB or the network, and cache them on the local drive. 

Disk usage tools can help show how much disk capacity each directory uses. Investigating for file access and modification is also necessary. Search tools can be employed to see the details of file access and modification, including the most recent dates of file access and alteration. Figure 1.2 shows a Windows 10 system that is mostly idle and not compromised.





Figures 1.2: Windows 10 Resource Monitor

Unauthorized Software
Unauthorized software refers to malware, as well as authorized software, installed on rogue devices. Watch for unauthorized vulnerability scanners, network-mapping tools, and administrative tools on endpoint workstations. An insider could employ such types of software to launch an insider attack.

To prevent the installation of malware, analysts need to first define the authorized software and then implement controls to allow installation of only authorized software. On Windows systems, analysts can restrict unauthorized software from running by configuring Software Restriction Policies under Group Policy.

Analysts need to ensure not all users are granted local admin permissions. This can help prevent an insider from using legitimate software for malicious use. 

Malicious Processes
When examining a host for signs of malicious activity, it is important to filter out legitimate processes occurring in the normal course of operations. Process Explorer from Windows Sysinternals can help detect malicious processes.

Attackers use different methods to introduce malware. They might deceive a user into running the malicious program or take advantage of a vulnerability to run a program without permission. Once malware gains access to the system, it can inject malicious code into a legitimate process enabling it to run as part of the host process and access permissions. This is how malware penetrates firewall access control lists. Common methods used by hackers to insert malware onto a network include DLL injection, DLL side-loading, masquerading, and process hollowing.

To help identify a malicious process, analysts should watch for processes with unfamiliar names, particularly if they resemble a valid host process. One way to detect suspicious activity is to use the Search Online function to identify known processes. Anonymous processes lacking version details, icons, company names, and descriptions should always be investigated. Unsigned processes could indicate malicious activity, but not always. Some old software, though legitimate, may be unsigned. If an unsigned process with the name of a well-known organization is discovered, such as Microsoft Corporation, analysts should still investigate.

An attacker can also have malware signed by stealing the private key from an authorized developer or covertly installing a root certificate. Use Process Explorer to match signatures against publisher information in the “Company” field. Sysinternals sigcheck function enables verification of a signed file’s certificate. 

When analysts come across packed or compressed files, the legitimate ones should be identified, and suspicious files should be investigated. All processes executed from taskmgr.exe, explorer.exe, other windows utilities, and svchost.exe, should be scrutinized. Examining processes lacking a legitimate parent/child relationship with a key Windows’ processes is also advisable. Once an analyst detects a potentially harmful process, the method of interaction with the Registry and other databases should be pinpointed. Analysts can use the Process Monitor tool for this. In order to intercept the process, analysts should:

Determine how the attacker launched the process and find out where the image file is located.
Identify files being compromised by the process.
Find out what happens if the process is deleted. The file might be restored when the system is rebooted.
Detects why the process is unable to be deleted. If that happens, the attacker most likely has compromised privileges or blocked access to the process to prevent deletion.
Analysts also need to examine how the process interacts with the network. This involves identification of which ports it is using and with what domains it is communicating. 

Unauthorized Changes and Privileges
Because attackers can make changes to security policies and privileges, it is vital to audit system policies and privileges to detect deviations from the initial configuration. A number of tools are available to enable detection of unauthorized changes and privileges. For example, an analyst can use the Microsoft Baseline Security Analyzer to spot policy changes. Examining audit logs is one way of detecting privilege changes. Windows Sysinternals tools, such as AccessChk and AccessEnum, can be employed to inspect privileges relating to specific resources or files. 

Application-Related indicators of Compromise
A combination of methods should be employed to investigate application-specific symptoms. These may include examination of logs, user accounts, and process-specific details.  Ports used, as well as resources consumed by each process, should be examined.

Anomalous Activity
Unusual activity can be a sign of intrusion. If an analyst comes across an unusual request being repeated several times via different URLs, it could be an attacker conducting a survey of an application or database. Analysts can also investigate for code injected in HTTP packets.

Analyzing the packet size of HTTP responses will help detect whether an attacker has gained access to the network and is in the process of exfiltrating data.  

Introduction of New Accounts
All user accounts should only be created through a monitored process subject to change control procedures. Any accounts created without these controls need to be scrutinized.

Unexpected Output
When an attacker tries to manipulate an application, the user might see unusual strings or unformatted error messages. Unexpected output can also point to a Man-in-the-Browser attack, in which the attacker executed client-side code to infect a valid sign-in page by inserting form fields. These fields are intended to collect authentication IDs or PIIs.

Unexpected Outbound Communication
Deviations in outbound communication may indicate the presence of malware or a C2 channel. To investigate this, analysts can use a network utility tool, such as netstat, to list all open ports on the host and scrutinize the vis-à-vis outbound activity over the link. Mismatches in the ranges of ports must be investigated. If any mismatches exist, it is likely an attempt to conceal the usage of ports on the host.

If only usual ports are in use, port traffic can be analyzed to determine its legitimacy. A sniffer enables traffic analysis. However, malware can transmit C2 data over a normally used port. For example, although the TCP port 25 is legitimately used for SMTP, malware can still misuse it. Analysts need to analyze traffic to check if malware is sending C2 traffic via these ports.

The necessity of maintaining a list of doubtful IP addresses has been discussed previously. Analysts should scrutinize the destination IP addresses to find out whether any of them are suspicious.  

Service Interruption
Service interruptions can occur for a variety of reasons, including:

Process compromise – If a legitimate service keeps crashing, the cause could be that the process running it is compromised by malicious code.
Disabled security services – If Windows Update and antivirus software stop working normally, malware has likely intercepted these services to evade detection. Sometimes, malware disables services only temporarily to avoid arousing suspicion while continuing to access the system.
DoS attack – Services could be interrupted in a DoS attack, which may be intended to enable another type of attack.
Memory Overflows
Memory or buffer overflow is the method of exploiting a vulnerability in an application to crash the system or execute malicious code. A buffer refers to the part of memory assigned to each process for the writing of data. If the exploit is successful, data overruns the buffer while executing a specific operation and leaks into an adjoining buffer or program. The attacker normally aims to replace the function’s return address with his code.

One method of detecting buffer overflow is to execute the code in an isolated debugging zone. When a process on a production system consumes memory without subsequently releasing it, it may indicate an attempt to cause a memory overflow. Analysts can also identify a buffer exploit by its signature. However, determining the exact locations of the return address and the arbitrary code address in memory is not necessarily easy for the attacker. To get around this, they often employ a “NOP sled.” This means he continually repeats the instruction to execute nothing and move to the next location until the code locates the return address. Most intrusion detection systems, anti-malware solutions, and web-application firewalls can spot this type of code.   

Application Logs
Operating system application logs are a rich source of details about an application’s performance. They are a useful data source for detection efforts if continuously piped to security information and event management (SIEM) software. They can also be a key aspect of an auditing program in the case of business-critical applications. Application logs are also important response efforts since details of application records can provide insight into how an event may have unfolded.

Social Engineering
Attackers may also use social engineering to trick users into enabling functionality that is harmful to their systems. Such attacks embed a malicious script or macro into a legitimate looking document in an attempt to trick the user into enabling functionality to get their malware in the door. 

Phishing 
Phishing is a social engineering campaign where an attacker uses deception. It is often influenced by the profile an attacker has built about the target to manipulate the target into performing an act that may not be in their best interest. 

Phishing attacks come in many forms - from advanced phishing emails that seem to originate from a legitimate source, to phone calls requesting personal information. This type of attack is also carried out by implementing a fake website that closely resembles a legitimate website. Users enter data, including credentials, on the fake website, allowing the attackers to capture any information entered.

Spear Phishing: Phishing emails are exploratory attacks in which criminals attempt to obtain victims’ sensitive data, such as personally identifiable information (PII) or network access credentials. These attacks open the door for further infiltration into any network the victim can access. Phishing typically involves both social engineering and technical trickery to deceive victims into opening attached files, clicking on embedded links and revealing sensitive information.
Whaling: Whaling is defined as a targeted phishing attack aimed at wealthy, powerful, or prominent individuals (e.g. C-suite executives, public figures and celebrities). A whaling attack may also take the form of malicious actors masquerading as such individuals. For example, a malicious actor may masquerade as a hospital’s chief financial officer (“CFO”) and trick the recipient into divulging bank account information, employee information, corporate financial information, and/or transferring funds to an account controlled by the attacker.
Figure 1.4: General Phishing email example



Skip to main content
Completion requirements
 Done: View
The importance of utilizing appropriate tools and techniques for threat hunting in cybersecurity cannot be overstated. Threat hunting involves proactively seeking out and identifying potential security threats that may have eluded traditional security measures. Effective threat hunting requires specialized tools and techniques designed to analyze vast amounts of data, detect anomalies, and uncover hidden patterns indicative of malicious activity. These tools, ranging from advanced analytics platforms to threat intelligence feeds, empower security professionals to actively investigate and understand the evolving tactics employed by cyber adversaries. Leveraging such tools enhances the organization's ability to detect threats early in their lifecycle, minimizing the dwell time of attackers within the network. By staying ahead of potential threats through active and continuous hunting, organizations can bolster their cybersecurity posture, mitigate risks, and ensure a more resilient defense against the dynamic landscape of cyber threats.

Skip to main content
Completion requirements
 Done: View
Tools
Security processes can be tedious and repetitive. Whether testing software functionality for vulnerabilities or responding to frequently occurring incidents, a certain level of automation is helpful, particularly for activities that do not require a great amount of analyst intervention.

Workflow Orchestration
Workflow orchestration is the sequencing of events based on established parameters by using scripting and scripting tools. Over time orchestration has increasingly been used to automate processes formerly carried out manually by humans. In virtualization, it is quite common to use orchestration. For example, in the VMware world, technicians can create groups of virtual machines managed and orchestrated as a unit to provide a service to users. Using orchestration tools, one device can be set to always boot before another device.

Static Analysis Security Tools
Static Analysis Security Tools (SAST) become useful when conducting a code review. They reduce the amount of time during the code review as manually reviewing code takes a great deal of time. SAST tools work by analyzing the source code or binaries of an application for design or coding flaws. These flaws usually indicate some underlying security vulnerabilities and possible malicious code. These tools analyze the application from the “inside out” to test areas such as error handling, input validation, control structure, security, file update, and function parameter verification. They do not require the application to be running and are typically run during the SDLC, during the development of the application. This is a whitebox form of security testing as the tools will have access to all areas of the application in question. Various forms of static analysis can be performed including dataflow analysis, control flow analysis, structural analysis, semantic analysis, and configuration analysis. Some of the most popular tools include SonarQube and Veracode.

SonarQube can scan source code for bugs, vulnerabilities, and code smells in 15 languages and is an opensource tool. Numerous plugins for SonarQube are available. It can also review security hotspots in the code. Veracode is an open source SAST tool that can scan for bugs in many languages, including Android. Additionally, it provides a very useful feature in that it can provide instant feedback to developers about potential flaws in the design of their code while they are coding. This vastly reduces the time needed for security testing down the line as most problems are fixed at the source. Veracode is a comprehensive tool used to analyze web and mobile apps as well as microservices in most major programming languages and frameworks. When a flaw is found, Veracode provides the developers with remediation strategies in the form of automated advice, written guidance, and video tutorials.

Dynamic Analysis Tools
Dynamic Analysis Security Tools (DAST) require the code to be running to conduct analysis. DAST tools are often referred to as vulnerability scanners. They are considered an analysis tool rather than a testing tool as they analyze what is happening in the backend while the code is running. These tools are often used to detect memory leaks, identify pointer arithmetic errors such as null pointers and to identify time dependencies. Two examples of DAST tools include HCL AppScan and Netsparker. HCL AppScan can automate security testing to help protect against web application attacks and data breaches.  Netsparker is a popular web application security tool. One of its most useful functions is when it finds a vulnerability, it generates a proof-of-concept exploit which proves the vulnerability found is not a false positive.

Common Techniques

Automated Malware Signature Creation
Automated malware signature creation is an additional method of identifying malware. The antivirus software monitors incoming unknown files for the presence of malware and analyzes each file based on classifiers of file behavior and classifiers of file content. The file is then classified as having a particular malware classification. Subsequently, a malware signature is generated for the incoming unknown file based on the malware classification. This malware signature can be used by an antivirus program as a part of the antivirus program’s virus identification processes.

Data Enrichment
Data enrichment is a technique that allows one process to gather information from another process or source, then customize a response to a third source using the data from the second process or source. An example of data enrichment usage is when bulk email from a vendor is received, and it references the receiver’s first name. In that case, a file of email addresses is consulted (second process) and added to the response to the recipient. Another common data enrichment process is the correction of misspellings and typos in a database by using precision algorithms designed for that purpose. 

Data enrichment can also be used to extrapolate data. However, doing so may create a privacy issue under the EU General Data Protection Regulations (GDPR), resulting in privacy regulations that limit data enrichment. Users typically have a reasonable idea about which information they have provided to a specific organization, but if the organization adds information from other databases users may find they have given up information about themselves that they never intended. 

Threat Feed Combination
A threat feed is a constantly updating stream of intelligence about threat indicators and artifacts delivered by a third-party security organization. Threat feeds are used to inform organizations as quickly as possible about any new threats that have been identified. Threat feeds typically contain information on:  

Suspicious domains 
Lists of known malware hashes 
IP addresses associated with malicious activity.
Machine Learning 
Machine learning (ML) is the field of computer science that, when applied to security operations, can uncover previously unseen patterns and assist in decision-making without being specially configured to do so. 

A particularly exciting aspect of ML techniques is that they improve automatically through experience. As more data is provided to the model, the more accurately it will detect patterns automatically. When applied to security, ML utilizes algorithms to examine past network data to predict future activity. Techniques are currently used to process high volumes of data and identify patterns to make predictions about changes in network traffic and adversary behaviors. With mathematical techniques at its core, ML techniques are often effective at mining information to discover patterns and assigning information into categories.

Scripting
Scripting plays a significant role in threat hunting by providing cybersecurity professionals with a flexible and powerful means to automate tasks, analyze data, and conduct proactive investigations. Threat hunting involves actively seeking out potential security threats within an organization's network and systems, and scripting enhances this process in several ways:

Automating Repetitive Tasks:

Scripting languages, such as Python or PowerShell, enable the automation of routine and repetitive tasks involved in threat hunting. This includes tasks like log analysis, data parsing, and correlation, allowing analysts to focus on more complex aspects of the investigation.

Data Analysis and Parsing:

Scripts can be crafted to analyze large datasets efficiently. Threat hunters can use scripts to parse logs, extract relevant information, and correlate data from various sources, making it easier to identify patterns or anomalies that may indicate malicious activity.

Customizing and Extending Tools:

Threat hunters often use a variety of security tools. Scripting allows analysts to customize and extend the functionality of existing tools or create new ones tailored to their specific needs. This adaptability is crucial in addressing unique threats and scenarios.

Integrating with APIs and Threat Feeds:

Many threat intelligence feeds and security tools provide APIs for integration. Scripts can be written to interact with these APIs, enabling threat hunters to incorporate real-time threat intelligence into their investigations and enhance their understanding of the current threat landscape.

Automated Data Enrichment:

Scripts can be employed to automatically enrich data with additional context. This may include querying external databases, checking hash values against threat databases, or retrieving information about known indicators of compromise (IOCs). Automated data enrichment accelerates the analysis process.

Behavioral Analysis:

Scripting allows for the implementation of behavioral analysis techniques. By scripting custom algorithms, threat hunters can identify unusual patterns of behavior within network traffic, system logs, or user activities that may indicate a security threat.

Alerting and Notification:

Threat hunters can use scripts to set up automated alerting systems. This ensures that analysts are promptly notified when specific conditions or indicators of compromise are detected, allowing for a rapid response to potential security incidents.

Forensic Analysis:

In threat hunting, forensic analysis is often necessary to reconstruct events and understand the scope of an incident. Scripts can assist in automating parts of the forensic analysis process, saving time and improving the accuracy of investigations.

Common languages include. 

bash: Used when working in the Linux interface 
Node js: Framework to write network applications using JavaScript
Ruby: Great for web development
Python: Supports procedure-oriented programming and object-oriented programming
Perl: Found on all Linux servers, helps in text manipulation tasks 
Windows PowerShell: Found on all Windows servers, and now available for Linux.
Scripting tools that require less knowledge of the actual syntax of the language may also be used. Popular tools include:

Puppet
Chef
Ansible


Skip to main content
Completion requirements
 Done: View
Threat intelligence and threat hunting are pivotal concepts in cybersecurity, collectively contributing to the proactive defense against evolving cyber threats. Threat intelligence involves the systematic collection, analysis, and dissemination of information about potential and current cyber threats. This information, often obtained from various sources including open-source intelligence, dark web monitoring, and collaboration with cybersecurity communities, helps organizations understand the tactics, techniques, and procedures employed by adversaries. Threat intelligence serves as a foundation for threat hunting, an active and iterative process where cybersecurity professionals actively seek out and investigate potential security threats within their networks. Threat hunting goes beyond traditional security measures, employing tools, techniques, and automation to identify hidden threats that may have evaded detection. By combining the insights gained from threat intelligence with the proactive approach of threat hunting, organizations can enhance their cybersecurity posture, detect threats early in their lifecycle, and respond effectively to those cyber threats.

Skip to main content
Completion requirements
 Done: View
Threat-Intelligence
Threat intelligence refers to the collection, analysis, and dissemination of information related to potential and current cyber threats. This information is gathered from various sources, both open and closed, and is used to understand the tactics, techniques, and procedures (TTPs) employed by threat actors. The goal of threat intelligence is to provide organizations with actionable insights that enhance their ability to prevent, detect, respond to, and mitigate cyber threats.

Threat-Actors
There are many threat actors that can target your organization. There are two main things which differentiate threat actors, these are knowledge and their motivation. Each threat actor varies in their degree of maliciousness. 

Nation-state
Nation-state threat actors are funded, directed or sponsored by nations or governments. Typically, their motivations are espionage and stealing of other nation’s state secrets and intellectual property. Some nation state hackers have also been known to steal funds from online banks and cryptocurrency platforms to fund their nation’s espionage causes.

Nation-states often engage in APTs, characterized by long-term operations aimed at espionage or sabotage. These operations are marked by high levels of stealth and persistence. They frequently use sophisticated malware, often custom-developed, to exploit zero-day vulnerabilities. Nation-states may target software supply chains to compromise a wide array of victims in one stroke. They also engage in disinformation campaigns and manipulate social media platforms to influence public opinion or disrupt political processes.

The most active nation states in this regard include Russia, China and North Korea, the latter has been involved in numerous cryptocurrency platform hacks to bring funds into the country. There is little an organization can do in the way of defense against a nation-state attack. These attackers often have the most talented and knowledgeable cybersecurity professionals on their teams, who will often exploit zero-day vulnerabilities and write custom malware to infiltrate or disrupt their targets. Most businesses in the private sector will not have to worry about nation states but the public sector, such as the energy industry, is often a target.

Hacktivist
A hacktivist’s main goal is to raise awareness for a cause in which they believe, e.g., animal rights, environmental issues or highlighting police brutality. They often hack private companies to steal and disclose sensitive information in the name of what they claim is “justice.” They often have decent levels of technical knowledge, but not as much as other threat actors. An example of a hacktivist group would be Anonymous.

Hacktivists commonly use website defacement and Distributed Denial of Service (DDoS) attacks to disrupt services and draw attention to their cause. They often leak sensitive information to embarrass organizations or expose perceived injustices. Hacktivists typically use readily available hacking tools and techniques, unlike the custom tools of nation-states.

Organized Crime
Organized crime threat actors’ motivations most often are to steal sensitive information or funds to help fund their illegal activities. They often possess deep levels of technical knowledge which they use for illicit purposes. Their TTPs are primarily driven by financial gain, such as through ransomware attacks, financial fraud, and identity theft.

They often exploit known vulnerabilities in widely used software, as opposed to the zero-day exploits favored by nation-states. These groups frequently use phishing campaigns to steal credentials or implant malware. Organized crime groups may offer hacking services or infrastructure (like botnets) for rent, demonstrating a business-like approach to cybercrime.

Cross-Actor Comparison
Nation-states have significant resources and can sustain long-term operations, while hacktivists and organized crime groups are more opportunistic and may lack state-level resources. Nation-state actors typically exhibit higher technical sophistication compared to hacktivists or organized crime groups.

While nation-states are motivated by geopolitical objectives, hacktivists aim for ideological goals, and organized crime seeks financial gain. Lastly, nation-states often target other governments or critical infrastructure, hacktivists target entities they see as ethically or politically opposed to their views, and organized crime targets are selected for financial exploitability.

Understanding these differences in TTPs is vital for tailoring defensive strategies. For instance, defenses against nation-state actors require a focus on advanced threat detection and insider threat monitoring, while defenses against organized crime might prioritize anti-phishing measures and ransomware protection. Hacktivist attacks might require a different approach, focusing on public relations management and website security.

Tactics, Techniques and Procedures
TTPs describe the known methods of attackers. A TTP is a detailed account of what an attacker does and how he does it. For example, a TTP might represent details of a chain of events leading to credit-card-data theft.

Integrating Tactics, Techniques, and Procedures (TTPs) with established frameworks and models is essential for a comprehensive defense strategy. This section explores how TTPs fit into various cybersecurity frameworks and models, enhancing the understanding and categorization of these tactics.

The MITRE ATT&CK Framework
The MITRE ATT&CK framework is a globally recognized knowledge base of adversary behavior and tactics. It categorizes TTPs based on real-world observations, providing a detailed understanding of how threat actors operate.

MITRE ATT&CK framework is covered in detail in Module 7.1.3. Integrating TTPs with the MITRE ATT&CK framework aids threat hunters and security professionals in identifying and responding to specific adversary behaviors.

NIST Cybersecurity Framework
The NIST Framework outlines five core functions – Identify, Protect, Detect, Respond, and Recover. TTPs can be mapped to these functions to understand where specific tactics fit within an organization's broader cybersecurity strategy.

The NIST Framework is covered in Module 3.2.9. The framework emphasizes the importance of risk management, and understanding TTPs helps in identifying and prioritizing risks.

Cyber Kill Chain Model
The Cyber Kill Chain model, developed by Lockheed Martin, describes the phases of a cyber-attack. TTPs can be mapped to these phases (reconnaissance, weaponization, delivery, exploitation, installation, command and control, and actions on objectives) to understand an attacker's progression and disrupt the chain.

The model is covered to full extent in Module 7.1.1. By integrating TTPs with the Cyber Kill Chain, organizations can develop proactive defense strategies, targeting specific stages of an attack.

Diamond Model of Intrusion Analysis
The Diamond Model focuses on four core features of an intrusion – adversary, capability, infrastructure, and victim. TTPs are analyzed in the context of these features to understand the complexity of cyber-attacks. The Diamond Model of Intrusion Analysis is covered comprehensively in Module 7.1.2. This model is particularly useful for link analysis, helping to correlate different attacks and identify patterns in TTPs used by specific adversaries.

The CIS Controls
The CIS Controls provide a set of actions for cyber defense. TTPs can be mapped to these controls to ensure that defensive measures are comprehensive and effective. The integration helps in prioritizing actions based on the TTPs most relevant to an organization.

Integrating TTPs with these frameworks provides a holistic view of cybersecurity, ensuring that all aspects of an organization's defense are addressed. It aids in strategic planning and resource allocation, ensuring that defenses are aligned with the most relevant threats.

Confidence Levels

The confidence level of data refers to the accuracy of the data. This will provide an idea of the level of trust in the data. The categories of accuracy of data are: Confirmed, probable, possible, doubtful, improbable, discredited and unassessed. Confidence level can be affected by a variety of factors such as knowledge of an adversary's tactics and techniques.

There are two different sets of confidence levels, manual and automated. Manual confidence is determined by a human, usually an analyst. Automated confidence considers the concept of decaying indicators; over time, indicators of malware may become less reliable as threat actors update their attack methods. Automated confidence integrates the decaying of indicators to ensure you rely on up-to-date indicators of threats. More information can be gathered from the following link: https://threatconnect.com/blog/best-practices-indicator-rating-and-confidence/

Report Confidence
Report Confidence is used to quantify the degree of confidence in the existence of a vulnerability and the credibility of known technical details. It has four assigned values:

Not Defined (X): There is insufficient information to choose one of the other values and has no impact on the overall Temporal Score.
Confirmed (C): Detailed reports exist, or functional reproduction is possible.
Reasonable (R): Significant details are published, but researchers either do not have full confidence in the root cause, or do not have access to source code to fully confirm all the interactions that may lead to the result.
Unknown (U): There are reports of impacts which indicate a vulnerability is present. Reports indicate the cause of the vulnerability is unknown, or reports differ on the cause or impacts of the vulnerability.
 

Skip to main content
Completion requirements
 Done: View
Threat research is the process undertaken by an organization to attempt to understand potential threats. This is typically done by conducting threat modeling activities. Threat modeling encompasses the following factors:

Adversary capability - Compiling information about resources, intent and ability of the threat actor.
Attack surface – Identifying any system, device, network, application, staff member or other target through which an attacker is attempting access to an organization’s system.
Attack vectors - Identifying all possible means through which an attacker can access their target.
Impact – Estimating the organizational impact of a successful attack.
Likelihood – Estimating the probability of an attack succeeding.
Each of the above items can be scored which helps assess the organizational risk. 

Once the organization has established a clear threat model, they will typically conduct threat research with a variety of methods including examining the reputation of a site, netblock or actor to determine whether they have a history of malicious behavior—this is referred to as threat reputation. This information is most often paid with IP addresses or domains. File reputation services and data feeds also exist.

Another method of assessing a threat is behavioral assessment. This involves monitoring an organization's IT-assets for any behaviors listed in the MITRE ATT&CK framework. This type of assessment is particularly useful for combating insider threats.

 

Indicators of compromise (IOC)
IOCs are pieces of forensic data that identify potentially malicious activity on a system or network. Data may consist of system log entries, files, Intrusion Detection System (IDS) alerts, etc. IOCs assist security researchers in detecting data breaches, malware infections and other threat activity. It is important for an organization to monitor IOCs so that, when discovered, they can be acted on quickly to limit the potential damage. IOCs often act as a breadcrumb trail that enables IT professionals to detect the early stage of malicious activity. IOCs can be hard to find and may range from simple metadata elements to a complex series of code.

 

Base Metric Group (BMG)
 

BMG represents the characteristics of a vulnerability which remains constant across all user environments and time. BMG is composed of two metric groups: Exploitability and Impact.

 

Exploitability Metrics - attempt to summarize the ease and technical means by which a vulnerability can be exploited. They represent the characteristics of the vulnerable component, or in other words, the thing that is vulnerable.

 

Attack Vector (AV)
An attack vector can be Physical (P), Local (L), Adjacent (A) or Network (N). P means that the attacker needs to physically touch or manipulate the vulnerable component. L means the vulnerable component is not bound to the network stack and the attacker’s path is via read/write/execute capabilities. A means the attacker would need to have access to the network containing the target to exploit it. N is the most severe rating and means that the target can be exploited from anywhere over the internet.

 

Attack Complexity (AC)
AC refers to the conditions beyond an attacker’s control which must exist to exploit the vulnerability. It is important to note that the assessment of this metric excludes requirements for user interaction to exploit the vulnerability. (These conditions are captured in a later metric). AC has two values:

Low (L): No specialized access conditions or extenuating circumstances exist. An attacker will have repeatable success when attacking this vulnerable component.
High (H): A successful attack depends on conditions beyond the attacker’s control.
 

Privileges Required (PR):
PR describes the level of privileges an attacker must possess before successfully exploiting the vulnerability. This can be assigned the following values:

None (N): The attacker is unauthorized prior to an attack and does not require any access to settings or files on the vulnerable system to carry out the attack.
Low (L): The attacker requires privileges that provide basic user capabilities which could normally only affect settings and files owned by the user.
High (H): The attacker requires significant privileges such as administrative level.  
Note: Privileges required are usually given a score of none for hard-coded credential vulnerabilities or vulnerabilities requiring social engineering.
 

User Interaction (UI)
UI highlights the requirement for a human user (not the attacker) to participate in the successful compromise of a vulnerable component. UI has two values:

None (N): The vulnerable system can be exploited without interaction from any user.
Required (R): Requires a user to take some action before the vulnerability can be exploited.
 

Scope (S)
Scope highlights whether a vulnerability in a vulnerable component can impact resources in components beyond its security scope. Scope has two values:

Unchanged (U): An exploited vulnerability can only affect resources managed by the same security authority.
Changed (C): An exploited vulnerability can affect resources beyond the security scope managed by the security authority of the vulnerable component.
Impact Metrics - attempt to summarize the direct consequences of a successful exploitation of a vulnerability. They represent the consequence to the impacted component, or in other words, the thing that suffers the impact.

 

Confidentiality Impact
This measures the impact on the confidentiality of the information resources managed by a software component due to a successful attack. It has three values:

High (H): A total loss of confidentiality. All resources within the impacted component are divulged to the attacker.
Low (L): Some loss of confidentiality. Access to some sensitive information is obtained but the attacker does not have control over what information is obtained or the amount or kind of loss is limited.
None (N): No loss of confidentiality.
 

Integrity Impact
This is the impact to integrity of a successfully exploited vulnerability. Integrity refers to the trustworthiness of information. It has three values:

High (H): Total loss of integrity or a complete loss of protection.
Low (L): Modification of data is possible, but the attacker does not have control over the consequence of a modification, or the amount of modification is limited.
None (N): There is no loss of integrity within the impacted component.
 

Availability Impact
This metric refers to the impact to the availability of the impacted component resulting from a successfully exploited vulnerability. It is assigned three values:

High (H): Total loss of availability which results in the attacker being able to fully deny access to resources in the impacted component. This loss can be either sustained, while the attacker continues to deliver the attack, or persistent, the condition persists even after the attack has completed.
Low (L): The performance of the component is reduced or there are interruptions in resource availability. The attacker does not have the ability to completely deny service to legitimate users.
None (N): There is no impact to availability within the impacted component.
It is important to note that major vulnerability scanners have not yet adopted Version 3 and continue to use CVSS version 2. Remember to check which version is being used before attempting to understand the CVSS score.



Temporal Metric Group
The Temporal Metric Group measures the current state of exploit technique or code availability, the existence of any patches or workarounds and the confidence in the description of a vulnerability.

 

Explicit Code Maturity
This metric measures the likelihood of the vulnerability being attacked and is based on the current state of exploit techniques, exploit code availability or active “in-the-wild” exploitation. It can be assigned five values:

Not Defined (X): There is insufficient information to choose one of the other values and has no impact on the overall Temporal Score.
High (H): Indicates functional autonomous code exists, or no exploit is required (manual trigger) and details are widely available.
Functional (F): Functional exploit code is available which works in most situations where the vulnerability exists.
Proof-of-Concept (P): Proof-of-concept exploit code is available, or an attack demonstration is not practical for most systems.
Unproven (U): No exploit code is available, or an exploit is theoretical.


Remediation Level
It is important to take Remediation Level into consideration for prioritization purposes. A new vulnerability will typically be unpatched upon initial publication. Each interim remediation stage, such as workaround or hotfixes, will adjust the Temporal Score downwards reflecting the decreasing urgency as remediation becomes final. Remediation has five values:

Not Defied (X): Insufficient information to choose one of the other values and has no impact on the overall Temporal Score.
Unavailable (U): Either no solution available or it is impossible to apply.
Workaround (W): An unofficial, non-vendor solution is available.
Temporary Fix (T): An official but temporary fix is available.
Official Fix (O): A complete vendor solution is available.


Report Confidence
Report Confidence is used to quantify the degree of confidence in the existence of a vulnerability and the credibility of known technical details. It has four assigned values:

Not Defined (X): There is insufficient information to choose one of the other values and has no impact on the overall Temporal Score.
Confirmed (C): Detailed reports exist, or functional reproduction is possible.
Reasonable (R): Significant details are published, but researchers either do not have full confidence in the root cause, or do not have access to source code to fully confirm all the interactions that may lead to the result.
Unknown (U): There are reports of impacts which indicate a vulnerability is present. Reports indicate the cause of the vulnerability is unknown, or reports differ on the cause or impacts of the vulnerability.
Environmental Metric Group
Modified Base Metrics (MBM)
MBM enables analysts to override individual Base metrics based on specific characteristics of a user’s environment. For example, the default configuration for a vulnerable component may be able to run a listening service with administrator privileges, for which a compromise might grant an attacker high Confidentiality, Integrity, and Availability impacts. Yet, in the analyst’s environment, that same Internet service might be running with reduced privileges; in that case, the Modified Confidentiality, Modified Integrity, and Modified Availability might each be set to Low. Each of the Modifies Base metrics has the same values as its corresponding Base metric, plus a value of Not Defined. Modified Base metrics include the following:

Modified Attack Vector (MAV)
Modified Attack Complexity (MAC)
Modified Privileges Required (MPR)
Modified User Interaction (MUI)
Modified Scope (MS)
Modified Confidentiality (MC)
Modified Integrity (MI)
Modified Availability (MA)
 

Skip to main content
Completion requirements
 Done: View

Threat hunting is a proactive and iterative approach to defense, rooted in a mindset that the attacker is already present.

Establishing a Hypothesis
The first step in the hunting effort, after threat-hunting goals are identified, is to develop a hypothesis (or hypotheses) for the hunt. When security incidents are occurring, and even when they are not occurring at the current time, security professionals must anticipate attacks and establish a hypothesis regarding the attack aims and method as soon as possible. Hypotheses can be seen as educated guesses that need two key components to be valid. For example, if an attacker is probing a network for unknown reasons, asking the following questions and performing the recommended procedures might help develop a hypothesis:

Why is the attacker doing this, and what is his aim?
Is the attacker trying to perform a port scan?
Monitor and capture the traffic he sends to the network.
Look for the presence of packets that have been crafted by the hacker compared to those that are the result of the normal TCP three-way handshake.
These packet types are not present; therefore, his intent is not to port scan.
Profiling Threat Actors and Activities
Profiling attackers and their associated activities is a critical step in threat hunting. A great tool to use when profiling attackers is MITRE ATT&CK, a globally accessible knowledge database of adversary tactics and techniques based on real-world observations. The ATT&CK matrix includes the following categories:   

Initial access - techniques used by an adversary to obtain a foothold within a network
Execution - techniques that enable adversaries to run their code on a target system
Persistence - techniques that enable an adversary to maintain long-term access to a target system
Privilege escalation - techniques used by an adversary to gain higher level privilege, such as administrator or root
Defense evasion - techniques used by attackers to circumvent security mechanisms or obfuscate their behavior to avoid detection
Credential access - techniques developed to capture legitimate user credentials
Discovery - techniques used by adversaries to obtain information about systems and networks, often to assist in targeting and exploit development
Lateral movement - techniques that enable an attacker to move from one system to another within a network
Collection - techniques used by an adversary to aggregate information about target systems
Command and control - techniques leveraged by an attacker to enable communication between victim machines and those under their control
Exfiltration - techniques used to get data out of a compromised network and into an environment controlled by the attacker.
Impact - techniques used by an attacker to impact legitimate users’ access to a system
Threat-Hunting Tactics
Threat hunters can use a huge range of software tools to sift through vast amounts of data to help them make sense of what they are seeing and improve their hunting process. Because threat hunters often rely on existing security tools to achieve their key tasks, threat-hunting often does not require an additional investment in technology.  

A threat model is a conceptual design that provides a framework on which to implement security efforts. There are many models available for use. 

Executable Process Analysis
If the processor activity is very busy with few or no applications running, it could be a sign that the processor is working on behalf of malicious software. Intrusions are typically accompanied by a drop-in performance. Executable process analysis allows determining such a state. 

Windows Task Manager is designed to help determine if a process is causing a bottleneck at the CPU. For example, Figure 2.11. shows that in Task Manager, clicking the Processes tab and then the CPU column to sort the processes with the top CPU users at the top can be done.

 

 

 



 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

Reducing the Attack Surface Area
Reducing the attack surface area means limiting the features and functions available to an attacker. An example would be physically locking all but one of the doors to a facility. The attack can now only come from one door— the attack surface has been reduced.  Another term for reducing the attack surface area is system hardening because it involves ensuring all systems have been hardened to the extent that is possible and still provide functionality.

Bundling Critical Assets
While organizations should strive to protect all assets, in the cybersecurity world, focus tends to be on what is most at risk, data. Bundling critical digital assets helps to organize them so security controls can be applied more cleanly with fewer possible human errors. However, before bundling can be done, data must be classified. Commercial businesses usually classify data using four main classification levels, listed here from highest sensitivity level to lowest:

Confidential
Private
Sensitive
Public
Attack Vector
An attack vector is a path, means, or system vulnerability a hacker can exploit to gain access to a computer system or network. Once inside, the attack may deliver a payload or execute other malicious outcomes. System vulnerabilities may also include the human element. 

When trying to distinguish between attack surface and attack vector, remember the surface is what’s being attacked, and the vector is the means by which an intruder gains access. Examples of common attack vectors include the following: 

Compromised credentials
Weak Credentials
Malicious Insiders
Missing or poor encryption
Misconfigurations
Vulnerabilities
Integrated Intelligence 
Threat intelligence teams have a special relationship with threat hunters. Both are laser-focused on TTPs and want to know how attackers have behaved in the past and how they are likely to act in given situations. 

Threat intelligence feeds inform threat hunters of the latest attacker TTPs, connected infrastructure, victimology, and attacker tendencies. In pursuing these leads, threat hunters provide feedback to the intelligence team as to the effectiveness, accuracy, and relevance of provided data. They may also provide feedback about the intelligence process so the threat intelligence team can update their own products to reflect reality. 

In closing out a hunt, the team will want to communicate relevant malicious activity and new intelligence back to the operations and threat intelligence team. The Integrated Intelligence Center (IIC) is a unit at the Center for Internet Security (CIS) that focuses on merging cybersecurity and physical security to aid governments in dealing with emerging threats. IIC attempts to create predictive models using the multiple data sources at its disposal.

Improving Detection Capabilities 
A hunt, whether successful or not, will yield products directly relevant to detection efforts. At the very least, hunters will have a better understanding of TTPs and how they may be used against the environment. In the best scenario, the team can use examples of how TTPs were leveraged successfully to inform modifications to infrastructure, improvements to detection logic, and changes in policy. Technical modifications can result from discoveries about the network, servers, and endpoints during a hunt. One common change is the addition of security devices and sensors to areas to which the team lacks visibility.

 


Skip to main content
Completion requirements
 Done: View
Security operations encompass a multitude of tasks, from threat detection and incident response to vulnerability management and risk mitigation. Ensuring efficiency in these processes not only optimizes resource utilization but also plays a pivotal role in minimizing the time it takes to detect and respond to security incidents. Rapid response is crucial in the face of evolving cyber threats. By continuously refining and improving security processes, organizations can enhance their agility, reduce response times, and mitigate potential damages. Moreover, efficient security operations contribute to a proactive cybersecurity stance, allowing organizations to stay ahead of emerging threats. Regular assessments, automation of repetitive tasks, and the integration of advanced technologies all play key roles in achieving efficiency and process improvement, ultimately fortifying the resilience of an organization's cybersecurity defenses.


Skip to main content
Completion requirements
 Done: View
Standardize Processes
Standardizing processes in cybersecurity involves creating uniform procedures and protocols across an organization. This standardization is crucial for maintaining a consistent security posture, minimizing risks, and ensuring efficient and effective responses to security incidents. It also aids in compliance with various regulatory requirements and industry standards. The best practices for standardization would be:

Consistent Documentation: Develop comprehensive and clear documentation for all security-related processes. This should include guidelines for incident response, data handling, and access control.

Adherence to Frameworks: Implement common frameworks like ISO/IEC 27001 to ensure a globally recognized standard of security practices.

Uniform Security Protocols: Establish consistent security protocols across all departments to avoid discrepancies in security postures.

Regularly review and update standardized processes to adapt to new threats and changes in the business environment. Encourage feedback from employees to continuously improve security processes. Leadership should actively endorse and support standardization initiatives. Allocate resources for training and implementation of standardized processes.

Streamline Operations
Streamlining operations in cybersecurity refers to the process of making security procedures more efficient and effective. This involves eliminating redundancies, automating repetitive tasks, and optimizing resource allocation to enhance the overall security posture of an organization.

Strategies for Streamlining:
Automation of Repetitive Tasks: Implement automation tools for routine security tasks such as patch management, vulnerability scanning, and log analysis to reduce human error and free up resources for more complex tasks.
Integration of Security Tools: Use integrated security platforms that combine multiple functionalities (like threat detection, incident response, and compliance management) to reduce the complexity of managing disparate systems.
Optimizing Incident Response: Develop a well-structured incident response plan that clearly defines roles, responsibilities, and procedures, enabling quicker and more coordinated responses to security incidents.
Threat Intelligence Cycle
The threat intelligence cycle is responsible for turning raw data into finished intelligence. It is fundamental to the success of an organization’s intelligence operation. There are 5 steps to the threat intelligence cycle:

Planning and Direction
The most important step in an organization’s threat intelligence cycle involves defining and clearly describing the purpose and objectives of their intelligence operation. These are known as intelligence requirements (IR). IRs encapsulate what the threat intelligence team does not know but will need to find out in order to meet the objectives of the operation. For example, if a company is experiencing high levels of brute force attempts on their systems, the threat intelligence team should create IRs that reduce the frequency of attacks and reflect on what the team does not know. IRs for this scenario may include:

Have any of the brute force attempts been successful?

Are other organizations in the same industry as ours being targeted by the same attacks?

What threat actors are deploying these attacks, where are they coming from and what are their motivations?

Collection and Processing
During this step, the threat intelligence team determines what types of data they need to gather to meet their IRS, then collect and process the data for further analysis in support of their IRs. As you can see, everything relates back to the IRs which is why step one is so important. Keeping with the example of the company experiencing brute force attempts, some suitable data sources matching the specified IRs may include:

Logs of all failed login attempts to systems

Threat actor conversations which may help determine which threat actors are most likely to launch these types of attacks

Information about these attacks provided by industry peers in information sharing communities

Once this data is gathered, the threat intelligence team then processes the data to make it usable for analysis. These processes often include attempts to reduce the volume of raw data and translating conversations or information obtained from online information sharing communities.

Analysis
In this step, the threat intelligence team will combine and analyze data from separate sources to recognize meaningful patterns. The goal here is to discover patterns which will aid them in making informed judgments about the potential threat actors which satisfy their IRs. Continuing with the example of a company experiencing brute force attacks, we will assume the team had the following outcome with regards their IRs:

An analysis of signing attempts and audit logs determined that an adversary managed to sign in to one of the company’s employee accounts. There are clear attempts by the threat actor to escalate their privileges which had been unsuccessful. The threat intelligence team must immediately notify the company’s IT team as well as SOC analysts tasked to remove the threat actor from the compromised system.

By sharing information about the patterns of brute force attack, the threat intelligence team will discover that other companies are also experiencing similar attacks in a similar fashion.

Upon discovering that the brute force attack had been discussed on a Chinese forum, the team translated and gathered as much of this information as possible revealing the attacker’s motivations and methods of attack.

Report Production
Upon determining the attacker’s motivations and attack methods the intelligence team will detail their findings in an intelligence report for management. The report will include how the team satisfied their IRs and recommend a course of action to be taken.

Dissemination and Feedback
The final step requires the threat intelligence team to distribute their report to appropriate stakeholders. These stakeholders range from SOC analysts to senior leadership responsible for allocation resources and setting strategic priorities. Stakeholders will then provide feedback to the threat intelligence team to help fine-tune future submissions of intelligence distribution. The reports will include the initial IRs set out by the team, how the team met these requirements and how the team dealt with the discovery of threat actors.

Technology and Tool Integration
Integrating technology and tools in cybersecurity involves combining various software, hardware, and practices into a cohesive system. This integration aims to enhance the efficiency and effectiveness of cybersecurity measures by ensuring that different components work seamlessly together.

Ensure that different security tools, such as firewalls, antivirus software, intrusion detection systems, and others, can communicate and work together effectively. Combine data from various sources, such as logs, threat intelligence feeds, and incident reports to enable comprehensive analysis and informed decision-making.

Application Programming Interface (API)
API is essential to facilitate interaction with popular security services without human intervention. An API consists of a number of procedures and functions that enable the seamless communication between two or more applications. The API defines the permissible types of calls or requests, outlines the methods for executing them, specifies the data formats to be utilized, and establishes the conventions to be followed. It also provides the extension mechanisms that enable the software to extend its existing functionality. For example, if a Security Orchestration, Automation, and Response (SOAR) platform needs to analyze a URL against the VirtusTotal database, it can use VirusTotal's API to submit the URL and get the information regarding its status or reliability.

Webhooks
Webhooks are automated messages that are delivered from one application to another , especially when some specific events occur. These messages encapsulate the information regarding the event, including its timestamp, associated data, etc. Webhooks are primarily used to trigger automated actions like updating a database or sending emails.

Single Pane of Glass
The 'Single Pane of Glass' approach in cybersecurity refers to the consolidation of all security information and controls into one comprehensive dashboard or interface. This concept is about streamlining the monitoring, management, and response to security events by providing a unified, clear view of all security aspects.

Key Features of a Single Pane of Glass:

Centralized Visualization: Aggregate data from various security tools and systems into a single dashboard for easy monitoring and analysis.
Real-Time Data and Alerts: Display real-time information and alerts to enable quick identification and response to potential threats.
Customizable Dashboards: Allow customization of the dashboard to focus on key metrics and information relevant to specific roles or functions within the cybersecurity team.
Integrate SIEM (Security Information and Event Management) systems, threat intelligence platforms, and other security tools into the single pane of glass. Ensure the interface is user-friendly and provides actionable insights, not just raw data.

One of the main hurdles is achieving the right balance between providing comprehensive information and avoiding information overload. The system must be intuitive and user-friendly, ensuring that the data presented is both relevant and actionable. Additionally, scalability is crucial. As the cybersecurity landscape evolves, the Single Pane of Glass must adapt, integrating new tools and technologies seamlessly.


Skip to main content
Completion requirements
 Done: View
As organizations strive to safeguard their digital assets from potential threats, vulnerability scanning serves as a proactive and systematic approach to identifying weaknesses, misconfigurations, and potential security risks within an organization's IT infrastructure. By conducting regular vulnerability scans, security teams can assess the security posture of their systems, networks, and applications. The process helps to discover known vulnerabilities, assess their severity, and prioritize remediation efforts based on the level of risk posed to the organization. This proactive approach allows organizations to stay ahead of potential cyber threats, reduce the attack surface, and enhance overall resilience. Vulnerability scanning is not only a key component of risk management but also a fundamental practice in maintaining compliance with regulatory requirements and industry standards. Ultimately, by regularly scanning for vulnerabilities, organizations can fortify their defenses, protect sensitive data, and create a robust foundation for a proactive cybersecurity strategy.

Skip to main content
Completion requirements
 Done: View
Assets play a central role in vulnerability scanning as they are the entities within an organization's infrastructure that are assessed for potential security weaknesses. Vulnerability scanning is a systematic process of identifying and assessing vulnerabilities in computer systems, networks, and applications. Here's how assets fit into vulnerability scanning:

1. Identification of Assets:

Before conducting a vulnerability scan, it's crucial to identify and catalog all assets within the organization's environment. Assets include servers, workstations, network devices, databases, and other components that may be susceptible to security vulnerabilities.

2. Scoping the Scan:

Based on the identified assets, the scope of the vulnerability scan is determined. Scoping involves defining the range of IP addresses, domains, or network segments to be scanned. This ensures that the scanning tool targets the relevant assets within the organization.

3. Asset Prioritization:

Not all assets carry the same level of criticality or importance. Vulnerability scanning often involves prioritizing assets based on their significance to the organization's operations. Critical systems or those containing sensitive data may receive higher priority in the scanning process.

4. Scan Execution:

The vulnerability scanning tool is configured to scan the identified assets within the defined scope. The tool systematically checks for known vulnerabilities, misconfigurations, and security weaknesses in the software, systems, and services running on the assets.

5. Detection of Vulnerabilities:

As the scan progresses, vulnerabilities are detected and categorized based on their severity. The scanning tool provides a report detailing identified vulnerabilities, their potential impact, and recommendations for remediation.

6. Asset Management Integration:

Vulnerability management is closely tied to asset management. The results of vulnerability scans are often integrated with asset management systems to maintain an up-to-date inventory of assets and their associated vulnerabilities. This integration aids in tracking remediation efforts over time.

7. Remediation Planning:

The vulnerabilities identified during the scanning process inform the organization's remediation efforts. Security teams use the scan results to prioritize and plan remediation activities, addressing the most critical vulnerabilities first to reduce overall risk.

8. Continuous Monitoring:

Assets are dynamic, and new ones may be added or removed over time. Vulnerability scanning is part of a continuous monitoring process where regular scans are conducted to identify and address new vulnerabilities introduced as the IT environment evolves.

In summary, assets are the focal point of vulnerability scanning, guiding the scoping, prioritization, and remediation efforts. By systematically assessing vulnerabilities on identified assets, organizations can proactively manage and strengthen their cybersecurity defenses, reducing the risk of exploitation by malicious actors.

Asset Management
Asset management is the process of keeping track of a company's assets. By doing so, all stakeholders will know exactly which assets are available at any time.  Asset management typically involves an organization developing an inventory of what devices, software, and systems they have. Asset management is important in an organization for a number of reasons, including:

Helping keep tabs on all assets of a firm
Helping manage and identify risks
Removing ghost assets in the company's inventory
Asset Criticality
When making an inventory of your assets it is important that you prioritize them by order of criticality. This allows you to prioritize securing your most critical assets. In short, asset criticality is the relative risk of a high cost arising from failure of the asset in question.

For example, if Amazon’s server which hosts their website goes down, it could cost the company millions, not only with regards to fixing the server but also in sales on the site. Amazon’s server would be considered a critical asset. On the other hand, if their internal printing server went down and staff couldn’t print any files, this would not be as big an issue and so the priority of this server would be a lot lower. Criticality is the relative risk of an asset from a cost perspective, calculated in order to understand which assets need the most attention and finances to prevent a costly failure.

Data sensitivity is also involved when creating an inventory of assets. Data sensitivity refers to how freely data can be handled. Different sensitivity profiles or categories are applied to data that dictate how it should be handled. For example, in military organizations a piece of data may be classified as Secret, indicating that it is confidential and should be handled carefully.

Transporting this data physically would probably mean that the drives containing the data be heavily encrypted and that some form of tracking device be connected to the device. If the data is being sent electronically, a secure VPN may be used alongside an encrypted email to ensure the data cannot be captured in transit. The concept of data sensitivity should apply to all IT-assets. The more critical the asset, the higher data sensitivity rating it should receive. 

Cloud Versus On-Premises
Locating all IT resources onsite gives an organization control over security measures. Security Analysts assess risk and implement security practices accordingly. However, moving resources to the public cloud means an organization must reckon with a different security landscape altogether. The security of a public cloud environment depends on the cloud service provider’s security policy.

To secure resources in a public cloud, keep in mind the following:

Other tenants could potentially view the data.
An attacker can hide behind a fake identity.
The organization’s allotted space may not be completely free from the previous client’s data.
Identity and authorization controls may not be robust enough.
The provider could misuse data.
Access may be affected if the provider’s processes are inadequate.
In the event of data theft or misuse, the provider’s liability would likely be limited.
Test these possibilities when reviewing the environment. Speak with the provider about any security issues and make sure they are aware and fix the security risks before a service agreement is signed.

Asset Tagging
Asset tagging is an important process for organizations managing high volumes of business equipment. Asset tags are labels placed on equipment for easy processing and identification. For example, a company providing laptops to its employees will often apply a tag with a numerical code on the bottom to track the laptop back to a particular user.  IT assets, such as these laptops, will be in a database they can search using this ID. They will use this database to see which assets are loaned out to each employee.

This is useful for many reasons including if a software problem with the laptop surfaces, employees can simply ring IT and quote the asset tag number. IT will then know exactly which piece of hardware the employee has and any relevant details resulting in quicker remediation of a problem. It is also useful with regards to encryption, software updates, and remote management.

Essentially, asset tagging is a useful practice for keeping track of all details associated with a company’s IT assets.

Skip to main content
Completion requirements
 Done: View
Scope
The scope of a vulnerability scan refers to the systems or applications in question. This is typically the first thing an organization will outline when hiring a security professional to conduct a vulnerability scan of their IT-assets. Scope outlines what the security professional is permitted to scan and to what extent. For example, an organization hiring a security professional may instruct her that they want the servers on the internal network scanned but leave all the external networks alone. They may also tell the security professional to scan all servers except for those in the cloud. It is important to pay attention to the scope provided by the organization because stepping outside the scope could lead to potential legal troubles for the security professional.

Vulnerability Feed
It is important, for any scanner, that their vulnerability databases are carefully maintained to ensure they are up to date. Many scanners update their vulnerability feeds automatically, but it should still be checked regularly. New vulnerabilities are discovered weekly and vulnerability scanners can only be effective against them if their feeds are kept up to date. 

A vulnerability feed is essentially a collection of the latest vulnerabilities facing a variety of systems and environments. These feeds provide details about vulnerabilities so that organizations can learn more about how to protect themselves and mitigate risks associated with vulnerabilities. An example of some of the most popular vulnerability feeds include NIST National Vulnerability Database, Common Platform Enumeration (CPE), Common Weakness Enumeration (CWE) and Common Vulnerabilities and Exposures (CVE). The links to each of these vulnerability feeds can be found here: (Next Page)

CVE: https://cve.mitre.org/cve/data_feeds.html

NIST: https://nvd.nist.gov/ 

CPE: http://cpe.mitre.org/ 

Internal vs. External Scanning

Comprehensive security assessments will run scans from several scan perspectives. This refers to running multiple scans on a network or against an organization's IT-assets from different locations and with different levels of access. This will provide several different views into the variety of possible vulnerabilities.

External Scan - Run from the internet, which gives security professionals an accurate view of what an attacker would see if they were looking for vulnerabilities in a particular organization. 

Internal Scan - Run from a scanner on the general network within the corporation. It provides an accurate view of what a malicious insider might see if they were looking for vulnerabilities.

An organization may have to conduct numerous scans, both internally and externally, to remain compliant with some regulation standards. One such standard is the Payment Card Industry Data Security Standard (PCI DSS) that requires organizations to do the following vulnerability scans:

Run internal and external network vulnerability scans at least quarterly and after any significant changes in the network.
The external scan must be done via an Approved Scanning Vendor (ASV). 
Credentialed vs. Non-Credentialed
Credentialed Scan
A credentialed scan is a vulnerability scan conducted with the knowledge of the network administrator and using the administrator’s login information. It is most often run against web applications and tests to see reveal potential vulnerabilities that an attacker could exploit. A credentialed scan is useful for determining what internal vulnerabilities are present on the system. Examples of common vulnerabilities found when conducting a credentialed scan include URL Parameter Pollution, weak configurations and missing patches.

Non-Credentialed Scan
A non-credentialed scan is a vulnerability scan of the system without logging in as a user or administrator. This type of scan is useful for determining any vulnerabilities on the external parts of a web application or other web service. This type of scan is most used against web applications to see what potential vulnerabilities a normal user could exploit. Vulnerabilities often found when running a non-credentialed scan include Cross Site Scripting (XXS). SQL Injection and Cross Site Request Forgery (CSRF).

Passive vs. Active

Active Scanning
Active scanning is a technique used by security professionals to discover active systems. An active scan involves a client (security professional) transmitting a probe request to a server and listening for a probe response from the server. The most typical type of active scan is a TCP SYN scan. This type of scan is used to scan all ports of a server to determine which services or protocols are open and running. The most popular tool used for this type of scanning is Nmap.

This protocol works by taking advantage of the TCP handshake. The TCP handshake consists of 3 signals sent between the client and the server. These are SYN, SYN ACK and ACK. The SYN part is sent from the client to the server announcing that it wants to connect to the server. The server then sends back SYN ACK which acknowledges the client’s request to connect along with the server's request to connect to the client. 

The client then sends an ACK to the server to acknowledge this request and the connection is made. The way a TCP scan works is by sending the SYN probe to the server and waiting for the SYN, ACK response. If the client receives a response, it determines that the server is up, and the particular service scanned is running. If no response is received either the server is down, the service is closed or there is a firewall in place blocking the scan attempt. The client will then send a RST to reset the connection and move onto scanning the next port. 

Active scanning is noisier than passive scanning and more likely to be detected by a security system. Active scanning can also be done for other services such as Wi-Fi, where the client will send a request to connect and then analyze responses from any nearby access points that respond.

Passive Scanning
Passive scanning differs from active scanning in that it doesn’t send any signals to the target. Instead, it simply listens on multiple channels for any signals broadcast periodically from nearby access points or systems. Passive scanning typically takes more time because the client must listen and wait for a beacon versus actively probing to find an access point.

Code Analysis
Static Analysis
Static code analysis is another term for source code analysis. The application code is subjected to analysis prior to compilation into object code, to make it an executable program.

The static code analyzer must support the language used to write the source code. Source code analyzers normally scan for injection vulnerabilities and signatures of known security risks.

Web app vulnerability scanning – Applications need to be analyzed in a published environment to identify implementation and configuration errors. Nikto is a web server scanner.
Fuzzing – Fuzzing is a method devised to examine software for defects and vulnerabilities.

Use interception proxy to crawl applications – An interception proxy is a Man-in-the-Middle, or software installed between a client and server to analyze and modify communication between the client and server. An interception proxy crawling an application is used to test the security of a web application.

Static Analysis Security Tools (SAST) become useful when conducting a code review. They reduce the amount of time during the code review as manually reviewing code takes a great deal of time. SAST tools work by analyzing the source code or binaries of an application for design or coding flaws. These flaws usually indicate some underlying security vulnerabilities and possible malicious code. These tools analyze the application from the “inside out” to test areas such as error handling, input validation, control structure, security, file update, and function parameter verification. They do not require the application to be running and are typically run during the SDLC, during the development of the application. This is a whitebox form of security testing as the tools will have access to all areas of the application in question.

Various forms of static analysis can be performed including dataflow analysis, control flow analysis, structural analysis, semantic analysis, and configuration analysis. Some of the most popular tools include SonarQube and Veracode.

SonarQube can scan source code for bugs, vulnerabilities, and code smells in 15 languages and is an opensource tool. Numerous plugins for SonarQube are available for many IDEs. It can also review security hotspots in the code. Veracode is an open source SAST tool that can scan for bugs in many languages including Android.

Additionally, it provides a very useful feature in that it can provide instant feedback to developers about potential flaws in the design of their code while they are coding. This vastly reduces the time needed for security testing down the line as the majority of problems are fixed at the source. Veracode is a comprehensive tool used to analyze web and mobile apps as well as microservices in most major programming languages and frameworks. Also, when a flaw is found, Veracode provides the developers with remediation strategies in the form of automated advice, written guidance, and video tutorials.

Dynamic Analysis
Dynamic analysis is different from static analysis because, with static analysis, no code is run; instead, the code is simply inspected manually or by using a tool. Dynamic analysis involves the testing and evaluation of a program or piece of software by executing the data in real-time. In other words, the main difference is that static analysis never runs the application or code, but dynamic analysis does.

The main goal is to find errors in the code while it is running, rather than by repeatedly examining the code offline. Some of the most popular tools used for this type of analysis include Netsparker and Tenable. Dynamic analysis is also referred to as Dynamic Application Security Testing or DAST.

Security Baseline Scanning

Sometimes an application or system will provide evidence that something is not quite right. With proper interpretation, these behaviors can be used to alert one to the presence of malware or an ongoing attack. Understanding system and application behaviors will help security professionals distinguish between normal and abnormal behaviors.

Known-good Behavior
Monitoring normal behaviors over time to develop a performance baseline for a system can be used to identify non-normal operations. Amazon uses the AWS Inspector tool to check for expected behaviors and settings and to flag any that are incorrect. Baselines alone, however, cannot help if current benchmarks for comparison are nonexistent. A benchmark, which is a point of reference later used for comparison, captures the same data as a baseline and can even be used as a new baseline should the need arise. A benchmark is compared to the baseline to determine any security or performance issues.

Anomalous Behavior
When an application behaves strangely and does not operate normally, it could be that the application needs to be reinstalled or that it has been compromised by malware. While all applications occasionally have issues, persistent issues or issues that are typically not seen or have never been seen may indicate a compromised application. 

Rogue Endpoint
These are devices that are not controlled or managed by the administrator. In some cases, these devices are benign, as in the case of a user bringing his son’s laptop to work and putting it on the network. In other cases, rogue endpoints are placed by malicious individuals.

User and Entity Behavior Analytics (UEBA)
UEBA is an analysis focusing on user activities. It combines behavioral analytics with machine learning to carry out detection. An example would be identifying a hacker who is using stolen credentials of an authorized user to perform activities that are different from what the authorized user would perform. 

Skip to main content
Completion requirements
 Done: View
Most organizations use policies, procedures, and controls to implement security. Policies are statements that define what the aim of the security measure is, procedures define how to carry out the measures. Controls are measures organizations put in place to mitigate risk they face, and they come in two types: non-technical and technical security controls as we have seen earlier.

Creating and implementing policies, procedures, and controls can be a huge challenge for most organizations. The good news is that help is available, however, from security frameworks created by various bodies.

Security Frameworks
Cybersecurity frameworks are structures on which cybersecurity systems are built upon. There are two types of cybersecurity frameworks. Risk-based and prescriptive. 

Risk-Based Frameworks
These are frameworks that are designed to help organizations organize their approach and response to risk. 

Prescriptive frameworks
Prescriptive frameworks consist of sets of requirements that must be implemented without an explicit relationship to risk management. Prescriptive frameworks comprise two main types: Those that focus on overarching security programs and those that focus on specific controls. Table 5.1 depicts the distinction between the two frameworks and highlights some of the frameworks.

Cybersecurity Frameworks

Framework Type

Focus

Examples

Risk-based

Holistic

NIST RMF

ISO 27005

 

Prescription

 

Security program

ISO 27001

NIST Cybersecurity Framework (CSF)

 

 

 

Security controls

 

NIST 800-53

CIS Controls

National Institute for Standards and Technology (NIST)
NIST is one of the most influential organizations in terms of cybersecurity standards and frameworks. NIST is part of the US Department of Commerce, which is charged with promoting innovation and industrial competitiveness. As part of this mission, NIST develops and publishes standards and guidelines aimed at improving practices, including cybersecurity across a variety of sectors.

Risk Management Framework (RMF)
NIST Special Publication 800-39 is the guidance for organizations for their enterprise-wide program for information security risk management. The approach used is a multi-tiered approach and further describes the information security risk management cycle. This publication defines three tiers to risk management.



Tiers of the organization-wide Risk Management Framework

Organization tier - This tier is concerned with risk to the business as a whole, which means it frames the rest of the conversation and sets important parameters such as the risk tolerance level. It focuses primarily on governance and program-related risk management. 
Mission/Business Processes tier - This tier deals with the risk to the major functions of the organization, such as defining the criticality of the information flows between the organization and its partners or customers. It focuses more on cross-organizational process risk common to multiple business units.
Information Systems tier - This tier addresses risk from an information systems perspective. This is where you will likely spend most of your time, though you need to be aware of the higher two tiers.
 

Cybersecurity activities can be organized into five higher level functions with which you should be familiar. Everything we do can be aligned with one of these: 

Identify - Understand your organization’s business context, resources, and risks. 
Protect - Develop appropriate controls to mitigate risk in ways that make sense. 
Detect - Discover in a timely manner anything that threatens your security. 
Respond - Quickly contain the effects of anything that threatens your security. 
Recover - Return to a secure state that enables business activities after an incident.
Center for Internet Security Controls 
The Center for Internet Security (CIS) is a non-profit organization that, among other things, maintains a list of 20 critical security controls designed to mitigate the threat of the majority of common cyber-attacks. The CIS controls, currently in version 7.1, are shown in Figure 5.4

The CIS Controls

 


Skip to main content
Completion requirements
 Done: View
In this section, we will cover the critical aspects of Data and Vulnerability Prioritization. We will look deeper into network scanning and mapping, and exploring the functionalities of web application scanners. Analyzing output from vulnerability assessment tools is a critical step in the vulnerability management process, as it provides valuable insights that aid in prioritizing vulnerabilities effectively. These tools generate comprehensive reports detailing identified vulnerabilities, their severity levels, affected assets, and potential impact on the organization's security posture. By carefully analyzing this output, security teams can prioritize vulnerabilities based on factors such as their likelihood of exploitation, potential impact on critical systems or data, and the availability of exploits in the wild. Vulnerabilities posing the highest risk to the organization, such as those with a high severity rating or those affecting systems exposed to the internet, are prioritized for immediate remediation. Additionally, analyzing the output allows security teams to identify common vulnerabilities across the organization, enabling the implementation of broader mitigation strategies and the allocation of resources where they are most needed. By leveraging the insights gained from vulnerability assessment tools, organizations can optimize their vulnerability management efforts, reduce their exposure to cyber threats, and enhance their overall security posture.

Skip to main content
Completion requirements
 Done: View
Network Scanning and Mapping

Network scanning and mapping are essential practices in cybersecurity aimed at discovering, assessing, and understanding the structure and vulnerabilities of a computer network.

Network Scanning:

Network scanning involves the systematic exploration of a network to identify active devices, services, and hosts. The primary goal is to create a comprehensive inventory of the devices connected to the network and to gather information about their characteristics. This process typically includes:

1. Discovery of Devices: Identifying and enumerating active hosts, servers, routers, and other network devices.

2. Port Scanning: Assessing the status and availability of network services on each device by scanning for open ports.

3. Operating System Detection: Attempting to identify the operating systems running on the discovered hosts.

4. Service Enumeration: Collecting information about the services and applications running on the network, including version details.

Network Mapping:

Network mapping involves creating visual representations or diagrams of the discovered network, illustrating the relationships and connectivity between devices. This mapping provides a high-level view of the network architecture and is crucial for understanding how different components interact. The process includes:

1. Topology Mapping: Identifying the physical and logical layout of the network, showcasing routers, switches, servers, and endpoints.

2. Relationship Visualization: Illustrating how devices are interconnected and communicate with each other.

3. Subnet and IP Address Mapping: Displaying IP address ranges and subnet allocations within the network.

Both network scanning and mapping are foundational steps in the overall cybersecurity strategy. They provide security professionals with valuable insights into the network's structure, potential vulnerabilities, and areas requiring attention. These practices are commonly employed in penetration testing, vulnerability assessments, and routine security audits to ensure a proactive and robust defense against potential cyber threats.

Tools
Angry IP Scanner and Maltego are some important assessment tools that we will study here in some detail.

Angry IP Scanner
Angry IP Scanner is an open-source network scanning tool that is very simple and fast to use.It supports all the possibly all the major platforms like Windows, Linux, and Mac OS X.

Here, ipscan.exe is an executable file that can scan a network very quickly to identify the various connected devices along with the software versions and configuration information. (Check website: https://angryip.org/)



Figure: Angry IP Scanner 3.x on Ubuntu Operating System ( Source: https://angryip.org/screenshots/)

Maltego
Maltego is another powerful tool that helps investigators in identifying the relationships among various entities of different types very quickly. This tool is helpful in various types of investigations ranging from people and social engineering to malware analysis. Maltego automatically collects and applies the intelligence data to an investigation using transforms.



Figure: Maltego Malware Analysis

(Source: https://www.maltego.com/transform-hub/abuse-ch-urlhaus/)

Web Application Scanners
OWASP Zed Attack Proxy (ZAP)
ZAP is a tool developed by OWASP. ZAP is used to perform assessments on web applications in order to find as many vulnerabilities as it can. ZAP works by using a spider to crawl through the application that then automatically scans all the pages discovered. When all pages are found, it will use a scanner to attack all of the pages. This is useful as an initial assessment of an application because it will certainly find any simple or common vulnerabilities which may be present. It is important to always have permission from the target you are scanning before using a tool such as this. There is always a risk when running an automated scanner that it will break something or take down the service, and you should advise the client of this if you are ever performing one of these scans. ZAP has numerous functionalities built into it which allows attackers to perform fuzzing, scripting, spidering and proxying to attack web applications.  

Burp Suite
Burp Suite, like ZAP, has numerous functions built into it. One of the most useful is the local proxy feature. This feature allows you to set a local proxy up on your browser, which allows you to intercept all requests sent from your machine. This enables you to adjust the requests before they are sent to a system to test how the system will respond to different customized requests. Burp Suite is one of the most popular penetration testing and vulnerability analysis tools. It is most often used for checking web application security. Along with the proxy feature it also comes built with an intruder, repeater and spider functionality. You can purchase Burp Suite by going to their website.  

Nikto
Nikto is an open-source web server scanner. It performs tests against web servers for multiple different attack types. Nikto is not a stealthy tool and will definitely be flagged by any security defenses in place on a web server. The tool tests a web server in the quickest time possible, and it is command line based. Nikto can detect over 6700 potentially dangerous files, check for outdated versions for over 1250 servers, and search for version specific problems on over 270 servers. It is a comprehensive web application scanner. It is important to remember that Nikto will scan only web servers effectively.  

Arachni
Arachni is another web application scanner packed full of features, and it is a free open source. It supports all major operating systems and is built in Ruby. Arachni is similar to the previous scanners mentioned and contains all the features you would expect of a web application scanner. Some examples of vulnerabilities it will look for include the following: XSS, SQL Injection, NoSQL injection, code injection and file inclusion variants, etc. Arachni attempts to conduct scans and assessments as quickly as possible by using asynchronous HTTP requests, clustered browser environments and support for multi-instance scans. It will also provide you with a detailed and well-structured report at the end of the scan detailing all of its findings.

Vulnerability Scanners
The following four Infrastructure vulnerability scanners are required to know and be familiar with for the CySA+ exam:

Tenable’s Nessus - Nessus is designed primarily for Linux based platforms and can be deployed in a testing or production environment, on workstations, wireless devices, or central servers.

The Nessus vulnerability scanner comes in two different categories:

Nessus Professional: This is primarily used for conducting vulnerability assessment. It is used to identify potentially exploitable weaknesses in network architecture.   Information on this tool is available at:
http://www.tenable.com/products/nessus-vulnerability-scanner/nessus-professional
Nessus Manager: This tool is used to assess vulnerabilities in network architecture, particularly in organizations employing many IT assets and multiple teams performing vulnerability assessments. Information on this tool is available at: http://www.tenable.com/products/nessus-vulnerability-scanner/nessus-manager
Qualys’ Vulnerability “ScannerQualys” – Qualys is a cloud-based vulnerability management service, which scans applications and networks for vulnerabilities.

Users set up sensor agents at multiple points across their network. These sensors obtain information and upload it to the cloud platform for analysis. These sensors can be deployed as an appliance, a software on a host, or as a VM on the appropriate platform.

Rapid 7’s Nexpose - This is a commercial vulnerability management system. It offers capabilities along the lines of Nessus and Qualys. 

OpenVAS – Open Vulnerability Assessment System (VAS) is, as its name would suggest, an open-source vulnerability management package. It was initially developed from the Nessus code. OpenVAS is currently available for many widely-used Linux distributions. Though there were versions which supported Windows in the past, there are none available at present.

Debuggers
Debuggers are essential tools in cybersecurity, particularly in vulnerability assessment and software analysis. They allow security professionals to examine and modify the behavior of a program at a very detailed level, which is crucial in identifying security vulnerabilities, understanding malware, and reverse engineering.

Types of Debuggers
Source-Level Debuggers: These debuggers allow the user to execute and inspect the program in its high-level source code form. They are user-friendly and integrate with development environments. Example: GDB (GNU Debugger), Visual Studio Debugger.
Machine-Level Debuggers: These are used for debugging at the assembly code level. They provide a detailed view of the program execution and are essential for understanding malware and conducting reverse engineering. Example: OllyDbg, WinDbg.
Debuggers allow the analyst to pause program execution at specific points to examine the state of the program. It follows Step Execution which is execute the program one instruction or line of code at a time. Also, they provide Variable Inspection. This allows us to view and modify the values of the variables in the program. Users can also inspect and alter the contents of the memory used by the program. Lastly, debuggers can perform Call Stack Analyses. It means that they can view the call stack to understand the sequence of function calls.

Debuggers are vital in understanding how malware operates. Analysts can step through malware code to understand its payload, propagation methods, and network communication. Moreover, Debuggers help in identifying vulnerabilities in software by analyzing how the software behaves with different inputs and under various conditions.

 

 Skip to main content
Completion requirements
 Done: View
Multipurpose Tools
Multipurpose tools in cybersecurity are versatile software solutions that can perform a wide range of functions. These tools are designed to provide cybersecurity professionals with a comprehensive set of capabilities to address various aspects of security, from vulnerability scanning to network analysis and incident response.

Examples of Multipurpose Tools
Wireshark: A network protocol analyzer that can capture and interactively browse the traffic running on a computer network. It is used for network troubleshooting, analysis, and protocol development.
Metasploit Framework: An open-source project that provides information about security vulnerabilities and aids in penetration testing and IDS signature development.
Nmap (Network Mapper): A free and open-source utility for network discovery and security auditing. It is used for network inventory, managing service upgrade schedules, and monitoring host or service uptime.
These tools can help identify vulnerabilities in networks, systems, and applications. They can also discover devices on a network and map network topologies. Multipurpose tools can perform Penetration Testing which is simulating cyber-attacks to identify weaknesses in security postures. Lastly, they provide Packet Analyses. It means inspecting network traffic to identify anomalies and potential threats.

Cloud Infrastructure Assessment Tools
ScoutSuite

ScoutSuite is a multi-cloud security auditing tool. It enables the assessment of the security posture of cloud environments. One of its main advantages is that after it has performed the assessment, it provides a clear view of the attack surface automatically. It works by automatically aggregating configuration data for an environment and applying rules to audit the environment. This is a useful tool for point-in-time security assessments. ScoutSuite can be used for AWS, Azure and Google Cloud environments among others.

Prowler
Prowler is a network vulnerability scanner packed full of features. It can scan a network for all IP addresses associated with active network devices, which is useful for the discovery of devices on your network. It can also determine the type of devices using fingerprinting as well as determine which ports are open on the device. It will attempt to associate the ports open with common services. Another useful feature built into prowler is the ability to test devices against a dictionary of actor default and common credentials, which is very useful as this is often overlooked particularly in large organizations. It utilizes a dashboard to notify users of any security vulnerabilities.

Pacu
Pacu is a comprehensive AWS security testing toolkit designed for penetration testers. If you are familiar with Metasploit, you will know that it’s like a Swiss army knife when it comes to pen testing, and it specializes in exploits. Metasploit can perform scans, crack passwords and develop exploits. Pacu was designed to be the Metasploit equivalent, but for AWS environments. It is written in Python 3 and has tools for every step of the penetration testing process, covering the entire cyber kill chain. It contains over 35 modules which include tools for reconnaissance, persistence, privilege escalation, enumeration, data exfiltration, log manipulation and other general exploitations. Pacu is most useful in the post-compromise phase, which is after you have obtained a password for user accounts. Some of the features it specializes in include testing S3 bucket configuration and permission flaws, establishing access through Lambda backdoor functions, compromising EC2 instances, exfiltrating data, escalating privileges and covering tracks by disrupting monitoring and logging.


Skip to main content
Completion requirements
 Done: View
We will explore the strategic importance of multipurpose tools in cybersecurity, study cloud infrastructure assessment tools, and the application of the Common Vulnerability Scoring System (CVSS). Emphasis will be placed on the concepts of Validation, Context Awareness, and an insightful discussion on Zero-Day vulnerabilities and their impact on cybersecurity.

 

 Skip to main content
Completion requirements
 Done: View

Common vulnerability scoring system (CVSS), developed by the Forum of Incident Response and Security Teams (FIRST), aims at providing a standard for assessing the severity of software vulnerabilities. It is an important tool used to ensure the security of systems and data. It objectifies the measure of risk posed by a particular vulnerability and consequently leads the IT teams to effectively allocate resources and prioritize remediation. Based on a wide range of factors, the CVSS assigns a score, which helps the IT team to identify, assess and address potential vulnerabilities.

The factors which impact the CVSS score include the type of vulnerability, the affected system, and the potential impact on the system. The fundamentals of CVSS are based on the concept of risk. It analyzes the chances of a vulnerability to affect a particular system and the potential impact of it and it neither measures the exploitability nor the fixing costs of the vulnerability.

Calculation of CVSS Score
The calculation of CVSS can be carried out in 5 steps:

Identification of Threat Agent: some of the common threat agents used in calculating CVSS are unauthenticated, authenticated, and remote unauthenticated users and each of these agents has a separate impact score.
Identification of the Affected System: This involves the identification of the system type and product name.
Assigning a Score: A scoring matrix includes confidentiality, integrity, availability, and accountability. Based on the impact of exploiting the vulnerability on the affected system, a score is assigned.
Identifying the Probability of the Threat Agent Accessing the System: In this step, the threat agent's ability to access the system is determined and the environment of the system is evaluated.
Calculation of Overall CVSS Score: Depending on the scoring matrix, the formula for calculating the overall CVSS score will vary. Common Vulnerability Scoring System Calculators are provided by NIST
CVSS Vector String
To provide more information on the scoring matrix used to calculate the overall CVSS score, some additional information is passed along with the CVSS score. This information is called CVSS Vector String. The vector string is divided into different fields which provides information regarding the vulnerability identifier, the impact, the environmental concerns and additional information.

Vulnerability identifier: It contains the identifier which is used to calculate the overall CVSS score.
Impact field: It provides the overall impact score to the affected system due to vulnerability exploitation. It is calculated using the scoring matrix.
Environment Concerns field: This field provides information on the vulnerability risk associated in the target host environment.
Additional information field: This field provides information about the vulnerability, for example, vendor name, the impact type, etc.
Benefits of CVSS
The benefits of CVSS can be summarized in the following:

Objectifies the risk posed by a vulnerability
Allows prioritization of remediation efforts
Facilitates effective allocation of resources
Provides insight into the impact of a vulnerability
Gives granular information about vulnerabilities in a system
Allows targeted and efficient approach to remediate vulnerabilities
Helps in prioritizing vulnerabilities based on CVSS score
Holds remediation of non-critical vulnerabilities until there is more time or resource
Provides information around scoring matrix which reveals the potential of a vulnerability
Challenges of CVSS
CVSS has its limitation in providing information about the exploitability of a vulnerability. This could be problematic to organizations where more resources are required to remediate their vulnerabilities and could lead to organizations focusing on vulnerabilities of negligible risk. Another challenge in CVSS methodology is that the scoring system for CVSS may change from time to time leading to a different scoring matrix from version to version. There is a chance of the organization focusing on scoring matrix which are not applicable to the version, which leads to confusion and complication.

CVSS Tools
There are many tools available to help organizations calculate CVSS score and to understand the potential risks associated with a vulnerability. The following are some of the common tools used to calculate a CVSS score:

Nessus: Nessus is a widely used vulnerability assessment tool. It identifies and enables organizations to assess the risk associated with vulnerabilities based on several factors, including the CVSS score.
OpenSCAP: OpenSCAP is an open-source scanner used to identify system vulnerabilities and enables calculation of a CVSS score based on the vulnerabilities identified in a system.
Qualys: Qualys is a widely used vulnerability assessment tool to identify system vulnerabilities and enables calculation of a CVSS score based on the vulnerabilities identified in the system.
OpenVAS: OpenVAS is an open-source scanner which enables calculation of a CVSS score based on the vulnerabilities identified in the system.
SecurityScorecard: SecurityScorecard is a cloud-based solution that enables organizations to gauge and improve their security posture while also enabling them to calculate a CVSS score based on the vulnerabilities identified in the system.
COMMON VULNERABILITY SCORING SYSTEM (CVSS) METRICS
A scan report lists all vulnerabilities detected and assigns a severity score using Common Vulnerability Scoring System (CVSS) metrics. This serves as a base for prioritizing response actions. It is also important to assess the whole report to check whether any particular vulnerability has been under- or over-scored.

CVSS metrics provides a score from 0 to 10 by considering the inherent traits of the vulnerability (base score), the changing characteristics of vulnerability over time (temporal score). The following table shows the scores and their band description:


Score

Description

0

None

0.1+

Low

4.0+

Medium

7.0+

High

9.0+

Critical

 

Common Vulnerability Scoring System v4.0
The Common Vulnerability Scoring System v4.0 released in November, 2023 provides better granularity to the characteristics and severity of software vulnerabilities. Some of the revisions include the new Base Metric Attack Requirements (AT), which describes the prerequisite conditions that enable an attack. Scope (S), Confidentiality (C), Integrity (I), and Availability (A) are replaced with Vulnerable System Confidentiality (VC), Vulnerable System Integrity (VI), Vulnerable System Availability (VA), Subsequent System Confidentiality (SC), Subsequent System Integrity (SI), Subsequent System Availability (SA). It also includes new Threat, Environmental, and Supplemental groups to provide better information on the CVSS Score. The CVSS 4.0 specification document is available at https://www.first.org/cvss/v4.0/specification-document.


Skip to main content
Completion requirements
 Done: View
Validation is the process of confirming that the security measures and controls in place are effective and function as intended. It involves a series of activities to ensure that cybersecurity policies, procedures, and tools provide the intended level of protection.

Network
Network data must be collected as completely as possible before one beginning to analyze network data for its usefulness in an incident or investigation. During both environmental reconnaissance testing and when performing forensic investigations, security analysts have a number of network tools at their disposal. Capturing very large sets of packet data is useful only if actionable information can be gained from them.

Wireshark
A packet analyzer or protocol analyzer is used to analyze network traffic and is often accompanied by a sniffer. This tool presents data from a captured packet in a readable format, either in summarized form, or with the details of the data including function, OSI layer, and protocol.

One of the most widely used software-based protocol analyzers is Wireshark. It captures raw packets off the interface it is configured on and allows examination of each packet. If the data is unencrypted, read the data. Wireshark is probably the most widely used GUI-based packet analyzer. Figure 4.8 and Figure 4.9 show examples of Wireshark in use while Figure 4.10 shows how to drill into a specific packet to get a detailed view that includes the payload.

Figures 4.8: Wireshark in Use

tcpdump

The command-line tool tcpdump can capture packets on Linux and Unix platforms. A version for Windows is also available—windump. Using it is a matter of selecting the correct parameter to go with the tcpdump command. For example, the following command enables a capture (-i) on the Ethernet 0 interface.



To explore the many other switches available for tcpdump, see www.tcpdump.org/tcpdump_man.html.

Endpoints
Forensic tools are used to collect evidence during a cyber investigation. Many of these tools are used to obtain evidence from endpoints. Included in this category are forensic investigation suites, hashing utilities, password cracking tools, and imaging tools.

Disk Imaging
Many tools are dedicated to retrieving evidence from a disk. Others are used to working with the data found on the hard drive. The following tools are all related in some form to obtaining evidence from a disk.

A disk image is a complete copy of everything on your computer or external hard-drive. It copies the data sector-by-sector instead of file-by-file. This creates a perfect replica of the structure and contents of the storage device. This includes partitions, files, folders, boot records, deleted files and un-allocated spaces. This is helpful in forensics because you can perfectly replicate a device and use the replica to run forensic tests without worrying about damaging evidence.

dd command
The dd command can be used to create a disk image of a Linux system or to copy an input file to an output file. The option to apply conversions to the file data are available. 

FTK
Forensic Toolkit (FTK) is a commercial forensic suite, marketed by AccessData, that runs on Windows Server.

Forensic Toolkit (FTK) Imager 
FTK Imager is a free data preview and imaging tool developed by AccessData. It is a full-featured product that enables one to perform a forensically sound acquisition, verify it by generating MD5 and/or SHA-1 hashes, and even preview the files and folders in a read-only fashion. FTK Imager will also read registry keys from Windows and allow a preview of them and their values. It also supports compression, encryption, and multiple output formats, including EnCase evidence file format (E01). For more information on FTK, see https://accessdata.com/products-services/forensic-toolkit-ftk/ftkimager

Helix3
Helix3 comes as a live CD that can be mounted on a host without affecting the data on the host. From the live CD, evidence can be acquired and drive images can be made. This product is sold on a subscription basis by e-fense. For more information on Helix3, see https://www.e-fense.com/helix3pro.php

EnCase
EnCase Forensic is a digital forensics suite developed by Guidance Software. Workflow templates illustrate the key steps used for conducting different types of investigations. Separate products are available for the management of digital evidence and for the analysis of network servers and desktops. Encase is expensive and their sales teams are predatory, so be aware prior to contacting.

Sysinternals
Sysinternals is a Windows command-line tool containing more than 70 tools to use for security and troubleshooting issues. Among these are forensic tools. Sysinternals has many utilities used for incident response and forensic analysis. These tools are free and developed over many years by Microsoft agents who kept answering the same questions. It was designed to solve these common issues more easily and continues to be added to each year. For more information, see https://technet.microsoft.com/enus/sysinternals/.

Cellebrite
Cellebrite markets Universal Forensic Extraction Devices (UFED) for extracting evidence from smartphones, feature phones, other mobile devices as well as from metadata and cloud data. The software can also be installed on desktops and laptops. A UFED is designed to collect metadata from the memory chips of iOS and Android devices by skirting the lock controls and accessing file systems. A UFED preserves the forensic validity of data.

Hashing
A hash function takes a message of variable length and produces a fixed-length hash value. Hash values, also referred to as message digests, are calculated using the original message. If the receiver calculates a hash value that is the same, the original message is intact. If the receiver calculates a hash value that is different, then the original message has been altered.

Hashing Utilities
Authorities need data analyzed as an exact replica of the data on disk to prove no tampering happened. This can be done by creating a fingerprint or cryptographic hash of the contents. Cryptographic hash functions include the Message Digest Algorithm (MDA / MD5) and the Secure Hash Algorithm (SHA).

The MD5, more widely used than MDA, is not necessarily a secure means of protecting passwords or digital-certificate signatures. Hackers have found vulnerabilities to exploit. However, MD5 remains the default option for quite a few forensic utilities because it scores higher than SHA on speed of execution and compatibility with other tools.

SHA was developed by NIST for the US government as a more secure alternative to MDA and MD5. The two versions in use today are SHA--1 and SHA-- 2. Though neither version is considered completely secure. Security protocols such as IPsec and SSL employ SHA–2.

Image acquisition tools usually feature automated fingerprint calculation and verification capabilities. Some tools will implement both MD5 and SHA hashes. Command-line tools such as Windows certutil and Linux md5sum and sha512sum can also be employed for this task.

MD5sum – md5sum is a Linux tool used to calculate the fingerprint of a file.
SHAsum – sha1sum, sha256sum, and sha512sum are used to calculate and verify file fingerprints. 
Password cracking
Analysts will need to decipher passwords if an attacker has encrypted the files on the disk. It is also necessary to have knowledge of password-cracking methods employed by hackers to exploit user accounts.

When a password is defined, the system uses a cryptographic algorithm, such as SHA or MD5, to convert plaintext to a hash so only the user knows the password. Plaintext cannot be recovered from the hash unless someone succeeds in breaking the password.

Password crackers work by manipulating known vulnerabilities in the algorithms used to transmit and store passwords. They are capable of brute-force attacks and breaking weak passwords with the help of rainbow tables and precompiled dictionaries.

Passwords are normally stored as follows:

Linux – hashed passwords and other details of user accounts are stored by default in a file (/etc/passwd), which is accessible by anyone, so passwords are usually moved to /etc/shadow. Only the root user can access this location.
Windows Registry – passwords and other details of local users are stored in the registry on Windows systems. Cached passwords are normally stored by browsers in the Windows Registry or in a file.
Active Directory – the passwords and details of domain users are stored in the Active Directory on domain controller (DC) servers.
Hackers frequently trade successfully breached hashes with other hackers.

Password cracking tools include:

John the Ripper – a free open-source password cracker for UNIX, Linux, Mac OS, and other platforms.
Cain & Abel – a Windows password recovery tool employing a password sniffing utility. Its methods include brute force and dictionary attacks.
Hashcat and oclHashcat 
Hashcat and its GPU-optimized variant, oclHashcat, are powerful password-cracking utilities that support a vast number of attack modes, such as brute-force, dictionary, and rule-based. Combined with their ability to target various hash types, databases, and full disk encryption schemes, these software products have become the go-to for many forensics analysts.

Memory
Applications store information in memory, and this information often includes sensitive data, passwords, usernames, and encryption keys. Hackers use memory-reading tools to analyze the entire memory content used by an application. Any vulnerability testing should take this into consideration and utilize the same tools to identify issues in the memory of an application. The following are some popular memory-reading tools:

Memdump: This free tool runs on Windows, Linux, and Solaris. It simply creates a bit-by-bit copy of the volatile memory on a system. 
KnTTools: This memory acquisition and analysis tool used with Windows systems captures physical memory and stores it to a removable drive or sends it over the network to be archived on a separate machine.
FATKit: This popular memory forensic tool automates the process of extracting interesting data from volatile memory. FATKit helps an analyst visualize the objects it finds to help understand the data that the tool was able to find.

Skip to main content
Completion requirements
 Done: View
Context Awareness refers to the understanding and application of situational information in the process of securing IT systems. It involves analyzing and interpreting data within the context of its environment, user behavior, network conditions, and potential threats.

Data Correlation
Data correlation is the process of locating variables in the information that seem to be related. Security information and event management (SIEM) systems do a fantastic job of collecting and presenting massive amounts of data from disparate sources in a single view. These systems collect and analyze logs via aggregation and correlation and help identify attacks and trends. Data correlation also assists analysts in determining if an event is malicious and any behaviors connected with the event. With a smart policy for how logs are captured and sent to a SIEM, we can spend more time investigating what actually happened versus trying to figure out if the data we needed even recorded. SIEMs are critical when categorizing attacks.

Reverse Engineering (RE)
RE means taking something apart to discover how it works and then replicating it. In cybersecurity, RE is used to analyze hardware and software. It is also used to determine the presence of malware in software, understand how the malware functions, and to locate software bugs and security problems in hardware.

RE relates exclusively to malware. The idea is to analyze the binary code to determine IP addresses or host/domain names it uses for command and control (C2) nodes, the techniques it employs to achieve permanence in an infected host, and unique characteristics that could be used as a signature for the malware. RE can be effective from a long-term perspective.

Reverse engineering malware code facilitates analysis of the code with a view to develop methods to deceive adversaries. For example, an analyst can devise ways to intercept function requests from malware in order to trick the attacker into believing their attack is proceeding while analysts record details of tactics and try to discover identity.

Security Information and Event Management (SIEM) Review
SIEM systems provide automated solutions for collecting, storing, analyzing and reporting of events. Most of the collected information comes from various systems’ logs, which are exported and sent to the SIEM system. SIEM will then typically normalize the format of the data from these disparate sources so they can be compared with each other. It then stores everything in a system optimized for quick retrieval, which is needed when analyzing vast amounts of information. Most SIEM products support two ways of collecting logs from log generators:

Agentless: With agentless collection, the SIEM receives data from the individual hosts without needing to have any special software installed on those hosts. Some servers pull logs from the hosts, which is usually done by having the server authenticate to each host and retrieve its logs regularly.
Agent-based: With agent-based collection, an agent program is installed on the host to perform event filtering and aggregation and log normalization for a particular type of log. The host then transmits the normalized log data to a SIEM server, usually on a real-time or near-real-time basis, for analysis and storage.
SIEM Tools
The primary function of SIEM tools is gathering logs from Windows and Linux hosts. These tools gather information from firewalls, vulnerability scanners, switches, routers, antivirus scanners, and databases. In addition to log aggregation, SIEM tools correlate events to identify signs of risk. Alerts can be issued based on these indicators. For monitoring and reporting compliance, SIEM tools also have the capacity to retain records over the long term.

SIEM utilizes software to provide real-time event analysis of network devices. To identify security issues or incidents, SIEM aggregates information from configured network devices. It then interprets and correlates key attributes (users, IP’s, ports, event types, processes, memory, etc.).

SIEM is a combination of the following tools:

The Log Management System (LMS) collects and stores various log files from the central server(s).
The Security Log/Event Manager (SLM/SEM) sorts through log files and highlights the most important events.
The Security Information Management (SIM) manages assets which form the backbone of the information technology environment.
The Security Event Correlation (SEC) is used to identify any relevant statistical correlations from the log files. 
SIEM consolidates information and data from all configured network devices. Examples include:

Asset Management System – this includes business process data.
Network Intrusion Detection System (NIDS) – this includes contents of data packets, various networking protocols and associated IP addresses.
Endpoint Security System – this includes data on various network-based files, including usernames and hosts.
Service Logs – this refers to information on various end user sessions, including transactions which have occurred in relevant database(s) and any changes in hardware and software configuration.
File Monitoring System (FIM) – this refers to data regarding any changes in network-based files or settings for the OS registry.
Note that SIEM connects all “disparate” sources to provide the network administrator with a consolidated view.
Leading proprietary and open-source tools include:

Elasticsearch (ELK) Stack - Elasticsearch is a distributed, open-source search and analytics engine for all types of data, including textual, numerical, geospatial, structured, and unstructured. 
ArcSight – ArcSight is an enterprise SIEM solution owned by HP. In addition to log management and analytics, ArcSight is designed to perform compliance reporting for SOX, PCI DSS, and HIPAA laws and regulations.
QRadar – QRadar is a log management, analytics, and compliance reporting solution owned by IBM.
Splunk – Splunk is a widely-used data aggregation and analysis tool. Deployed locally or as a cloud-based solution, Splunk uses a connector to import system-generated data. These connectors are available for most network operating systems and application platforms. The imported data is then indexed and stored in a data store. Splunk can retrieve both historical and real-time data and employ searches to locate the appropriate data. Search results can be displayed in reports and on dashboards. Splunk can also be configured to issue alerts based on search results.
AlienVault and OSSIM – Open-Source Security Information Management (OSSIM) is developed by AlienVault who also markets proprietary versions. OSSIM manages logs and provides total visibility for devices on a network and instances in the cloud. It can integrate open-source tools, including SNORT IDS, to provide an integrated solution to administer the entire security environment.
Kiwi Syslog – a log management server designed to gather logs from Windows and Linux hosts, as well as network devices.  Once the logs are gathered, Kiwi Syslog stores and manages the data centrally.
Dashboard
Figure 3.7 shows a SIEM dashboard displaying the security events collected over a fixed period of time. This particular SIEM is based on the ELK stack, a popular solution for security analysts who need large-volume data collection, a log parsing engine, and search functions. From the total number of raw logs (more than 3000 in this case), the ELK stack generates a customizable interface with sorted data and provides color-coded charts for each type.



Figures 3.7: SIEM dashboard showing aggregated event data from various network sources.

Rule Writing
The ability to search data is a core function of any SIEM tool. The key to reducing the amount of irrelevant data (noise) and the number of errors is to write rules that guide the system in making decisions. Rules are classified by the rule type. Examples of rule types include:

Single event rule: If a condition happens, an action is triggered. 
Many-to-one or one-to-many rules: If condition A happens, several scenarios are in play.
Cause-and-effect rules: If condition A matches and leads to condition B, take action. Example: “Password-guessing failure followed by successful login” type scenarios.
Transitive rules or tracking rules: Here, the target in the first event (N malware infection) becomes the source in the second event (malware infection of another machine). This is typically used in worm/malware outbreak scenarios.
Trending rules: Track several conditions over a time period, based on thresholds. This happens in DoS or DDoS scenarios.
Known-Bad Internet Protocol (IP)
Most SIEM tools can identify IP addresses and domain names from malicious sites. IP, URL, and domain reputation data are derived from the aggregated information of all the customers of the SIEM solution.

Query Writing
Query writing is the process of forming a query to locate the information being looked for. Properly formed queries can help locate the security needle in the haystack when it comes to analyzing log data. Sigma is an open standard for writing rules that allows describing searches on log data in generic form. These rules can be converted and applied to many log managements or SIEM systems and can even be used with grep on the command line.

String Search
String search looks within a log file or data stream and locates any instances of that string. It can be a combination of characters, numbers, or special characters. They are used to identify malware and locate strings used in attacks. String searches can be performed by using either search algorithms or regular expressions, but many audit tools such as SIEM (and many sniffers as well) offer GUI tools that allow security professionals to form the search by choosing from options.

Script
Scripts are functions used to orchestrate or automate certain responses. A simple example is a script that tests for the presence of lowercase letters in passwords and responds when no lowercase letter is present. 

Skip to main content
Completion requirements
 Done: View
In this phase the attacker will use information obtained in the reconnaissance phase to create a method of attack. Attackers will use information about a target’s operating systems, the type of cameras in place, versions of processes running on the target’s servers, ports that are open or closed and any other information gathered to create the most effective means of accessing the target’s assets. Attackers also often write custom malware, create phishing emails and flash drives/USB sticks containing malware and any other method they believe effective to their purpose. 

Exploitability Metrics - attempt to summarize the ease and technical means by which a vulnerability can be exploited. They represent the characteristics of the vulnerable component, or in other words, the thing that is vulnerable.

Attack Vector (AV)
An attack vector can be Physical (P), Local (L), Adjacent (A) or Network (N). P means that the attacker needs to physically touch or manipulate the vulnerable component. L means the vulnerable component is not bound to the network stack and the attacker’s path is via read/write/execute capabilities. A means the attacker would need to have access to the network containing the target in order to exploit it. N is the most severe rating and means that the target can be exploited from anywhere over the internet.

Attack Complexity (AC)
AC refers to the conditions beyond an attacker’s control which must exist in order to exploit the vulnerability. It is important to note that the assessment of this metric excludes requirements for user interaction in order to exploit the vulnerability. (These conditions are captured in a later metric). AC has two values:

Low (L): No specialized access conditions or extenuating circumstances exist. An attacker will have repeatable success when attacking this vulnerable component.

High (H): A successful attack depends on conditions beyond the attacker’s control.

Privileges Required (PR)
PR describes the level of privileges an attacker must possess before successfully exploiting the vulnerability. This can be assigned the following values:

None (N): The attacker is unauthorized prior to an attack and does not require any access to settings or files on the vulnerable system to carry out the attack.
Low (L): The attacker requires privileges that provide basic user capabilities which could normally only affect settings and files owned by the user.
High (H): The attacker requires significant privileges such as administrative level.  
Note: Privileges required are usually given a score of none for hard-coded credential vulnerabilities or vulnerabilities requiring social engineering.
User Interaction (UI)
UI highlights the requirement for a human user (not the attacker) to participate in the successful compromise of a vulnerable component. UI has two values:

None (N): The vulnerable system can be exploited without interaction from any user.
Required (R): Requires a user to take some action before the vulnerability can be exploited.
Scope (S)
Scope highlights whether a vulnerability in a vulnerable component can impact resources in components beyond its security scope. Scope has two values:

Unchanged (U): An exploited vulnerability can only affect resources managed by the same security authority.
Changed (C): An exploited vulnerability can affect resources beyond the security scope managed by the security authority of the vulnerable component.

Zero Day

A zero-day is something no organization ever wants to experience. It is the most severe type of vulnerability and has the potential to cause great havoc on an organization’s IT assets. A zero-day is a new vulnerability never before seen by any organization and which no organization is prepared to handle, or defend, against. Typically, an organization’s systems are vulnerable without realizing it; a very dangerous position to be in. 

Zero-days are more common than people think. Windows has experienced an alarming number of zero-days recently. If you are interested as to the type of vulnerabilities zero-days are found as, search the Common Vulnerability Exposure (CVE) database at the following link: https://www.cvedetails.com/. Searching for windows on this site will display a list of the most recent vulnerabilities discovered and a severity score. Zero-days are often fixed as soon as possible, with the security vendor releasing a patch for all systems affected. The patch is then applied by system administrators across all affected systems.

One common way to detect a zero-day in IT assets is to have the necessary network monitoring tools and audit logging software in place. Network monitoring tools will send an alert to an organization’s IT team if it detects anything suspicious or out of the ordinary on the network. Examples of warning signs include an employee account attempting to access files restricted to them, attempting to move laterally between networks or by regularly connecting and receiving data from an external connection. Audit logging tools will detect who is attempting to access restricted data. An employee without necessary permissions attempts to access confidential data is also a warning sign of a potential hacker in your network or on your systems.

A popular zero-day detection software package is Capsule8’s Unified Cloud-Native Solution against zero-day attacks. This software uses the most advanced detection strategies to detect the presence of zero-days. More information can be found here: https://info.capsule8.com/how-to-detect-and-prevent-zero-day-attacks


