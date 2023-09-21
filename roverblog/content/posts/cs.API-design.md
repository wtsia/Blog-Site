+++
author = "Winston Tsia"
authorlink = ""
title = "API Design"
date = 2023-05-30T14:36:42-07:00
description = "Notes on API Design"
tags = [
    "API",
    "Applications",
]
categories = [
    "Computer Science",
    "Software",
]
math = true
notaxonomy = false
hidden = true
norobots = true
nodate = true
hidemeta = false
+++
![API Designer](https://learnupon.s3.eu-west-1.amazonaws.com/badges/183846/badge/Badge-Designer.png)
# Contents
- [Contents](#contents)
- [**API Design**](#api-design)
  - [Introduction](#introduction)
    - [APIs: Digital Enablers](#apis-digital-enablers)
      - [Business Benefits](#business-benefits)
      - [Digital Feedback Loop](#digital-feedback-loop)
      - [Case Studies](#case-studies)
        - [Amazon](#amazon)
        - [Disney](#disney)
        - [Summary:](#summary)
  - [API360 Model](#api360-model)
  - [API Styles](#api-styles)
  - [Attributes to Designing APIs](#attributes-to-designing-apis)
      - [Functionality](#functionality)
      - [Usability](#usability)
      - [Experience](#experience)
    - [Developer Experience (DX)](#developer-experience-dx)
  - [Overcoming API Design Obstacles](#overcoming-api-design-obstacles)
    - [Challenges](#challenges)
    - [Obstacles](#obstacles)
  - [Architecture](#architecture)
    - [Well-Designed API](#well-designed-api)
    - [Architectural Layers](#architectural-layers)
    - [API Design Approach Steps](#api-design-approach-steps)
  - [Change Management](#change-management)
    - [API Versioning](#api-versioning)
    - [Extending the Interface Techniques](#extending-the-interface-techniques)

# **API Design**
## Introduction
API means Application Programming Interface.

**CRUD** and **REST** are two fundamental concepts in web development and API design:

**CRUD**:

1. **CRUD** stands for Create, Read, Update, and Delete. It represents the basic operations that can be performed on data in most relational databases and web services. Here's what each operation entails:

   - **Create**: This operation involves creating new data records or resources. In a web context, it typically corresponds to an HTTP POST request, where data is sent to a server to create a new resource.

   - **Read**: The Read operation is about retrieving data from a database or server. In web services, it corresponds to an HTTP GET request, which retrieves data without modifying it.

   - **Update**: Updating is the process of modifying existing data. In web services, it's often implemented with an HTTP PUT or PATCH request, where data is sent to the server to update an existing resource.

   - **Delete**: The Delete operation is used to remove data or resources. It corresponds to an HTTP DELETE request, which instructs the server to remove a specific resource.

CRUD operations are essential for managing data in web applications, and they map directly to the HTTP methods for web services.

**REST**:

1. **REST** stands for Representational State Transfer. It is an architectural style and set of constraints for designing networked applications. RESTful systems are designed to be stateless, scalable, and simple. Here are some key principles of REST:

   - **Resources**: In REST, data or entities are represented as resources. Resources can be identified by URIs (Uniform Resource Identifiers).

   - **HTTP Methods**: REST uses standard HTTP methods (GET, POST, PUT, DELETE) to perform CRUD operations on resources. Each HTTP method maps to a specific CRUD operation.

   - **Statelessness**: RESTful services are stateless, meaning each request from a client to the server must contain all the information needed to understand and process the request. The server does not store any client state between requests.

   - **Representation**: Resources can have multiple representations (e.g., JSON, XML, HTML), and clients can request the representation they prefer using content negotiation.

   - **Uniform Interface**: REST enforces a uniform and consistent interface for interactions between clients and servers. This simplifies client-server interactions and promotes scalability.

   - **Client-Server**: REST separates the client and server components, allowing them to evolve independently. This separation enhances scalability and simplifies client development.

   - **Stateless Communication**: Each request from a client to a server must include all the information necessary for the server to understand and process the request. Servers do not store client state.

RESTful APIs are widely used in web services and are known for their simplicity, scalability, and ease of use. They have become the foundation for building many modern web APIs, and adhering to REST principles helps create consistent and predictable APIs.

### APIs: Digital Enablers
APIs enable many tools within an enterprise:
- Scalability for increased business
- Ecosystem for developers
- Accessibility to customers
- Information gathering

#### Business Benefits
- New Revenue (Google Maps, Reddit--2023)
- Reach and Retention (npr)
- Faster Partnerships (Kayak)
- Mobile and Omnichannel (Capital One, Facebook, Amazon, mobile apps)
- Interaction Analysis (Mastercard)
- Outsourced Innovation (Netflix)
- Self-Service Integration (Amazon)
- Organizational Agility ("API First")

#### Digital Feedback Loop
Business Goals -> Digital Reach -> Business Results -> Data-drive Insights -> Business Goals

#### Case Studies
##### Amazon
>Amazon's development of APIs in 2001-2002 connected the Amazon organization via web services. With good API documentation, the use of APIs in Amazon allowed for expansion towards infrastructure provisioning services--going from book retailer to AWS. Seamless switching from website to mobile.

##### Disney
>Disney's use of a band is an IoT device that enabled an Omnichannel method to access keys, rides, etc. This allowed not only widespread usage, but also data-driven approaches to problems.

##### Summary:
Define APIs. Understand Digital Feedback Loop. Business benefits, and API value in real life.

## API360 Model
- Alignment & Usefulness
  - Create API Strategy (Key Deliverables: **Roadmap, Organization, Business**)
- Engagement & Usability
  - Marketing APIs (Key Deliverables: **Dev Program, API/DX Design Principles, API Consumer Toolkits, Education**)
    - Marketing, Engagement, Ease of Use, Tools required
- Scalability & Evolvability (Key Deliverables: **Architecture Guidelines, API Lifecycle, Roadmaps, Skills Training**)
  - Future-proof + Appropriate Constraints, Optimized Usage > Standardization
  - *Runtime? Version? Factors affecting design time scalability? Trends? Constraints? Leveraging current assets?*
- Manageability & Security (Key Policies: **Analytics/Monitoring, Identity/Security, Infrastructure/Operations, Mangement Platform**)
  - Good Tracking, Access Management
  - *Metrics? Control? Privacy? Threats?*
  - Policies: Analytics/Monitoring, Identity/Security, Infrastructure/Operations, Mangement Platform

## API Styles
**Tunnel (SOAP)**: build on calling functions within a programming language, extended to remote services

URI (CRUD): an intuitive way to invoke requests, and when well-designed, employ "hackable" URIs. 

Hypermedia (REST): like URI, but uses rich content types and other native HTTP tooling to create interactions focused on tasks over objects

Even-driven/Reactive: includes WebSocket protocol, transmitting data between a client and server with low overhead

GraphQL: clients can dictate presentation of retrieved data without large/unnecessary requests

gRPC: language-agnostic, and requires client and server agree on payload format (allows performance at scale)

Certainly, here's an explanation of the different API styles and the acronyms involved:

1. **Tunnel (SOAP)**:
- **SOAP** stands for Simple Object Access Protocol. It is a protocol for exchanging structured information in the implementation of web services. SOAP APIs are built on the idea of sending requests to remote services using XML-based messages. It often involves calling functions within a programming language that are extended to work with remote services. SOAP is known for its strict standards and is often associated with enterprise-level integrations.
- **Implementation Model**
  - Focus on functions/methods
  - Build a component
  - Expose functions vis WSDL
  - Publish WSDL
  - Code generate proxy class
  - Use proxy class in client
- *Advantages*: Continues RPC line, good "tooling", strong governance model
- *Disadvantages*: Stack dependencies, XML centric, ignores HTTP features, less popular
> Example: A legacy enterprise system exposes a SOAP API for retrieving customer information. A client application sends a SOAP request containing XML data to the server, and the server responds with XML-formatted data containing the customer details.
```
from zeep import Client

# Create a SOAP client
client = Client('http://example.com/soap-service?wsdl')

# Create a SOAP request
request_data = {
    'customer_id': 123
}

# Call a remote function
response = client.service.get_customer_info(**request_data)

# Process the SOAP response (assuming XML response)
customer_info = response['customer_info']
print(customer_info)

# Example of an XML-centric message format:
<person>
    <name>John Doe</name>
    <age>30</age>
    <email>john@example.com</email>
</person>
```

2. **URI (CRUD)**:
- **URI** stands for Uniform Resource Identifier. In the context of API design, URI is commonly used for CRUD (Create, Read, Update, Delete) operations. RESTful APIs make use of URIs to represent resources, and HTTP methods like GET, POST, PUT, and DELETE are used to perform actions on these resources. Well-designed URIs are "hackable," meaning they are intuitive and follow a logical structure, making them easy for developers to understand and work with.
- **Implementation Model**
  - Objects/Entities
  - Design identifiers
  - Design query rules
  - HTTP methods as operations
  - Server serializes internal obj
  - Clients use URIs tp pass obj
- *Advantages*: well-known, tooling is good, "hacking": easy
- *Disadvantages*: URI modeling N/A, HTTP method set is small, and may become "chatty"

> Example: A RESTful API for a blogging platform. Clients can use HTTP methods to perform CRUD operations on blog posts. For instance, to create a new post, a client sends a POST request to /api/posts, and to retrieve a specific post, a client sends a GET request to /api/posts/{post_id}. Example in Node.js using Express:
```
const express = require('express');
const app = express();

// Sample in-memory data
const blogPosts = [];

// Create a new blog post
app.post('/api/posts', (req, res) => {
    const newPost = req.body; // Assuming request body contains post data
    blogPosts.push(newPost);
    res.json(newPost);
});

// Retrieve a specific blog post
app.get('/api/posts/:postId', (req, res) => {
    const postId = req.params.postId;
    const post = blogPosts.find(p => p.id === postId);
    if (!post) {
        res.status(404).json({ error: 'Post not found' });
    } else {
        res.json(post);
    }
});

// ... other CRUD routes ...

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});

```

3. **Hypermedia (REST)**:
- **REST** stands for Representational State Transfer. RESTful APIs use rich content types and native HTTP tooling to create interactions focused on tasks over objects. Hypermedia, in the context of REST, refers to including links or references within API responses that guide clients on how to navigate and interact with the API. This allows for a more dynamic and discoverable API experience, where clients can follow links to perform actions.
- **Implementation Model**
  - Focuse on tasks/use
  - Select media type
  - Match tasks to forms/links
  - Server translates internal storage to media types
  - Client uses links/forms in responses
- *Advantages*: Customizable media types, growing guidance, favors long-lasting services
- *Disadvantages*: Poor tooling, assumed "too hard", limited use in public APIs
  
> Example: An e-commerce REST API that includes hypermedia links. When a client retrieves information about a product, the response includes links to related resources, such as reviews, related products, and the shopping cart. Clients can follow these links to navigate through the API. Example of a JSON Response with Hypermedia Links:
```
{
    "product_id": 123,
    "name": "Sample Product",
    "description": "This is a sample product.",
    "links": [
        { "rel": "reviews", "href": "/api/products/123/reviews" },
        { "rel": "related", "href": "/api/products/related/123" },
        { "rel": "cart", "href": "/api/cart" }
    ]
}

```

4. **Event-driven/Reactive**:
- This style of API includes the use of protocols like **WebSocket** for real-time communication between clients and servers. It allows data to be transmitted between a client and server with low overhead and low latency. Event-driven or reactive APIs are well-suited for applications that require real-time updates or push notifications.

> Example: A chat application that uses WebSocket for real-time messaging. When a user sends a message, it is immediately pushed to the recipient's client through a WebSocket connection, enabling real-time chat without the need for constant polling. Example of a WebSocket Server in Node.js:
```
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
    console.log('Client connected');

    ws.on('message', (message) => {
        console.log(`Received message: ${message}`);
        // Handle and broadcast the message to other clients
        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(message);
            }
        });
    });
});

```

5. **GraphQL**:
- GraphQL is a query language for APIs developed by Facebook that allows clients to dictate the shape and structure of the data they need. It enables clients to request only the specific data they require, reducing over-fetching or under-fetching of data. GraphQL APIs are designed to be flexible and client-centric, allowing clients to retrieve data without making large or unnecessary requests.

> Example: A social media platform with a GraphQL API. Clients can send GraphQL queries to request specific information about users, their posts, comments, and more. Clients can customize the query to fetch only the fields they need. For example, a client might request the user's name, profile picture, and the latest five posts. Example of a GraphQL Query in JavaScript (Apollo Client):
```
import { useQuery } from '@apollo/client';
import gql from 'graphql-tag';

const GET_USER_PROFILE = gql`
  query GetUserProfile($userId: ID!) {
    user(id: $userId) {
      name
      email
      posts {
        title
        content
      }
    }
  }
`;

function UserProfile({ userId }) {
  const { loading, error, data } = useQuery(GET_USER_PROFILE, {
    variables: { userId },
  });

  if (loading) return 'Loading...';
  if (error) return `Error: ${error.message}`;

  const user = data.user;

  // Render user profile with retrieved data
}
```

1. **gRPC**:
- **gRPC** is a high-performance, language-agnostic remote procedure call (RPC) framework developed by Google. It uses Protocol Buffers (protobuf) for defining service contracts and serializing data. gRPC requires both the client and server to agree on the payload format, which can lead to efficient communication. It is known for its speed and efficiency and is often used in microservices architectures and performance-critical applications.

> Example: A microservices-based architecture for a ride-sharing platform. Services written in different languages communicate with each other using gRPC. For instance, a trip booking service written in Go may communicate with a user authentication service written in Java, ensuring efficient and type-safe communication between services. Example of a gRPC Server and Client in Go:
```
// in protocol buffers:
syntax = "proto3";

package example;

service Greeter {
  rpc SayHello (HelloRequest) returns (HelloReply);
}

message HelloRequest {
  string name = 1;
}

message HelloReply {
  string message = 1;
}


// in go:
package main

import (
    "context"
    "fmt"
    "log"

    "google.golang.org/grpc"
    pb "example"
)

func main() {
    conn, err := grpc.Dial("localhost:50051", grpc.WithInsecure())
    if err != nil {
        log.Fatalf("could not connect: %v", err)
    }
    defer conn.Close()
    c := pb.NewGreeterClient(conn)

    name := "World"
    r, err := c.SayHello(context.Background(), &pb.HelloRequest{Name: name})
    if err != nil {
        log.Fatalf("could not greet: %v", err)
    }
    fmt.Printf("Greeting: %s\n", r.Message)
}

```

These different API styles and acronyms offer various approaches to building and interacting with APIs, each with its own advantages and use cases. The choice of API style depends on the specific requirements of your application and the trade-offs you are willing to make in terms of flexibility, performance, and complexity.

## Attributes to Designing APIs
#### Functionality
- Access data I need?
- Uptime?
- Connecting to wanted syste,?

#### Usability
- Learning curve, understanding, and debugging
#### Experience
- Feelings in regards to the human experience

### Developer Experience (DX)
A good DX means encouraging adoption of the API. Good API design incorporate constraints, business drivers, and devs. API designers look to improve the dev experience:
- Morville's UX Honeycomb
  - Useful
  - Usable
  - Desireable
  - Valuable
  - Findable
  - Accessible
  - Credible
- Troubleshooting
  - Clear error msg, defect tracking, documentation, time to fix
- Change management
  - API versioning, release history, backward compatibility, upgrade or migration process
- Education
  - Documentation, annotations, sample code, scripts, demos, dev community engagement
- Visibility
  - Log/Usage access, transaction tracing, intuitive search
- Trust
  - stability, honesty, security

## Overcoming API Design Obstacles
Common challenges include cost, scalability, and security. Some obstacles may be the "perspective obstacle","bias obstacle", "assumptions obstacle", "resource obstacle".
### Challenges
- Costs
  - infrastructure: hardware and program approaches
- Scalability
  - load testing, authentication, quota management, API caching
- Security
  - leverage API gateway to validate traffic

### Obstacles
- perspective obstacle
  - designer may understand the API better than users, thus look to reducing usage complexity 
- bias obstacle
  - technical purity may not always win, and users may seek simplicity
- assumption obstacle
  - assumptions can be inaccurate, especially about users, so don't assume without validations
- resource obstacle
  - Understand priorities--avoid design debt. Sometimes use shortcuts, use simpler design acclimated to users

## Architecture
### Well-Designed API
A well-designed API addresses security, usability, scalability, testability, and reliability.

### Architectural Layers
0. Client Application
1. Security (gatekeeper)
2. Caching (deliver sketched responses)
3. Representation (interface, consumer-centric view)
4. Orchestration (allows enriched responses)
5. API

### API Design Approach Steps
Design, test, implement. Create **state diagrams** where necessary that lists all parts, documents state transitions, finds the best schema, and reconcile strings.

1. Determine goals
2. Identify users
3. Design interface
4. Evaluate
5. Implement
   
Prototypes should be low investment--focus on interface, and start with low-fidelity sketches. Utilize the interface design feedback loop 

## Change Management
The change management umbrella covers topics of versioning APIs with communication on risks and considerations for versions, a clear release history tracking development, supporting backward compatibility, and painless upgrade/migration.
> Postel's Law:
> Be conservative in what you do, be liberal in what you accept from others" 
> 
> -> "Be conservative in what you send, be liberal in what you accept".

### API Versioning
Principles:
- Avoid versioning unless necessary--nobody cares on the web
- Semantic Versioning
  - 2.1.0 - rc.1 (Major-minor-revision-build)
- When making breaking changes, treat changes like a new API
- Extend interface to avoid breakage--users only care about APIs breaking

### Extending the Interface Techniques
- preserve what you have
- preserve the meaning
- make new changes optional
  - inject default values, or clients ignore properties/obj that aren't understood
  - add fields, but don't overdo it
  - hypermedia is most friendly