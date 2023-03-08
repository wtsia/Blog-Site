+++
author = "Winston Tsia"
authorlink = ""
title = "Networks"
description = "Scaling Networks"
tags = [
    "Scalability"
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
# Introduction
Introduction to networks and digital communications with a focus on Internet protocols: Application 
layer architectures (client/server, peer-to-peer) and protocols (HTTP-web, SMTP-mail, etc.), Transport 
layer operation: (reliable transport, congestion and flow control, UDP, TCP); Network layer operation - 
(routing, addressing, IPv4 and IPv6), Data Link layer operation (error detection/correction, access 
control, Ethernet, 802.11, PPP), Layer 2/3 protocols (ATM and MPLS); selected current topics such as: 
security, multimedia protocols, Quality of Service, mobility, wireless networking, emerging protocols, 
network management. 
# Content
- [Introduction](#introduction)
- [Content](#content)
- [Networks: An Introduction](#networks-an-introduction)
  - [Introduction](#introduction-1)
    - [**OSI**](#osi)
    - [Number Bases and Conversion](#number-bases-and-conversion)
      - [**Binary to Hex**](#binary-to-hex)
      - [**Binary to Decimal**](#binary-to-decimal)
      - [**Hex to Decimal**](#hex-to-decimal)
      - [**Decimal to Hex**](#decimal-to-hex)
- [DNS vs CDN](#dns-vs-cdn)
  - [Domain Name System (DNS)](#domain-name-system-dns)
  - [Content Delivery Network](#content-delivery-network)
    - [Push CDNs](#push-cdns)
    - [Pull CDNs](#pull-cdns)
    - [Disadvantages of CDNs:](#disadvantages-of-cdns)
- [Study Guide](#study-guide)
  - [Content Review:](#content-review)
  - [Study Guide Questions](#study-guide-questions)
# Networks: An Introduction
- Why layers are used in Computer Networks
- 7 layers of OSI, describe each layer
## Introduction
- Layers: (1) physical, (2) data link, medium access control (MAC, sublayer), (3) network, (4) transport, (5) session, (6) presentation, (7) application
- parity is used to verify if information is correctly received--i.e. a 1 is added to `0100 0001` to make 'A' an 'odd parity'
- *communication protocol*: agreement/rule 
### **OSI**
Open System Interconnect (by International Standard Organization, or ISO)
- Physical: sending bits via physical property i.e. voltage
- Data Link: CRC (different error detection), Hamming, Flow Control, sliding window, shared ethernet channel
  - MAC: bluetooth tech, RFID

### Number Bases and Conversion
- Base:
  - 2 - binary `0b`
  - 8 - octal `0o`
  - 10 - decimal `0d`
  - 16 - hex `0x`

`0x101` equivalent hex to decimal is: 

$$
1*16^2 + 0*16^1 + 1*16^0 = 256 + 0 + 1 = 257
$$

#### **Binary to Hex**
Binary: 1, 0 -> Hex: 1, 0, A-F
- 0000 -> 0
- 1111 -> F
- Order of binary: 0000, 0001, 0010, 0011, 0100, 0101, 0110, 0111, ...

#### **Binary to Decimal**
Convert to hex first

#### **Hex to Decimal**

#### **Decimal to Hex**

# DNS vs CDN
Domain Name System vs Content Delivery Network
## Domain Name System (DNS)
- work station sends request to ISP, ISP asks other servers for name system IP, then returns the IP address for the web address name so that the work station can connect to the site.
    - NS record (name server) - Specifies the DNS server for domain/subdomain
    - MX record (mail exchange) - specifies the mail servers for accepting messages
    - A Record (address) - Points a name to an IP address.
    - CNAME (canonical) - Points a name to another name or CNAME or to an A record.
- CloudFlare and Route53 provide managed DNS services.
- Methods of routing traffic:
    - Weighted Round Robin
        - pairs incoming request to a specific machine by cycling through a list of servers capable of handling the request.
        - Prevents traffic from going to servers under maintenance
        - balance between varying cluster sizes
        - A/B testing

    - Latency-based
        - serving based on region that provides the lowest latency
        - steps to use:
            - create latency records for resources in multiple regions
            - when Route 53 receives a DNS query for your domain/subdomain, then selects a latency record for that region. A response is given in the form of a value from the selected record i.e. IP address or a web server
        - example:
            - Suppose ELB load balancers in US West (Oregon) Region and in the Asia Pacific Region (Singapore). Example of when London enters name of your domain in the browser:
                - DNS routes query to Route 53 name server
                - Router 53 refers to its data on latency between London and Singapore and between London and Oregon region
                - If Latency is lower between London & Oregon regions, Route 53 gives query an IP for Oregon LB. If latency is lower between London and the Singapore region, R53 responds with IP for the singapore LB.
        - Latency between hosts can change bc of connectivity and routing, and routing is based on latency measuerements performed over a period of time. 
        - AWS Latency Routing: [link](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-latency)

>Summary: Domain names are stored in a server with an associated IP address. Record of a connection from X (user) to multiple Y databases are stored, and queries from X will have the load balancer will iterate through this record and respond with lowest latency Y database is relative to X.

- Geolocation-based:
    - responds with location that DNS queries originate from.
    - allows localizing content and present some/all language of users.
    - also allows for content restriction
    - can route users consistently to same end-point
    - priority goes to the smallest geographic regions
    - usage:
        - maps IP to locations
        - some not mapped, so Amazon R53 will recieve DNS queries from unidentified, and thus can create default record from IP not mapped to any location and queries from locations no geolocation records exist for. No default means R53 returns "no answer".
    - [link](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-geo)

>Summary: A record of locations (and default) are made to which DNS queries will be sent to nearest mapped geographies

- Disadvantages of DNS
    - Accessing introduces slight delay but mitigated by caching
    - Can be complex and is generally managed by governments, ISPs, and large companies.
    - Go under DDoS attacks

## Content Delivery Network
- CDN is a globally distributed network of proxy servers, serving content from locations closer to the user i.e. static files like HTML, CSS, JS, photos, or videos
- Pros:
    - Users may receive content from data centers close to them
    - Servers do not have to serve requests CDN fulfills

### Push CDNs
- receive new content when changes occur on server
- Provider managed, uploading and rewriting URLs to point to CDN, expiration, and update frequency. 
- Content uploading when new or changed minimizing traffic but maximizing storage
- Push is good for sites whose content isn't often updated 

### Pull CDNs
- grabs new content from server when the first user requests content.
    - leave content on server and rewrite URLs to point to CDN
        - results in slow request until content is cached on CDN
    - time to live (TTL) determines caching duration.
- minimizes storage space on CDN but can create redundant traffic if files expire and are pulled before changes.

### Disadvantages of CDNs:
- CDN costs may be significant dependent on traffic,but should be analyzed by opportunity cost. 
- Content may be stale if updated before TTL expires it
- CDNs require changing URLs for static content to point to the CDN

>Summary: Push CDNs are good for sites that doesn't update content frequently, Pull CDNs for cites that need to update frequently. CDNs involve changing URLs for content to point to the CDN.


# Study Guide
## Content Review:
Seven layers of OSI and the function of each layer

>(1) physical, (2) data link, medium access control (MAC, sublayer), (3) network, (4) transport, (5) session, (6) presentation, (7) application

Sine waves (amplitude, phase, frequency and period), composite signals
>

Know how hamming code works and how we can add redundant bits for hamming

Understand CSMA/CD and how it works.

Know how CRC technique works and how we add redundant bits and the number of redundant bits that we add.

The type of transmission impairments and cause of them

Signal power and meaning of db values

Frequency domain and how we know if a signal is periodic or nonperiodic.

Know bit rate

Broadband and baseband and know which signals are baseband and which are broadband.



## Study Guide Questions
Know the relation between frequency and period
>$$
Frequency = 1/Period
$$

Given the bandwidth of the channel and size of the frame, calculate the transmission time
>$$
Transmission_{time} = Frame_{size} / Bandwidth_{channel}
$$

Given the bandwidth and signal to noise ratio, calculate the maximum data rate supported by the line

>Noiseless, use **Nyquist bit rate**, for $L =$ number of signal levels used to represent data:
>$$
BitRate = 2*bandwidth*log_2L
$$

>**Shannon-Hartley theorem (Shannon Capacity)**: maximum data rate (aka. Capacity, in bits per second) that can be transmitted over a channel is proportional to the bandwidth and the logarithm of the signal to noise ratio
>$$
Capacity = bandwidth*log_2(1 + SNR)
$$

Given the original power of the signal and the attenuation of the signal at the output, calculate the power at the output

>The power of a signal at the output can be calculated using the formula:
>$$
Power_{output} = Power_{input}*(10^{-Attenuation/10})
$$
>where Attenuation is measured in decibels (dB).

Given the rate that the signal sends out bits, calculate the time it takes to send out a given amount of bits.

Difference between baseband and broadband

Calculate a sinewave phase in degrees or radians given  the cycle’s offset

Know the relationship between wavelength and frequency

What are the x and y axis of the time domain and units regularly used

The x axis is time (unit second)

The y axis is amplitude (unit volt)

What are the x and y axis of the frequency domain

The x axis is frequency (unit hertz)

The y axis is amplitude (unit volt)

If we add two periodic sine waves:

Is the result periodic?

Is this a composite signal?

Knowing only the amplitude and frequency of these waves, draw the frequency domain graph

Know the relation between highest, lowest frequency and the bandwidth of a signal

A periodic signal bandwidth is given to have a bandwidth of 20 Hz, select the frequency response among several given – what are the main things you look for to make your decision?

Most digital signals are periodic or non-periodic?

Appropriate characteristics for analog signals

Amplitude, Frequency, phase and wave length

Appropriate characteristics for digital signals

Rather than frequency we use bit rate for digital signals

How do we express bit rates? Bps

What is bit length (we used wave length for analog signals)

Bit length = Propagation speed x bit duration

A signal is passing through a wire, the wire gets warm, it means the signal ____________.

(has lost energy and got attenuated)

How can we bring the signal back to its original shape? Amplifiers

How does engineers show the signal has lost or gained strength?

Use dB = 10 log (p2 / p1)

Given a generator polynomial and a pattern, find the redundant bits

Find the hamming code for 4 bits

Cyclic Redundancy Coding -- Know how to add extra bits and do the dividing to find the remainder
    