---
title: "02. Cloud Native Architecture"
date: 2023-01-05T12:15:45+03:00
draft: False
# weight: 1
# aliases: ["/first"]
tags: ["12FactorApp","Cloud Native Architecture","kubernetes","linux foundation course","lfs250"]
author: "TM"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
hidemeta: false
comments: false
description: ""
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/tayyabmujahid/tayyabmujahid.github.io/blob/main/content"
    Text: "Suggest Changes" # edit text
    appendFilePath: true # to append file path to Edit link
---

## Fundamentals

### **Monolithic Applications:**

A monolithic application would include all functionality from user interface, product listing, shopping cart, checkout, processing orders. 

#### Disadvantages

Difficult to manage complexity, scale development across multiple teams, implement changes fast and scale application efficiently when its under load.

### **Cloud Native Applications** 

Cloud native application are broken down into smaller easy to manage.

Decoupled application that communicate over the network

Microservices: Small independent applications with clearly defined scope and functions

![Monolithic vs Microservices Architecture](/images/1-Monolithicvsmicroservices.png)

## Characteristics of Cloud Native Architecture

### High Level of automation

- automation in development and deployment

- Can be achieved using Continuous Integration/Continuous Delivery(CI/CD) pipelines backed by version control system like git

- Building, testing & deployment of applications with minimal human involvement allows for fast, frequent & incremental changes to production

- Reliable automated system allows for much easier disaster recovery

  

### Self healing

- Applications contain health checks to monitor application from inside
- If one part of the application fails/stops working the other parts don't get effected

### Scalable

Scaling is the process of handling more users/load while still providing pleasent experience 12 Factor App

- Multiple copies of applications and distributing the load
- Automating this behavior based on application metrics like CPU and memory

### Cost-efficient

- ability to scale down the application when traffic is low
- Kubernetes can help with more efficient and denser placing of applications

### Easy to maintain

Using *Microservices* allows to break down applications in  smaller pieces and make them more portable, easier to test and to  distribute across multiple teams.

### Secure by default

Zero trust computing mitigates by requiring authentication from every user and process.



**12 Factor App**

[twelve-factor app](https://12factor.net/) is a guideline for developing cloud native applications

## Auto-scaling

Auto-scaling pattern describes dynamic adjustment of resources based on the current demand. 

Metrics like CPU, memory, load, business metrics etc are considered to scale services up or down.

*Horizontal* *Scaling* is generally referred to  in the context of auto-scaling

**Definition of *Horizontal* *Scaling***: process of spawning new compute resources which can be copies of application process, VM or new hardware or racks of servers

***Vertical Scaling*** on the other hand alludes to change in size of underlying hardware and this is limited to the hardware limits for bare-metal , even though VMs' can be scaled to use more CPU and memory the upper limit is defined by the capacity of the hardware. For eg. RAM can be scaled up more by adding more RAM but only until slots availability.



![Horizontal vs vertical scaling](/images/2-Horizontalvsverticalscaling.png)

### Configuring Auto scaling

- setting minimum and maximum (VMs or containers) limits if instances
- run many (near-production) load tests and analyze behavior and load balancing to test for scenario when application is scaled
- cloud platforms with on-demand pricing models provide effective auto scaling

## Server-less

- servers are of-course required as the basis for the application.
- the application developer is relieved with the tasks to configure network, VM, OS and load-balancer
- The cloud provider will chose the right environment and the developer just provides the application code in a zip file or a container image.
- Also known as Function as a Service (FaaS).
- More stronger focus on on demand provisioning and scaling of application and provisioning is based on number of incoming requests, billing etc.
- Server-less systems are often used in combination or as extension of existing platform
- Allow very fast deployment and make for and excellent sandbox environments.
- Small, stateless applications make them a perfect fit for event or data  streams, scheduled tasks, business logic or batch processing.
- Issues with standardization, some times difficult to switch between platforms. [CloudEvents](https://cloudevents.io/) project aims to standardize how event data is structured. Events are the bases for scaling serverless workloads or triggering corresponding functions

## Open Standards

- Prevent vendor lock-in

- Helps in collaborate on an open-source project

**Building and distributing software packages** can be standardized using *containers*.

- Containers are standardized way to package and ship modern software

- Docker is a popular container technology which adheres to open industry standard of **[Open Container Initiative](https://opencontainers.org/)** (OCI)

  OCI provides for the following standards:

  - [image-spec](https://github.com/opencontainers/image-spec) : which defines how to build and package container images
  - [runtime-spec](https://github.com/opencontainers/runtime-spec): specifies the configuration, execution environment and lifecycle of containers
  - distribution-spec: standard for distribution of content and container [images](https://github.com/opencontainers/distribution-spec)

  **Few Standards that are used in Cloud Native applications**

- [OCI Spec](https://opencontainers.org/): image, runtime and distribution specification on how to run, build an distribute containers
- [Container Network Interface (CNI)](https://github.com/containernetworking/cni): A specification on how to implement networking for Containers.
- [Container Runtime Interface (CRI)](https://github.com/kubernetes/cri-api): A specification on how to implement container runtimes in container orchestration systems.
- [Container Storage Interface (CSI)](https://github.com/container-storage-interface/spec):A specification on how to implement storage in container orchestration systems.
- [Service Mesh Interface (SMI)](https://smi-spec.io/): Ap specification on how to implement Service Meshes in container orchestration systems with a focus on Kubernetes.

## Cloud Native Roles

### Cloud Architect

- designing application landscape and infrastructure 
- with a focus on security, scalability and deployment mechanisms

### DevOps Engineer

- combination of developer and administrator
- use tools and processes that balance out software development and operations

### Security Engineer

### DevSecOps Engineer

### Data Engineer

- collecting, storing, and analyzing the vast amounts of data
- provisioning and managing specialized infrastructure, as well as working with that data.

### Full-Stack Developer

- at home in frontend and backend development, 
- Infrastructure essentials.

### Site Reliability Engineer(SRE)

- SRE role was started around 2003 at Google.

- create and maintain software that is reliable and scalable

  SRE use the following three main metrics:

- **Service Level Objectives (SLO)**: “*Specify a target level for the reliability of your service.”* - A goal that is set, for example reaching a service latency of less that 100ms.

- **Service Level Indicators (SLI)**: *“A carefully defined quantitative measure of some aspect of the level of service that is provided”* - For example how long a request actually needs to be answered.

- **Service Level Agreements (SLA)**: “*An explicit or implicit contract with your users that includes  consequences of meeting (or missing) the SLOs they contain. The  consequences are most easily recognized when they are financial – a  rebate or a penalty – but they can take other forms.”* - Answers the question what happens if SLOs are not met.

## Community and Governance

- Cloud Native Computing Foundation(CNCF) supports open source projects that are industry standards
- Projects are categorized according to maturity and go a testing, sand-box stage before graduating
- CNCF has a Technical Oversight Committee(TOC).
- TOC is responsible '*for defining and maintaining the technical vision, approving new  projects, accepting feedback from the end-user committee, and defining  common practices that should be implemented in CNCF projects*'

## Resources

#### Cloud Native Architecture

- [Adoption of Cloud-Native Architecture, Part 1: Architecture Evolution and Maturity](https://www.infoq.com/articles/cloud-native-architecture-adoption-part1/), by Srini Penchikala, Marcio Esteves, and Richard Seroter (2019)
- [5 principles for cloud-native architecture-what it is and how to master it](https://cloud.google.com/blog/products/application-development/5-principles-for-cloud-native-architecture-what-it-is-and-how-to-master-it), by Tom Grey (2019)
- [What is cloud native and what are cloud native applications?](https://tanzu.vmware.com/cloud-native)
- [CNCF Cloud Native Interactive Landscape](https://landscape.cncf.io/)

#### Well-Architected Framework

- [Google Cloud Architecture Framework](https://cloud.google.com/architecture/framework)
- [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [Microsoft Azure Well-Architected Framework](https://docs.microsoft.com/en-us/azure/architecture/framework/)

#### Microservices

- [What are microservices?](https://microservices.io/)
- [Microservices](https://martinfowler.com/articles/microservices.html), by James Lewis and Martin Fowler
- [Adopting Microservices at Netflix: Lessons for Architectural Design](https://www.nginx.com/blog/microservices-at-netflix-architectural-best-practices/)

#### Serverless

- [The CNCF takes steps toward serverless computing](https://www.cncf.io/blog/2018/02/14/cncf-takes-first-step-towards-serverless-computing/), by Kristen Evans (2018)
- [CNCF Serverless Whitepaper v1.0](https://www.google.com/url?q=https://github.com/cncf/wg-serverless/tree/master/whitepapers/serverless-overview&sa=D&source=docs&ust=1636466570370000&usg=AOvVaw1xOr0iKDTSiS3io2WmyrQJ) (2019)
- [Serverless Architecture](https://cloud.google.com/serverless/whitepaper)

#### Site Reliability Engineering

- [SRE Book](https://sre.google/sre-book/introduction/), by Benjamin Treynor Sloss (2017)
- [DevOps, SRE, and Platform Engineering](https://iximiuz.com/en/posts/devops-sre-and-platform-engineering/), by Ivan Velicho (2021)
