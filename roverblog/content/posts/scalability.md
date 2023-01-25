+++
author = "Winston Tsia"
authorlink = ""
title = "Scalability"
description = "Topics covering scalability of systems"
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
# Contents
- [Contents](#contents)
- [Scalability: A Summary](#scalability-asummary)
    - [Vertical Scaling:](#vertical-scaling)
    - [Horizontal Scaling:](#horizontal-scaling)
    - [Load Balancer: Introduction](#load-balancer-introduction)
      - [Load Balancing:](#load-balancing)
        - [Caching:](#caching)
    - [Building a Network](#building-a-network)
    - [Security](#security)
- [Scalability for Dummies: Notes](#scalability-for-dummies-notes)
  - [Clones](#clones)
  - [Database](#database)
      - [Path 1:](#path-1)
      - [Path 2:](#path-2)
  - [Cache](#cache)
      - [Cached Dataase Queries](#cached-dataase-queries)
      - [Cached Objects](#cached-objects)
  - [Asynchronism](#asynchronism)
    - [Paradigms of Asynchronism:](#paradigms-of-asynchronism)
      - [Async #1](#async-1)
      - [Async #2](#async-2)
- [Google I/O 2009 - Transactions Across Datacenters..](#google-io-2009---transactions-across-datacenters)
    - [Context](#context)
      - [Weak Consistency](#weak-consistency)
      - [Eventual Consistency](#eventual-consistency)
      - [Strong Consistency](#strong-consistency)
      - [Why Transactions?](#why-transactions)
      - [Across Datacenters](#across-datacenters)
      - [Multihoming](#multihoming)
      - [Techniques and Tradeoffs](#techniques-and-tradeoffs)
        - [Backups](#backups)
        - [Master/Slave Replication](#masterslave-replication)
        - [Master/Master Replication](#mastermaster-replication)
        - [Tree Replication](#tree-replication)
        - [Buddy Replication](#buddy-replication)
        - [2PC, Two Phase Commit](#2pc-two-phase-commit)
        - [Paxos](#paxos)
    - [Slides Notes](#slides-notes)
# Scalability: A Summary
[CS75 (Summer 2012) Lecture 9 Scalability Harvard Web Development David Malan](https://www.youtube.com/watch?v=-W9F__D3oY4)

[Scalability Slides](https://www.slideshare.net/jboner/scalability-availability-stability-patterns/)

Qualities to look for in a hosting website: SFTP, caution of 'unlimited' offers

VPS: Virtual Private Server (Like AWS), A virtual private server is a virtual machine sold as a service by an Internet hosting service

### Vertical Scaling: 
Running low on ram, increase processing and throw resources at the problem
    - shortcoming: real world constraints

- CPU - Cores --> Threads, etc..

- More resources means chopping servers into smaller VPS'

- SAS: drives spin at over 7200 RPM at 15000 (2012), stores in bits

- SSD: electronic storage

### Horizontal Scaling:
Running on many, slower machines instead of one fast machine
    - 

### Load Balancer: Introduction
- Distribute client requests to computing resources, i.e. app servers and db. Each case, LB returns response from computing resource to appropriate client.
- effective usage: prevent directing to unhealthy servers, preventing overloading, eliminating single points of failure.

#### Load Balancing:
- distributes traffic from clients among servers
- What IP address should we return when a client enters a website address
    - can return via the load balancer instead of DNS returning server #
- Private IPs are localized and not seen by the public

- How does a load balancer decide what data to get from the backend servers?
    - can make dedicated headed servers or scale to identical codebases across servers
    - How do we determine which server has unused processing power?
        - use a DNS that does a 'Round Robin'
            - problem with RR: can send heavy load users to the same servers by bad luck
- BIND: Berkley Internet Name Daemon
    - www. in a 64.131.79.131....132...

- Caching issues: powerusers can still put heavy load on a single server

- How to solve the problem: Sessions typically implemented per server, you can't use RR, cant use true load balancing
    - i.e. user Alice being able to keep sessions in server 1 over and over to be useful
- What if you turn the load balancer into a server that stores sessions? Well what if it dies? What are the redundancies?
    - Instead, we can use RAID, Redundant Array of Independent Disks
        - RAID0,1,...10..
            - RAID0: typically 2 identical harddrives and 'stripe' data across them by writing alternating across both drives
            - RAID1: storing a mirrored file in 2 drives simultaneously, one drive can die but the other can still work
            -RAID10: typically 4 drives and both RAID0-1
            -RAID5,6: variations, RAID5 can have 3-4-5 drives but only 1 for redundancies. Better economy of scale with redundancies. RAID6: two drives for redundancies
        - Allows redundancies within a server
- Sticky Sessions
    - Shared Storage?
        - FC, iSCSI, MySQL, NFS, etc
    - Cookies?
        - Can store server ID in the cookie and send a user to a server
            - downside: what if IP changes? No need to show backend IPs
                - Can store key and have load balancer remember how to decode server id, and takes away ability to spoof cookie
- Problem: Downtime?
    - Mitigating risk of file server going down? A: replication

Load Balancers:
- Software
    - ELB, HAProxy, LVS, ...
- Hardware
    - Barracude, Cisco, Citrix, F5, ...

- PHP: get a bad wrap for performance since its not a compiling language like C++. However:
    - PHP Accelerator: allows keeping PHP op-codes so compiled results dont get thrown away
        - similar to python, .py and .pyc

##### Caching:
- .html, MySQL, Query Cache
- Craigslist, throws back an .html page
    - advantage: if storing .html, dont have to regenerate it everytime. 
    - disadvantage: changing aesthetics of the page is now non-trivial, requiring changes among 10s of thousands of files, so a massive find and replace/regeneration of those pages
        - redundancies exist, every page has the same tag
        - better performance over disk space

- MySQL Query Cache
- Memcached - memory cached
    - stores in RAM
    - What if you ran out of space on Memcached? What could you do?
        - Garbage collection

- MySQL offers Replication features
    - Master-slave, connected via network and get copies of every row in master db.
        - pro: can equally balance read load
        - con: if one dies, 
    - Master-Master
        - pro: can implement redundancies yourself

- Multi-tiered architecture
    - can have Load Balancer (LB) to Web servers to LB to MySQL slaves, where master sends to slaves
    - multiple LBs, can send packets between LBs and if one goes down, takes control of incoming packets, or passive takes over active LB.

### Building a Network
- want property of sticky sessions
- to ensure saving the session, have the LB insert a cookie that allows it to remember the user is in server 1
- stick db on web server itself
- persistent actions aren't saved in other servers unless LB sends the user to the same server
- in this example, LB needs to be done in code
- would be done with switches, so have 2 switches
- power goes out? 
- cloud computing: outsourcing security and db storage to a 'cloud' (ECA.. B.. C... elastic compute cloud)
- multiple data centers
- can do geography based LB, where req can be done at the DNS level

Datacenter 1:
2 LB --> 2 Web Servers --> another 2 LB --> 2 master databases, 2 switches

Datacenter 2:
2 LB --> 2 Web Servers --> another 2 LB --> 2 master databases, 2 switches

### Security
- Traffic: 
    - incoming users: want firewall that allows TCP 80, 443 (for SSL, http based URLs) connections
    - Offload SSL to LB or a special device and keep everything else encrypted
    - LB --> web server, TCP 80
    - LB --> DB, TCP 3306
        - why separate encryptions? You should have **principle of least privilege**, so people cannot query db directly.

> Summary: 
As soon as you have too many users, new problems arise


# Scalability for Dummies: Notes
## Clones
*Golden Rule of Scalability*: every server contains exactly the same codebase and does not store any user-related data, like sessions or  profile pictures, on local disc or memory

- Sessions should be stored in centralized, accessible database or persistent cache like Redis (better perf. than external database, or db near the data center of app servers)

- In deployment, solving the issue of applying code changes to multiple servers can be solved by Capistrano (requires some learning esp if not into Ruby on Rails)

- When codebases are uniform, you can create an image (Amazon Machine Image for AWS) as a 'super clone' from which to draw from

> Summary: 
updating the codebase uniformly requires access to a central db or persistent cache, using a tool like Capistrano, then forming a 'super clone' to propogate further.

## Database
- Even with horizontal scaling, MySQL leads to slower performance and eventual breakdown.

There are two paths to solving this issue:

#### Path 1:
Stick to MySQL, hire a databse admin (DBA), do master-slave replication (slave -> master) and add RAM to master server.

DBA will use terms like 'sharding', 'denormalization', and 'SQL tuning'. 

#### Path 2:
denormalize from the beginning and include no Joins in any db query. Use MySQL as NoSQL if staying, or switch to an easier NoSQL i.e. MongoDB, CouchDB. Joins in app code (sooner the better). Even so, db requests will again be slower and slower and need a cache.

> Summary of 2 paths: 
(1) Use MySQL and apply master-slave replication and expanding RAM on the master server, and (2) remove joins in db query and convert the MySQL to a NoSQL in usage or migrate to MongoDB, CouchDB and place joins in app code.

## Cache
- Cache means in-memory caches like Memcached or Redis. Never do file-based caching, as it makes cloning and auto-scaling of servers a pain

- Is a simple key-value store and should reside as a buffering layer between app and data storage 

- 1st app should retrieve from cache, only then from the data source, since CACHE is fast and holds every dataset in RAM. 

> Summary: 
Cacheing is faster, but never do file-based. It is stored as a key-value between app and storage, and any query should first go down the chain from the cache, then and only then to the source.

2 data caching patterns:
#### Cached Dataase Queries
- Most common
- Query db, store result dataset in cache
- Hashed ver. of query is cache key
- issues: expiration, it is hard to delete cache if it is a complex query, and changing one table cell would require deleting all cached queries including that table cell

> Summary: 
hashed version of query is stored as cache key for the dataset in the cache, but may have issues with complex queries or changing a table cell.

#### Cached Objects
- Preferable pattern
- Let class assemble dataset from db and store complete instance in cache

- Product
    - Data
        - Prices, texts, pictures, reviews
        - Filled by several methods doing several req that are harder to cache

- Once class is finished assembling the data array, store the array or the complete instance of the class, in the cache. 
- Allows you to get rid of the object whenever something did change
- **Allows asynch processing** possible. 
- Objects to cache: user sessions (never in db), fully rendered blog articles, activity streams, user <-> friend relationships
- Two ways to cache via Redis and Memcached.
- Redis: has extra db features like persistence, built-in data structures i.e. sets and lists
Memacached: if only caching, and scales easily

> Summary: 
Cached Objects is the preferred pattern, where the class stores complete instance in cache after assembly. If change occurs, discard object, and allows asynchronism. Redis is more feature rich in caching. 

## Asynchronism
- Imagine buying bread and being told to wait for 2 hours before it's ready--asynch avoids this

### Paradigms of Asynchronism:
#### Async #1
- Doing time consuming work in advance and serving the finished work at low request time
- Dynamic --> static
- Pages of a website built by a framework of CMS, are rendered and stored locally as static HTML w/ each change
- Often these computing tasks are done on a regular basis, possibly by a script called /hr by cronjob. 
- Pre-computing makes websites and apps performant and scalable
- Imagine the scalability of your website if the script would upload these pre-rendered HTML pages to AWS S3 or Cloudfront or another Content Delivery Network!

> Summary: 
Preloading dynamic pages into static HTML allows serving at low request times, and computing tasks done regularly.

#### Async #2
What if there is something that can't be pre-loaded, or a query that is custom?

- Front end sends signal for a job, backend signal back it is being worked on, and front end tells a user to continue browsing while querying the back if the job is done. When the job completes, it is sent back up the chain and the user is notified.
- Reccom: first 3 tutorials on RabbitMQ, one of many systems which help to implement async processing. ActiveMQ or Redis list. 
- Have a queue of tasks for worksers
- Time consuming? do it asynchronously

> Summary: 
Second method of asynch is to queue tasks, and using systems to implenet asynchronous processing like ActiveMQ or Redis list

# Google I/O 2009 - Transactions Across Datacenters..

### Context
- multihoming: operating from multiple datacenters simultaneously
- read/write data

#### Weak Consistency
- after write, reads may or may not see it
- best effort, "message in a bottle"
- App Engine: memcache
- VoIP, online video

#### Eventual Consistency
- better than weak, after write, reads eventually see it
- App Engine: mail
- Search engine indexing
- DNS, SMTP, snail mail
- Amazon S3, SimpleDB

#### Strong Consistency
- after write, guaranteed reads see it
- App Engine: datastore
- Filsystems
- RDBMSes
- Azure tables

#### Why Transactions?
- You will want to build redundancies and make sure transactions are: 
    - Correct
    - Consistent
    - Enforce invariants
    - ACID (Atomic, consistent, isolated, durable)

#### Across Datacenters
Pros:
- If you have failures (catastrophic, expected, maintenance), you will want a redundancy, or uptime during maintenance, or even geolocality (CDNs, edge caching)

Cons:
- One datacenter is high bandwidth, low latency, little to no networking cost
- low bandwidth and high latency between datacenters

#### Multihoming
- Hard problem. Consistently? Harder. Real time? Hardest
    - Option 1: dont do multihoming. 
        - Bunkerize: most common, bring 5 sources of redundant power, several backbone connectivity, Microsoft Azure (tables) or Amazon SimpleDB
        - Catastrophic failure weakness
        - not geolocated
    - Option 2: Primary with hot failover
        - similar to master/slave
        - better but not ideal
            - mediocre catastrophic failure
            - Window of lost data
            - inconsistent failover
        - Amazon Web Services
            - EC2, S3, SQS: US/EU
            - EC2: Availability Zones, Elastic Load Balancing
        - Banks, brokerages, etc
        - Geolocated for reads, but not writes
    - Option 3: True Multihoming
        - Serving different DCs (read and writes)
        - Two-way: hard
        - N-wayL harder
        - Handle catastrophic failure, geolocality, but pay in latency

#### Techniques and Tradeoffs

| ---| Backups | M/S | M/M | 2PC | Paxos |
| --- | --- | --- | --- | --- | --- |
| Consistency | Weak | Eventual | Eventual | Strong | Strong |
| Transactions | No | Full | Local | Full | Full |
| Latency | Low | Low | Low | High | High |
| Throughput | High | High | High | Low | Medium |
| Data Loss | Lots | Some | Some | None | None |
| Failover | Down | Read-Only | Read/Write | Read/Write | Read/Write |


##### Backups
- Make a copy, sledgehammer, weak consistency, no transactions, datastore

##### Master/Slave Replication
- Usually Asynchronous
    - good for throughput, latency
- Most RDBMSes
    - e.g. MySQL binary logs
- Weak/Eventual consistency
    - Granularity matters
- Datastore: current

##### Master/Master Replication
- Umbrella term for merging concurrent writes
- Asynchronous, eventual consistency
- Need Serialization protocol
    - timestamp oracle: monotonically increasing timestamps
    - SPOF with master election
    - distributed consensus protocol
- No global transactions
- Datastore: no strong consistency

##### Tree Replication
- Creates slaves, and one slave/master. Said slave/master creates replicated slaves

##### Buddy Replication
- Replicates to each corresponding node, where a backup is kept of another Node/Data, Node A Data A Backup E --> Node B Data B Backup A --> ... --> Node E Data E Backup D --> Backup E
- upon failure of one, the backup responsibility and data is pushed to the node following the failed server, and the backup of the failed server is kept in the server following the followed server.

##### 2PC, Two Phase Commit
- Semi-destributed consensus protocol
    - deterministic coordinator
- 1: propose, 2: vote, 3: commit/abort
- heavyweight, syncronous, high latency
- 3PC buys async with extra round trip
- Datastore poor throughput

##### Paxos
- Fully distributed consensus protocol
- Either paxos, or Paxos with cruft, or broken (Mike Burrows)
- Majority writes; survives minority failure
- Protocol similar to 2PC/3PC
    - lighter but still high latency

### Slides Notes
- BASE: Basically Available Soft state Eventually consistent
- Scalability Patterns: State
    - Partitioning
    - HTTP Caching
        - Reverse Proxy
            - Varnish, Squid, rack-cache, Pound Nginx, Apache mod_proxy, Traffic Server
    - RDBMS (Relational Databases) Sharding
        - Scale via Partitioning, Replication
            - Partitioning: Application --> User --> Load Balancer --> Servers (A-C, D-F, ...)
            - Replication: Same, but Servers are (A-C; D-F), (D-F, A-C)
        - ORM + rich domain model (anti-pattern)
            - Attempt: read an object, Result: Sit with whole DB on lap.
        - Scaling reads is hard, Scaling writes is impossible
        - Needed sometimes but often not
    - NOSQL (Not only SQL)
        - Key Value databases, Column DB, Doc DB, Graph DB, Datastructure DB. 
            - i.e. Google: Bigtable, Amazon: Dynamo, SimpleDB, Facebook: Cassandra, Linkedin: Voldemort 
    - Dist. Caching
    - Data Grids
    - Concurrency



