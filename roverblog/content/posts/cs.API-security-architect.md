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
  - [OAuth 2.0](#oauth-20)
    - [Learning Objectives](#learning-objectives)
    - [Key Points](#key-points-1)
  - [OpenID Connect](#openid-connect)
    - [1. OpenID Connect as an Authentication Layer](#1-openid-connect-as-an-authentication-layer)
    - [2. Identity as a Resource](#2-identity-as-a-resource)
    - [3. OpenID Connect's Authentication Flow](#3-openid-connects-authentication-flow)
    - [4. General Specifications of the OpenID Connect Protocol Suite](#4-general-specifications-of-the-openid-connect-protocol-suite)
    - [Conclusion](#conclusion)
- [OAuth 2.0 Threats](#oauth-20-threats)
    - [OAuth 2.0 Threat Models](#oauth-20-threat-models)
      - [1. **Client Threat Models**](#1-client-threat-models)
      - [2. **Endpoint Threat Models**](#2-endpoint-threat-models)
      - [3. **Token Threat Models**](#3-token-threat-models)
    - [Additional Measures and Resources](#additional-measures-and-resources)

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
These are common security vulnerabilities and issues that can specifically affect APIs (Application Programming Interfaces):

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

## OAuth 2.0
### Learning Objectives

1. **Explain the purpose of OAuth 2.0 as a framework for authorization**:
   - **Definition**: OAuth 2.0 is an open standard for access delegation, commonly used as a way to grant websites or applications limited access to user information without exposing passwords. It allows third-party services to exchange data on behalf of the user.
   - **Purpose**: The main goal of OAuth 2.0 is to allow users to grant applications access to their resources on other services without sharing their credentials (username and password).

2. **Describe the authorization code flow**:
   - **Definition**: The authorization code flow is a type of OAuth 2.0 grant. It is used to obtain an authorization code, which is then exchanged for an access token.
   - **Steps**:
     1. The client application directs the user to the authorization server.
     2. The user authenticates and authorizes the client.
     3. The authorization server redirects the user back to the client with an authorization code.
     4. The client application exchanges the authorization code for an access token at the authorization server.

3. **Summarize and compare four different authorization grant types**:
   - **Authorization Code**: Used for server-side applications. Involves exchanging an authorization code for an access token.
   - **Implicit**: Used for mobile or web applications. Directly issues an access token without an authorization code.
   - **Resource Owner Password Credentials**: Used when the application has a high degree of trust. The user provides their credentials (username and password) directly to the application.
   - **Client Credentials**: Used when the client is acting on its own behalf. The application authenticates with the authorization server directly.

4. **Describe the current challenges of OAuth 2.0 implementation**:
   - **Challenges**:
     - **Security**: Ensuring secure transmission and storage of tokens.
     - **Complexity**: Implementing OAuth 2.0 correctly can be complex and error-prone.
     - **Token Expiry and Refresh**: Managing token expiration and refreshing tokens securely.
     - **Interoperability**: Ensuring compatibility between different implementations and services.

### Key Points

The OAuth 2.0 authorization code flow involves the following roles and components:

1. **Resource Owner (End User)**:
   - The user who owns the data or resources and grants access to them.

2. **Client Application**:
   - The application requesting access to the user's resources.

3. **Authorization Server**:
   - The server that authenticates the resource owner and issues access tokens to the client application.

4. **Resource Server and APIs**:
   - The server hosting the protected resources, capable of accepting and responding to protected resource requests using access tokens.

There are four grant types available in OAuth 2.0:

1. **Authorization Code**:
   - Suitable for server-side applications. It involves obtaining an authorization code which is then exchanged for an access token.

2. **Implicit**:
   - Used for public clients like single-page applications (SPA). Directly issues an access token, often considered less secure than the authorization code flow.

3. **Resource Owner Password Credentials**:
   - The resource owner provides their username and password directly to the client application, which then exchanges these credentials for an access token. Used when there is a high degree of trust between the resource owner and the client.

4. **Client Credentials**:
   - Used when the client application needs to access resources or perform actions on its own behalf rather than on behalf of a user. The client authenticates directly with the authorization server to obtain an access token.

## OpenID Connect
### 1. OpenID Connect as an Authentication Layer
**OpenID Connect** is a simple identity layer on top of the OAuth 2.0 protocol. It allows clients to verify the identity of an end-user based on the authentication performed by an Authorization Server, as well as to obtain basic profile information about the end-user in an interoperable and REST-like manner.

**Example:** When a user logs into a service like Spotify using their Google account, OpenID Connect allows Spotify to authenticate the user's identity through Google without needing the user's password. This process uses tokens (ID tokens specifically) issued by Google to confirm identity securely.

### 2. Identity as a Resource
In the context of OpenID Connect, **identity is treated as a resource**. This means that a user's identity information (like their username, email, or profile details) is considered a resource that can be accessed with the user's permission, typically through secure tokens.

**Example:** A third-party application (like a travel booking site) might request access to your email and basic profile to autofill your details. This access is granted after your consent and managed through tokens.

### 3. OpenID Connect's Authentication Flow
**Authentication Flow** refers to the steps involved in authenticating a user and providing the client application access to the user's identity data.

**Example of Authentication Flow:**
- **User requests to log in** using a social identity provider (like Facebook).
- **Client application redirects** to the identity provider.
- **User authenticates** themselves on the identity provider's page.
- The **identity provider issues an ID token and access token** to the client application.
- The client application **decodes the ID token** to verify the user's identity and can use the access token to retrieve user details.

### 4. General Specifications of the OpenID Connect Protocol Suite
**OpenID Connect Protocol Suite** is divided into three levels of implementation: **Minimal, Dynamic, and Complete**.
- **Minimal:** Basic ID token and user info endpoint functionality.
- **Dynamic:** Adds discovery and dynamic client registration capabilities.
- **Complete:** Includes session management and additional security features.

**Example of a Complete Implementation:**
A financial service application implementing OpenID Connect for secure transactions may use the complete suite to ensure robust security, session management, and dynamic client registrations, adapting to the varying needs of both the application and its users.

### Conclusion
Understanding these aspects of OpenID Connect helps in implementing secure and efficient user authentication systems that protect identities and provide seamless integration across different services. Each level of implementation in the protocol suite offers varying complexities and security features, suited for different use cases in applications.


# OAuth 2.0 Threats
The documents you provided outline various threat models associated with OAuth 2.0, a popular framework for authorization. Below, I will detail the different types of threat models mentioned and offer examples and recommendations for mitigating these threats.

### OAuth 2.0 Threat Models
#### 1. **Client Threat Models**
   **Examples**:
   - **Attacker obtaining client secrets**: This could happen if an attacker gains access to the source code where client secrets are hard-coded.
   - **Attacker obtaining access and refresh tokens**: This might occur via interception of tokens during transmission, especially over insecure networks.
   - **Phishing for credentials**: An attacker could spoof a login page to steal user credentials.
   - **Open redirection**: Manipulating the redirect URIs that are not correctly validated by the client, leading users to malicious websites.

   **Recommendation**: Implement robust application access control mechanisms and validate all redirection URIs to prevent unauthorized access and redirects.

#### 2. **Endpoint Threat Models**
   **Examples**:
   - **Phishing by counterfeit authorization server**: An attacker mimics a legitimate authorization server to steal credentials.
   - **Interception of traffic to resource server**: Attackers might intercept sensitive data by compromising network security.
   - **Malicious client obtains existing authorization**: An attacker uses fraudulent means to gain access to tokens or secrets.
   - **Open redirection**: Similar to client threat models, this involves redirecting users to unintended and potentially harmful destinations.

   **Recommendation**: Use technologies such as Certificate Pinning and Proof Key for Code Exchange (PKCE) to enhance security.

#### 3. **Token Threat Models**
   **Examples**:
   - **Eavesdropping access tokens**: Interception of tokens during transmission over insecure connections.
   - **Obtaining access tokens from authorization server database**: An attacker could breach the database storing these tokens.
   - **Disclosure of client credentials during transmission**: Unsecured transmission can expose client secrets.
   - **Obtaining client secret by online guessing**: Poor security practices might allow attackers to guess secrets.

   **Recommendation**: Implement Token Binding and enhance database security to protect tokens and secrets.

### Additional Measures and Resources

The documents also suggest multiple RFCs (Request for Comments) which are technical documents used by the engineering and computer science communities to define protocols, processes, and methodologies for the Internet. These include:

- **RFC 6819** - Provides a thorough analysis of threat models specific to OAuth 2.0.
- **RFC 7591** - Discusses dynamic client registration which can mitigate some threats by automating the client registration process securely.
- **RFC 7636** - Describes PKCE, which enhances the security of OAuth 2.0 by preventing interception of the authorization code.

These documents are part of an essential body of knowledge that helps define secure implementations of OAuth 2.0 and are useful for developers and security professionals looking to enhance the security of their applications.

In practice, setting up OAuth securely involves understanding these threat models and actively implementing the recommendations. For example, using secure connections (HTTPS), regularly rotating secrets, and employing additional security measures like two-factor authentication can significantly reduce the risk of these threats. Monitoring and regularly updating the security practices in line with new findings and exploits are also crucial.