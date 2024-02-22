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
- [Content Review](#content-review)
    - [**CSMA/CD**](#csmacd)
  - [Guide Questions](#guide-questions)
    - [**Sin wave, Frequency, and Wavelength**](#sin-wave-frequency-and-wavelength)
    - [**Amplitude, Period, and Frequency, and Wavelength**](#amplitude-period-and-frequency-and-wavelength)
    - [**Hamming Code, and Finding the Hamming Code for 4 Bits**](#hamming-code-and-finding-the-hamming-code-for-4-bits)
- [Devices](#devices)
  - [Hub vs Switch vs Router](#hub-vs-switch-vs-router)
  - [Default Gateway](#default-gateway)
    - [Subnet Mask](#subnet-mask)
- [Content Review 2](#content-review-2)
- [Programming](#programming)
  - [Commands](#commands)
- [Summary of Notes](#summary-of-notes)
# Networks: An Introduction
- Why layers are used in Computer Networks
- 7 layers of OSI, describe each layer
## Introduction
- Layers: (1) physical, (2) data link, medium access control (MAC, sublayer), (3) network, (4) transport, (5) session, (6) presentation, (7) application
- parity is used to verify if information is correctly received--i.e. a 1 is added to `0100 0001` to make 'A' an 'odd parity'
- *communication protocol*: agreement/rule 
### **OSI**
| Layer | Name                    | Description                                                                                          |
|-------|-------------------------|------------------------------------------------------------------------------------------------------|
| 7     | Application Layer       | Provides network services directly to end-users or applications. It includes protocols like HTTP, SMTP, and FTP. |
| 6     | Presentation Layer      | Responsible for data translation, encryption, and compression. It ensures that data is presented in a format that the application layer can understand. |
| 5     | Session Layer           | Manages communication sessions between applications, including establishing, maintaining, and terminating connections. |
| 4     | Transport Layer         | Ensures reliable data transfer between hosts. It manages flow control, error correction, and segmentation of data. Protocols include TCP and UDP. |
| 3     | Network Layer           | Handles logical addressing and routing of data packets between different networks. IP is the primary protocol at this layer. |
| 2     | Data Link Layer         | Responsible for the physical addressing of data packets and the transmission of data frames within a single network segment. Ethernet and Wi-Fi are examples of data link layer protocols. |
| 1     | Physical Layer          | Deals with the physical transmission of data over the network medium. It includes specifications for cables, connectors, and other hardware components. |

Open System Interconnect (by International Standard Organization, or ISO):

1. Physical Layer: This layer is responsible for the physical transmission of data between devices, including the electrical, mechanical, and physical specifications of the physical medium.

2. Data Link Layer: This layer is responsible for the reliable transmission of data between devices on the same network, including error detection and correction, flow control, and access to the physical layer. Examples of protocols operating at this layer include Ethernet, Point-to-Point Protocol (PPP), and Wi-Fi.

3. Network Layer: This layer is responsible for the logical addressing and routing of data between devices on different networks, including network addressing, packet forwarding, and congestion control.

4. Transport Layer: This layer is responsible for the end-to-end transmission of data between devices, including segmentation, flow control, error recovery, and reassembly. Prominent protocols operating at this layer include Transmission Control Protocol (TCP) and User Datagram Protocol (UDP).

5. Session Layer: This layer is responsible for establishing, managing, and terminating communication sessions between devices, including authentication, authorization, and accounting.

6. Presentation Layer: This layer is responsible for the translation of data between the application layer and the lower layers, including data compression, encryption, and decryption.

7. Application Layer: This layer is responsible for providing services to user applications, including protocols such as HTTP, FTP, SMTP, and DNS.

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
Binary: `1, 0` -> Hex: `1, 0, A-F`
- `0000` -> `0`
- `1111` -> `F`
- Order of binary: `0000, 0001, 0010, 0011, 0100, 0101, 0110, 0111, ...`

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


# Content Review
**Seven layers of OSI and the function of each layer**

>(1) physical, (2) data link, medium access control (MAC, sublayer), (3) network, (4) transport, (5) session, (6) presentation, (7) application

**Sine waves (amplitude, phase, frequency and period), composite signals**

> Sine waves are fundamental waveforms in signal processing and represent a smooth, periodic oscillation. They are characterized by their amplitude, phase, frequency, and period.
> 
> **Amplitude**:
The amplitude of a sine wave represents the maximum displacement or height of the waveform from its center or equilibrium position. It indicates the strength or intensity of the signal and is typically measured in units such as volts (V) or decibels (dB).
> 
> **Phase**:
> The phase of a sine wave determines its position within a complete cycle. It represents the fraction of the cycle that has elapsed from a reference point. The phase is often measured in degrees or radians. A phase shift refers to a change in the starting point or timing of a waveform relative to a reference.
> 
> **Frequency**:
> The frequency of a sine wave indicates the number of complete cycles or oscillations that occur per unit of time. It is measured in hertz (Hz) and represents the rate of change of the waveform. A higher frequency corresponds to a greater number of cycles per unit of time.
> 
> **Period**:
> The period of a sine wave is the time it takes to complete one full cycle. It is the reciprocal of the frequency and is represented in units of time (e.g., seconds). The period and frequency are inversely related: a higher frequency corresponds to a shorter period, and vice versa.
> 
> **Composite signals**, also known as complex or compound signals, are formed by combining multiple individual signals of different frequencies, amplitudes, and phases. These individual signals are often sine waves, and their combination results in a complex waveform with a more intricate pattern. Composite signals can be created through techniques such as amplitude modulation (AM), frequency modulation (FM), or by adding together multiple sine waves with different frequencies and amplitudes.
> 
> **Composite signals** are commonly encountered in various fields, including telecommunications, audio processing, and radio frequency (RF) engineering. By analyzing composite signals, one can examine the different frequency components present and understand how they contribute to the overall signal's characteristics.

Know how hamming code works and how we can add redundant bits for hamming

### **CSMA/CD**
> CSMA/CD (Carrier Sense Multiple Access with Collision Detection) is a protocol used in Ethernet networks to regulate access to the network medium and handle collisions that may occur when multiple devices attempt to transmit data simultaneously. CSMA/CD is specifically designed for half-duplex Ethernet networks, where devices can either transmit or receive data but not both simultaneously.
> 
> Here's how CSMA/CD works:
> 
> **Carrier Sense (CS)**:
Before transmitting data, a device using CSMA/CD listens to the network medium to check if it is idle (no other device is currently transmitting). If the medium is sensed as busy, the device waits for it to become idle before attempting to transmit.
> 
> **Multiple Access (MA)**:
Once the medium is determined to be idle, the device can start transmitting its data.
> 
> **Collision Detection (CD)**:
While transmitting, the device continuously monitors the medium to detect if a collision occurs. A collision happens when two or more devices start transmitting at the same time, causing their signals to interfere with each other and resulting in garbled data.
>
> **Collision Handling**:
When a device detects a collision, it immediately stops transmitting and sends a jam signal to notify other devices on the network about the collision. The devices that initiated the collision then enter a backoff period, during which they wait for a random amount of time before attempting to retransmit.
> 
> The purpose of CSMA/CD is to ensure fair and efficient access to the network medium in shared Ethernet networks. By sensing the medium before transmitting, devices can minimize the chances of collisions. However, if collisions do occur, CD allows for their detection and subsequent handling to prevent data corruption.
> 
> It's worth noting that CSMA/CD is primarily used in legacy Ethernet networks operating at lower speeds, such as 10 Mbps and 100 Mbps. Higher-speed Ethernet networks, such as Gigabit Ethernet, utilize full-duplex communication and employ different protocols, such as CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance), which is used in switched Ethernet networks.

Know how CRC technique works and how we add redundant bits and the number of redundant bits that we add.

The type of transmission impairments and cause of them

Signal power and meaning of db values

Frequency domain and how we know if a signal is periodic or nonperiodic.

Know bit rate

Broadband and baseband and know which signals are baseband and which are broadband.



## Guide Questions
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
>The time it takes to send out a given amount of bits can be calculated using the formula (number of bits divided by bitrate):
>$$
Time = |Bits| / Bitrate
$$

Difference between baseband and broadband
>Baseband refers to a signal that has not been modulated to a higher frequency. Broadband refers to a signal that has been modulated to a higher frequency, allowing multiple signals to be transmitted over the same channel simultaneously.
### **Sin wave, Frequency, and Wavelength**

Calculate a sinewave phase in degrees or radians given  the cycle’s offset
>The phase of a sine wave can be calculated using the formula:
>$$
Phase = (Cycle_{offset} / Cycle_{length}) * 2π
$$
>where the cycle offset is the time from the beginning of a cycle to a specific point on the wave, and the cycle length is the time it takes for the wave to complete one full cycle.

Know the relationship between wavelength and frequency
>The relationship between wavelength and frequency can be expressed as:
>$$
Wavelength = \frac{propogation_{speed}}{frequency}
$$
>or:
>$$
\lambda = \frac{c}{f}
$$
>where $c$ is the speed of light is approximately $3*10^8$ meters per second.

What are the x and y axis of the time domain and units regularly used
>The x-axis of the time domain is time, measured in seconds. The y-axis is the amplitude of the signal, measured in volts. The **x axis is time (unit second). The y axis is amplitude (unit volt)**

What are the x and y axis of the frequency domain
>The x-axis of the frequency domain is frequency, measured in hertz. The y-axis is the amplitude of the signal, measured in volts. **The x axis is frequency (unit hertz). The y axis is amplitude (unit volt)**

If we add two periodic sine waves, is the result periodic? Is this a composite signal?
>The result of adding two periodic sine waves is periodic if the two waves have a fundamental frequency that is a multiple of each other. The resulting signal is a composite signal, which is composed of multiple frequencies.

Knowing only the amplitude and frequency of these waves, draw the frequency domain graph
>The frequency domain graph will show the amplitude of each frequency component of the signal as a function of frequency. The graph will have a peak at the frequency of the sine wave,

Know the relation between highest, lowest frequency and the bandwidth of a signal
>The bandwidth of a signal is defined as the difference between the highest and lowest frequencies in the signal. In other words, it is the range of frequencies that a signal occupies. Bandwidth is usually measured in Hertz (Hz).

A periodic signal bandwidth is given to have a bandwidth of 20 Hz, select the frequency response among several given – what are the main things you look for to make your decision?
>To select the frequency response among several given options, you would need to find the range of frequencies that the periodic signal occupies, which is equal to its bandwidth. You would then select the frequency response that includes this range of frequencies.

Most digital signals are periodic or non-periodic?
>Most digital signals are non-periodic. Unlike analog signals, which are continuous and can be periodic or non-periodic, digital signals are discrete and do not have a continuous waveform. Therefore, they are typically non-periodic.

Appropriate characteristics for analog signals
>The appropriate characteristics for analog signals include amplitude, frequency, phase, and wavelength. These characteristics describe the physical properties of the analog signal, such as its strength, the number of cycles per second, the position of a particular point on the wave, and the distance between corresponding points on the wave.

### **Amplitude, Period, and Frequency, and Wavelength**
>Amplitude, or peak amplitude, is the absolute value of its highest intensity proportional to the energy it carries. **Period** is the amount of time a signal needs to complete one cycle, and **frequency** is the number of periods in 1s. **Wavelength** is propogation speed times *period*, or divided by *frequency*. 

Appropriate characteristics for digital signals
>The appropriate characteristics for digital signals include **bit rate**, which is the number of bits transmitted per unit time, and **bit length**, which is the distance a bit travels during one clock cycle. Unlike analog signals, which are continuous, digital signals are made up of discrete bits that are transmitted sequentially.

Why rather than frequency we use bit rate for digital signals
>Frequency and bit rate are both important parameters for digital signals, but they represent different aspects of the signal. Frequency represents the number of cycles per second of a periodic waveform, while bit rate represents the number of bits transmitted per second in a digital communication system.

>In digital communication systems, bit rate is a more useful parameter to use than frequency because it directly determines the amount of data that can be transmitted in a given amount of time. Higher bit rates mean more data can be transmitted in a given amount of time, which is important for applications such as video streaming and file transfer. Additionally, bit rate can be more easily controlled and adjusted in digital communication systems than frequency, making it a more practical parameter to use.

How do we express bit rates? Bps
>We express bit rates in bits per second (bps). This is a measure of how many bits can be transmitted in one second.

What is bit length (we used wave length for analog signals)
>Bit length is the distance a bit travels during one clock cycle. It is calculated by multiplying the propagation speed of the signal by the bit duration.
>$$
Bit\space length = Propagation \space speed * bit \space duration
$$

A signal is passing through a wire, the wire gets warm, it means the signal ____________.
>If a signal passing through a wire causes the wire to get warm, it means that the signal has lost energy and has been attenuated.

How can we bring the signal back to its original shape? 
>Amplifiers

How does engineers show the signal has lost or gained strength?
>Engineers show that a signal has lost or gained strength by using decibels (dB). The decibel is a logarithmic unit that expresses the ratio of the power of the output signal to the power of the input signal.

Using dB = 10 log (p2 / p1)
>Decibels (dB) are a logarithmic unit of measurement commonly used in the field of signal processing and communications. The formula dB = 10 log (p2 / p1) is used to calculate the ratio of power between two signals, p1 and p2, in decibels.

>In digital communication systems, this formula is often used to express the signal-to-noise ratio (SNR) of a signal. SNR is a measure of the strength of the signal compared to the background noise, and is an important factor in determining the quality of the received signal. By using the dB scale, small changes in SNR can be easily represented and compared.

Given a generator polynomial and a pattern, find the redundant bits
>To find the redundant bits in a pattern using a generator polynomial, you would perform polynomial division of the pattern by the generator polynomial. The remainder would then be the redundant bits.

### **Hamming Code, and Finding the Hamming Code for 4 Bits**
> The basic idea behind Hamming code is to add parity bits at specific positions within a data word. These parity bits provide redundancy that enables error detection and correction. The position of the parity bits is determined by powers of $2,$ with each bit responsible for checking a specific subset of data bits.
> Here's a simplified explanation of how Hamming code works:
> 
> **Data Encoding**:
Let's say we have a data word of n bits. The number of parity bits (r) is determined by the formula $2^r \geq n + r + 1$. The parity bits are inserted at positions that are powers of $2,$ leaving the remaining positions for the data bits.
> 
> **Parity Bit Calculation**:
> Each parity bit calculates its value based on the data bits it covers. For example, the parity bit at position $2^0$ (the least significant bit) checks all bits that have a "1" in their binary representation at this position. The parity bit at position $2^1$ checks every second bit, the one at $2^2$ checks every fourth bit, and so on. The calculated parity bit value is set to ensure that the total number of "1" bits (including the parity bit itself) in the covered positions is either odd or even, depending on the parity scheme being used (odd parity or even parity).
> 
> **Error Detection and Correction**:
> During transmission or storage, if an error occurs and flips a bit, the parity bits can be used to detect and correct the error. By recalculating the parity bits from the received data and comparing them to the received parity bits, errors can be identified. If an error is detected, the position of the erroneous bit can be determined based on the parity bits and corrected.
> Hamming code is capable of detecting and correcting single-bit errors. However, it is not designed to handle multiple or burst errors efficiently. More advanced error-correcting codes, such as Reed-Solomon codes, are used for more robust error correction in scenarios with higher error rates.
>
>*The Hamming code for 4 bits* is a binary code that adds 3 redundant bits to the original 4 bits to create a code word of 7 bits. The code is designed to detect and correct errors in the transmission of the code word. The specific code for the 4 bits would depend on the particular algorithm used to generate the Hamming code.

Cyclic Redundancy Coding -- Know how to add extra bits and do the dividing to find the remainder
>Cyclic redundancy coding (CRC) is a type of error-detecting code commonly used in digital communication systems to detect errors in data transmission. The basic idea behind CRC is to add a few extra bits to the data being transmitted, which are then used to detect and correct errors in the data.

>To add extra bits, a polynomial is generated using the data bits and a predetermined divisor. The polynomial is then divided by the divisor using a modulo-2 division algorithm, resulting in a remainder. This remainder is appended to the data as a CRC code, which can be transmitted along with the data. The receiver can then perform the same polynomial division using the received data and the same divisor to obtain a remainder. If the remainder obtained by the receiver is zero, it indicates that the data has not been corrupted during transmission. If the remainder is non-zero, it indicates that an error has occurred, and the data needs to be retransmitted

# Devices
## Hub vs Switch vs Router
Switch may be considered an intelligent hub, and both are used to form networks. Whereas a router over the internet connects networks. Interestingly, both switches and routers operate at the 2nd and 3rd layer of the OSI model, or Data-link and Network layer. 

## Default Gateway
The  
### Subnet Mask

`255.255.255.0`: implies the `255` occupied sets are *network* addresses. The latter (`0`) is *host*
- ex: `192.168.0.1` $\rArr$ `192.168.0` (`network`) `.1`(`host`) 

# Content Review 2
IP layer header -- know the reason for each field of IP header
> The header contains transfer information (in bits). This includes **Version (4), Header Length (4), Type of Service (8), Total Length (16), Identification (16), Flags (3), Fragment Offset (13), Time to Live (8), Protocol(8), Header Checksum (16), Source IP (32), Destination IP (32), Options (variable).** 

IP checksum -- what does checksum do?
> **IP checksum** uses two's complement addition to check errors. Calculations are made at the sender and destination, and if the same, passes the error check. 

Fragmentation -- the fields of IP used for fragmentation and why packets are fragmented.
> Breaking up packets into smaller packets. Uses: **Total Length, Identification, Flags, and Fragment Offset.** Under fragmentation, the header is copied to fragments and (a) Total length is updated (b) Flag field updated to show which is the last fragment (c) Fragment Offset updated to reflect offset relative to the start of the OG packet.

IP address and class-A, class-B and class-C
> Classes are divided into ranges of IP addresses. A, B, and C are used by devices on the internet. 
> 
> **A**: Large no. of hosts ($(2^8)^3 =$ 16,777,214), 126 networks, from 1to 127. 1.0.0.0 to 127.0.0.0
>
> **B**: Medium no. of hosts ($(2^8)^2=$ 65,534) Allows for 16,384 networks. From 128.0.0.0 to 191.255.0.0.
>
> **C**: Small number of hosts. Allows for 2,097,150 networks. From 192.0.0.0 to 223.255.255.0.

Subnetting -- given a range of IP addresses know how to subnet a given network.
> The subnet mask defines the network address under `255`. If a field is `255`, it is part of the network address. `255.255.255.0` means the host IP range is 0 to 255 for i.e. `192.168.0.1`$\rarr$`192.168.0.255`

Know the difference between hub, switch and router.
> Switch is an intelligent hub, that can send packets to its intended recipient. Routers may act as default gateways and connects networks as well as directs packets to its destination.

Flooding, distance vector routing
> **Flooding**: data packets are sent to all outgoing links except received. (*Uncontrolled*: to all neighbors, *Controlled*: Sequence Number Controlled Flooding--SNCP)
>
> **Distance Vector Routing** (Bellman-Ford algorithm): Calculates best route based on distance or hops. Given by:
>$$ d_x(y) = min_v\{c(x,v) + d_v(y)\}$$
>
> Where:
> 
> $d_x(y)$ = The least distance from x to y
> 
> $c(x,v)$ = Node x's cost from each of its neighbor v
> 
> $d_v(y)$ = distance to each node from intial node
> 
> $min_v$ = selecting shortest distance

What is the problem of distance vector routing, what is the count to infinity problem?
> If a node goes offline, and other nodes are not immediately aware. Then packets are still sent through the node believing it is reachable. The distance to that node keeps increasing in the routing tables (to infinity) until hitting a max.

What do we mean by hierarchy routing?
> network is divided into multiple levels or tiers of routers.
> It goes from:
> 
> "core routers" $\rarr$ "edge routers"
>
> This design allows for specialized routing protocols at each level of the hierarchy and can be optimized for needs. 

# Programming
## Commands
```
traceroute
```
Output of `man traceroute`:
```
DESCRIPTION

traceroute tracks the route packets taken from an IP network on their way to a given host. It utilizes the IP protocol's time to live (TTL) field and attempts to  elicit an ICMP TIME_EXCEEDED response from each gateway along the path to the host.
```

# Summary of Notes
Seven layers of [**OSI**](#osi) and the function of each layer
> The 7 Layers of OSI are as follows:
> (P D N T S P A -> All People Seem To Need Data processing)
> 1. Physical
> 2. Data Link
> 3. Network
> 4. Transport
> 5. Session
> 6. Presentation
> 7. Application

Sine waves (amplitude, phase, frequency and period), composite signals
> [**Sin wave, Frequency, and Wavelength**](#sin-wave-frequency-and-wavelength)
> 
> $$
Frequency = 1/Period
$$
> [**Amplitude, Period, and Frequency, and Wavelength**](#amplitude-period-and-frequency-and-wavelength)
> $$
Phase = (Cycle_{offset} / Cycle_{length}) * 2π
$$

Know how hamming code works and how we can add redundant bits for hamming
> [**Hamming Code, and Finding the Hamming Code for 4 Bits**](#hamming-code-and-finding-the-hamming-code-for-4-bits)
 
Understand CSMA/CD and how it works.
> 

Know how CRC technique works and how we add redundant bits and the number of redundant bitsthat we add.

The type of transmission impairments and cause of them
Signal power and meaning of db values

Frequency domain and how we know if a signal is periodic or nonperiodic.

Know bit rate

Broadband and baseband and know which signals are baseband and which are broadband.

IP layer header -- know the reason for each field of IP header

IP checksum -- what does checksum do?

Fragmentation -- the fields of IP used for fragmentation and why packets are fragmented.

IP address and class-A, class-B and class-C

Subnetting -- given a range of IP addresses know how to subnet a given network.

Know the difference between hub, switch and router.

Flooding, distance vector routing

What is the problem of distance vector routing, what is the count to infinity problem

What do we mean by hierarchy routing?

What does TCP and UDP stands for?

What is the difference between connectionless and connection oriented in layer-4?

Know the header TCP source and destination ports, reason for sequence and acknowledgementfields, flags in the header.

Three way handshake of TCP connection

What is a socket?

Client and Server programming

ARP and DNS
