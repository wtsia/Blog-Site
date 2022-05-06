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

### Domain Name System (DNS)
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
                - If Latency is lover btwn London & Oregon regions, Route 53 gives query an IP for Oregon LB. If latency is lower between London and the Singapore region, R53 responds with IP for the singapore LB.
        - Latency between hosts can change bc of connectivity and routing, and routing is based on latency measuerements performed over a period of time. 
        - AWS Latency Routing: ![link](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-latency)

        - Summary: Record of connection from X (user) to multiple Y databases are stored, and queries from X will have the load balancer will iterate through this record and respond with lowest latency Y database is relative to X.

    - Geolocation-based:
        - responds with location that DNS queries originate from.
        - allows localizing content and present some/all language of users.
        - also allows for content restriction
        - can route users consistently to same end-point
        - priority goes to the smallest geographic regions
        - usage:
            - maps IP to locations
            - some not mapped, so Amazon R53 will recieve DNS queries from unidentified, and thus can create default record from IP not mapped to any location and queries from locations no geolocation records exist for. No default means R53 returns "no answer".
        - ![link](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-geo)

        - Summary: A record of locations (and default) are made to which DNS queries will be sent to nearest mapped geographies

- Disadvantages of DNS
    - Accessing introduces slight delay but mitigated by caching
    - Can be complex and is generally managed by governments, ISPs, and large companies.
    - Go under DDoS attacks

### Content Delivery Network
- CDN is a globally distributed network of proxy servers, serving content from locations closer to the user i.e. static files like HTML, CSS, JS, photos, or videos
- Pros:
    - Users may receive content from data centers close to them
    - Servers do not have to serve requests CDN fulfills

#### Push CDNs
- receive new content when changes occur on server
- Provider managed, uploading and rewriting URLs to point to CDN, expiration, and update frequency. 
- Content uploading when new or changed minimizing traffic but maximizing storage
- Push is good for sites whose content isn't often updated 

#### Pull CDNs
- grabs new content from server when the first user requests content.
    - leave content on server and rewrite URLs to point to CDN
        - results in slow request until content is cached on CDN
    - time to live (TTL) determines caching duration.
- minimizes storage space on CDN but can create redundant traffic if files expire and are pulled before changes.

#### Disadvantages of CDNs:
- CDN costs may be significant dependent on traffic,but should be analyzed by opportunity cost. 
- Content may be stale if updated before TTL expires it
- CDNs require changing URLs for static content to point to the CDN



    