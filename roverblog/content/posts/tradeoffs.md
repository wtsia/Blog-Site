+++
author = "Winston Tsia"
authorlink = ""
title = "Scalability: Tradeoffs"
description = "Scalability topics covering tradoffs"
tags = [
    "Tradeoffs"
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

# Performance vs Scalability
- Scalable: if performance is proportional to resources added
- can be serving more units or larger units
- Performance problem: slow for 1 user
- Scalability problem: fast for 1 user but slow under load
- Achieving good scalability is possible if we architect and engineer our systems to take scalability into account, account for redundancy, and how one should handle heterogeneity.

#### Summary:
Determining how to trade performance or scalability comes down to good planning

### Scalability Patterns
- Scale up vs Scale out (for load?)
    - immutability as default
    - Referential Transparency
    - Laziness
    - Different data needs different guarantees
    - tradeoffs:
        - no free lunch

### Latency vs Thoroughput
- Latency is time to perform an action, or result
- Throughput is number of actions/results per unit of time
- aim: max throughput, acceptable latency
    - memory bandwidth sometimes used to specify throughput of memory systems

>Summary: increase actions/results per time at acceptable performance

### Availability vs consistency
- CAP Theorem: Consistency, Availability, Partition Tolerance. Theorem states in a distributed computer system, you can only support two of the guarantees from CAP.
    - Consistency: every read receives the most recent write or an error
    - Availability: every req receives a response, without guarantee that it contains the most recent version of information
    - Partition Tolerance: The system continues to operate despite arbitrary partitioning due to network failures
    - Networks arent reliable, so support partition tolerance, and tradeoff between consistency and availability 
        - $CP$ - consistency partition tolerance
            - good for business requiring atomic reads and writes
        - $AP$ - availability and partition tolerance
            - responds with most readily available version of data available on any node (may not be latest)
            - good for business needs eventual consistency or continued function despite external errors

>Summary: CAP Theorem, Consistence, Availability, and Partition Tolerance, where common patterns are CP, consistency part for atomic reads and writes, or AP availability part which responds with most readily available ver of data on any node, which is good for eventual consistency or function during external errors.

### Consistency Patterns
Now we are faced with options on how to synchronize them so clients have a consistent view of data.

- Weak Consistency: reads may or may not see a write. best effort approach is taken i.e. in systems like memcached. 
    - use cases in VoIP, Video Chat, Realtime multiplayer games.
- Eventual consistency: reads will eventually see a write (ms), and data is replicated asynchronously.
    - useful for DNS, email, high available systems
- Strong consistency: after write, read will see it, data is replicated synchronously
    - used in file systems like RDBMSes, or systems that need transactions

>Summary: Weak, Eventual, and Strong differ by how accurately a write will be able to be be seen by a read, where Strong will have reads able to read writes right after execution, and goes in example ranking weakest to strongest from Video Chat, to email, to file systems.

### Availability Patterns
2 complementary patterns: fail-over and replication

- Fail-over: 
    - Active-passive: AP FO, heartbeats are sent between active and passive servers on standby. Upon interruption, the passive server takes the active IP address and takes over
        - master-slave failover
    - Active-active: both servers managin traffic, spreading load. 
        - public facing servers require DNS know about public IPs of both. 
        - Internal facing, app logic needs to know both servers.
        - master-master failover
    - Disadvantages: adds more hardware and complexity, and potential loss of data if active fails before new writes can be replicated to passive
- Replication
    - master-slave, master-master
- Availability in numbers - quantified by uptime/downtime as a % of time service is available
    - measured in units of $9s$, 99.99% availability is 4 9s
        - ${ 9, 99, 999, ...} = { 9*(10^0), 9(10^1 + 10^0), 9(10^2 + 10^1 + 10^0), ...}$
        - for $n > 0$, $n$ 9s is represented by $9(10^n + 10^n-1 + ... + 10^0)$
- Availability in parallel vs in sequence
    - a service depending on multiple components prone to failure has availability dependent on in sequence or in parallel
    - In Sequence
        - availability decreases when:
        `Availability (Total) = Availability (Foo) * Availability (Bar)`
    - In parallel
        - availability decreases when: 
        `Availability (Total) = 1 - (1 - Availability (Foo)) * (1 - Availability (Bar))`