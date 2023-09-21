+++
author = "Winston Tsia"
authorlink = ""
title = "API Security Architect"
date = 2023-09-20T23:56:49-07:00
description = "Notes on API Security Architect"
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

![]()

# Contents
- [Contents](#contents)
- [Introduction](#introduction)
  - [Outcomes](#outcomes)
  - [Key Points](#key-points)
    - [Web Attacks](#web-attacks)
    - [API Security Top 10](#api-security-top-10)
    - [Web App Security Risks Top 10](#web-app-security-risks-top-10)
    - [Case Study](#case-study)
    - [Standard Security Functions](#standard-security-functions)
  - [TLS SSL](#tls-ssl)
    - [TLS Trust Attacks](#tls-trust-attacks)
  - [HTTP](#http)
  - [Best Practices for API Security](#best-practices-for-api-security)
  - [API Security Specifications](#api-security-specifications)

# Introduction
## Outcomes
- Explain the unique security risks of APIs and identify typical areas of API vulnerabilities 
- Explain the purpose of OAuth 2.0 as a framework for authorization 
- Describe the current challenges of OAuth 2.0 implementation
- Describe OpenID Connect as an authentication layer and how it complements OAuth 2.0 
- Summarize the general specifications of the current OpenID Connect protocol suite
- Explain how JSON Web Tokens (JWT) work and the advantages and considerations of stateless tokens
- Summarize common threat models for OAuth 2.0 and some ways to mitigate and overcome them

## Key Points
### Web Attacks
1. Cross-Site Scripting: malicious scripts injected into trusted sites, sending malicious code to end users
2. Denial of Service: render resource unavailable (DDoS)
3. Man in the middle: intercepts communications
4. Cross-Site Request Forgery: Forces end user to execute unwanted actions like state-change requests
5. Injection: Insertion of SQL query via input data, reading or modifying sensitive input data from a DB
6. Overflow: overwriting fragments of processes 

### API Security Top 10
These are common security vulnerabilities and issues that can specifically affect APIs (Application Programming Interfaces). Let's explore each of them in the context of API security:

1. **Broken Object Level Authorization**:
   
   - **Description**: Broken object level authorization occurs when an API does not properly enforce access controls to ensure that users or clients can only access the resources and data they are authorized to access. It can result in unauthorized access to sensitive data.

2. **Broken User Authentication**:
   
   - **Description**: Broken user authentication refers to vulnerabilities in the authentication process of an API. It can include issues like weak password policies, improper session management, or vulnerabilities that allow attackers to impersonate legitimate users.

3. **Excessive Data Exposure**:
   
   - **Description**: Excessive data exposure happens when an API returns more data than necessary in its responses, potentially exposing sensitive information that should be protected. This can be exploited by attackers to gain insights into the system's architecture or sensitive data.

4. **Lack of Resources & Rate Limiting**:
   
   - **Description**: A lack of resources and rate limiting in APIs means there are no mechanisms in place to limit the number of requests a user or client can make within a specified time frame. This can lead to abuse and denial-of-service attacks.

5. **Broken Function Level Authorization**:
   
   - **Description**: Similar to broken object level authorization, this vulnerability occurs when APIs do not adequately check whether a user or client has the appropriate permissions to perform specific actions or functions within the API.

6. **Mass Assignment**:
   
   - **Description**: Mass assignment vulnerabilities occur when APIs allow clients to update or modify a large number of properties or fields in a resource, including sensitive ones that should not be accessible or modifiable.

7. **Security Misconfiguration**:
   
   - **Description**: Security misconfiguration in APIs relates to poor configuration settings that can make an API more vulnerable to attacks. This can include exposed debug endpoints, default credentials, and unnecessary open ports.

8. **Improper Assets Management**:
   
   - **Description**: This vulnerability pertains to the management of assets, such as files or data, within an API. Improper handling of assets can lead to data leakage, unauthorized access, and the introduction of malware.

To mitigate these API security vulnerabilities, best practices include:

- Implementing proper access controls and authorization mechanisms.
- Employing strong authentication methods, such as multi-factor authentication (MFA).
- Applying data minimization principles to avoid excessive data exposure.
- Implementing rate limiting and resource throttling to protect against abuse.
- Conducting regular security assessments and testing, including penetration testing and code reviews.
- Following secure coding practices and applying security headers and configurations.
- Ensuring that assets are properly managed, stored securely, and not exposed to unauthorized users.

> API security is crucial in protecting sensitive data and ensuring the integrity and reliability of your applications and services. Regular security assessments and proactive security measures are essential to mitigate these vulnerabilities effectively.

### Web App Security Risks Top 10

Certainly, these are common security vulnerabilities and issues that can impact the security of web applications and systems. Let's explore each of them:

1. **Broken Authentication**:
   
   - **Description**: Broken authentication occurs when the authentication mechanisms of an application are not properly implemented or are vulnerable to attacks. This can lead to unauthorized access to user accounts, sensitive data, or administrative functions.
   
   - **Common Causes**: Weak password policies, improper session management, lack of multi-factor authentication (MFA), and insecure credential storage are some common causes of broken authentication.
   
   - **Impact**: It can result in unauthorized access, identity theft, data breaches, and compromised user accounts.

2. **Sensitive Data Exposure**:
   
   - **Description**: Sensitive data exposure occurs when an application fails to adequately protect sensitive information, such as passwords, credit card numbers, or personal data. Attackers may exploit this vulnerability to access or steal sensitive data.
   
   - **Common Causes**: Weak encryption, inadequate data storage security, and improper data transmission practices can lead to sensitive data exposure.
   
   - **Impact**: It can lead to data breaches, privacy violations, financial loss, and legal consequences.

3. **XML External Entities (XXE)**:
   
   - **Description**: XXE is a vulnerability that occurs when an application parses XML input from an untrusted source without proper validation. Attackers can use malicious XML entities to read sensitive files, launch denial-of-service attacks, or perform other malicious actions.
   
   - **Common Causes**: Lack of proper input validation, using outdated XML parsers, and accepting XML from untrusted sources can lead to XXE vulnerabilities.
   
   - **Impact**: XXE attacks can lead to data disclosure, server resource exhaustion, and application compromise.

4. **Broken Access Control**:
   
   - **Description**: Broken access control vulnerabilities arise when an application fails to enforce proper access controls. This allows unauthorized users to access restricted resources or perform actions they should not be able to.
   
   - **Common Causes**: Insufficient authorization checks, lack of proper session management, and missing access controls can result in broken access control issues.
   
   - **Impact**: It can lead to data exposure, privilege escalation, and unauthorized manipulation of resources.

5. **Security Misconfiguration**:
   
   - **Description**: Security misconfiguration occurs when an application, server, or database is not properly configured to secure sensitive data or resources. Attackers can exploit these misconfigurations to gain unauthorized access or disrupt services.
   
   - **Common Causes**: Poorly configured security settings, default configurations, and publicly accessible admin interfaces can lead to security misconfigurations.
   
   - **Impact**: Security misconfigurations can result in data breaches, exposure of sensitive information, and service disruptions.

6. **Insecure Deserialization**:
   
   - **Description**: Insecure deserialization vulnerabilities arise when an application deserializes untrusted data without proper validation. Attackers can manipulate serialized objects to execute arbitrary code, leading to remote code execution.
   
   - **Common Causes**: Lack of input validation during deserialization and the use of insecure deserialization libraries can introduce this vulnerability.
   
   - **Impact**: Insecure deserialization can lead to remote code execution, application compromise, and unauthorized access.

7. **Known Vulnerabilities**:
   
   - **Description**: Known vulnerabilities are security issues or weaknesses that have been publicly documented and for which patches or fixes are available. Failure to apply these patches can leave an application vulnerable to known attacks.
   
   - **Common Causes**: Delayed or neglected software updates and patch management can result in known vulnerabilities persisting in an application.
   
   - **Impact**: Exploitation of known vulnerabilities can lead to security breaches and unauthorized access.

8. **Insufficient Logging/Monitoring**:
   
   - **Description**: Insufficient logging and monitoring refer to the lack of effective mechanisms for recording and monitoring security-related events in an application. This can make it difficult to detect and respond to security incidents.
   
   - **Common Causes**: Inadequate logging practices and the absence of intrusion detection and monitoring systems can result in insufficient logging and monitoring.
   
   - **Impact**: It hinders the ability to detect and respond to security incidents in a timely manner, potentially leading to data breaches and prolonged attacks.
> To mitigate these security vulnerabilities, best practices include conducting regular security assessments, implementing strong authentication and authorization controls, validating and sanitizing input, staying updated on security patches, and following secure coding practices. Additionally, employing web application firewalls (WAFs) and security testing tools can help identify and address these issues.

### Case Study
1. Snapchat: Application identity Spoofing
2. Verizon FIOS: CSRF (Cross-Site Request Forgery)
3. Nissan Leaf: Identity Spoofing

### Standard Security Functions
- Rate limiting: limit request based on IP, Identity, Resource target
- Message Validation: prevent message based-attacks via schema based validation
- Encryption and Signing: prevents spoofing/MiM (transport/message level)
- Access Control: restrict via user identity

## TLS SSL
TLS/SSL is based on cryptography--choose supported cipher suite, use key material, ensure validation model is based on certificate trust.

Major vulnerabilities:
- POODLE: Padding Oracle On Downgraded Legacy Encryption
- BEAST: Browser Exploit Against SSL/TLS
- CRIME: Compression Ratio Info-leak Made Easy
- BREACH: Browser Reconnaissance and Exfiltration via Adaptive Compression of Hypertext
- HEARTBLEED: OpenSSL heartbeat extension vulnerability

### TLS Trust Attacks
- Certificate Authority Vulnerabilities (malicious certificates)
- Human vulnerabilities (impersonated visual cues)
- Man in the middle (sniff data/ launch crypto attack on encrypted data)

## HTTP
HTTP provides access authentication--servers reject unauthorized access and challenges clients, to which clients transmit credentials.
- Authentication Schemes
  - Basic: User, Pass in request header (Base64 encoded) in plain text
  - Digest: Pass encrypted, server can downgrade scheme to Basic (MiM vulnerable)

## Best Practices for API Security
1. Security (Authentication/Authorization)
2. Protection (OWASP API vulnerabilities)
3. Throttling (quota request/retries)
4. Continuous API Monitoring
5. Request/Response Payload Validation
6. Error Handling

## API Security Specifications
- OAuth Authorization
- OpenID Connect Authentication
