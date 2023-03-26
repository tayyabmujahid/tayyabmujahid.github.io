---
title: "2023 01 23 Container Orchestration: Part 2/2"
date: 2023-01-23T10:30:30+03:00
draft: false
# weight: 1
# aliases: ["/first"]
tags: ["cloud native architecture","kubernetes","container","Docker","storage","service mesh","linux foundation course","lfs250"]
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

## Container Orchestration Fundamentals

Modern applications have a lot of smaller parts as containers that are loosely coupled, isolated and independent(microservice architecture).

A system is needed to manage such a large number of containers. Some of the tasks while managing containers are 

1. Provision compute like VMs
2. schedule containers on VM or servers effeciently
3. Allocate resources(CPU or Memory etc) to the containers
4. Manage containers availability and replace if failed
5. scale containers if load increases
6. provide networking to connect containers
7. provision storage if containers need to persist data

A container orchestration system provide a way to build a cluster of multiple servers and host the containers on top

Two parts of container orchestration system

- control plane: responsible for managing the containers
- worker nodes: host the containers

Kubernetes is **the** standard system to orchestrate containers

## Networking

- Network communication is the only way various components in a microservice architecture type applications communicate.

- A microservice implements an interface to communicate with other parts of the application

- Network namespaces allow each container to have its own set of unique IP addresses
  - Containers have the ability to map a port of the container to the port of the host machine
  - Network namespaces virtualizes and isolates network stack of a process.
  - Different process can have own firewall configuration ,private IP address and routing rules
  - Different docker containers can have for e.g. port 8080 open and these can be mapped to the host system to communicate outside the host system.
  
  **Access outside the host:**
  
  Containers map a port from the container to a port from the host system
  
  **Access across hosts:**
  
  overlay network with a virtual network that is spanned across host systems
  
  
  
  Modern container networking is based on [Container Network Interface](https://github.com/containernetworking/cni) (CNI)
  
  ![img](./static/6-Routingbetweenhostsandcontainers.png)

## Service Discovery & DNS

Why are container orchestration platforms more complicated?

- hundreds to thousands of containers with unique IP addressess
- different hosts, data centers and geo-locations
- DNS is a must to communicate due to large number of IP addresses
- information management as and when containers are deleted

Solution:

Automate it using a *Service Registry*, which maintains all the information and *Service Discovery* is used to finding the information.

**Service Discovery**

DNS: DNS servers have a service API to register new services when they are created

Key-Value Store: datastore , highly availibity and strong failover mechanisms. For eg. [etcd](https://github.com/etcd-io/etcd) (distributed key-value store), [Consul](https://www.consul.io/), Apache Zookeeper

## Service Mesh

Traffic management, monitoring, access control, encryption etc is generally required when containers communicate.

A proxy can take care of all the above mentioned functionality. This can be on a second container and it sits between a client and server and can modify or filter network traffic before it reaches the server. Popular **nginx, haproxy, envoy**

A service mesh adds proxy server to every container in the architecture. Now proxies can be used to handle network communication between services.

- when traffic has to be encrypted between applications, this would require adding libraries, configuration management of digital certificates etc. This can be lot of work and error prone
- proxies form the *data-plane* of a service mesh- where networking rules are implemented
- rules are defined in a centrally managed *control plane* and how traffic flows between Service A and Service B.
  - a config file is written that traffic between Service A and Service B is encrypted and the config is then uploaded to the control-plane and distributed to the data-plane

![img](./static/7-Istioarchitecture.png)

**Service Mesh Interface** project aims to defining specifications on how service mesh can be implemented by various providers.

SMI has a strong focus on Kubernetes to standardize user experience 

## Storage

- Container are ephemeral.To write data/files a read write layer is put on top of the container image and this is lost when the container is stopped or deleted
- To persist data it must written on host  and a volume can be used to achieve this allows storing the information on the host.
- This weakens the isolation of the container
- When more than one containers are orchestrated , multiple containers need access to it or when its started on a different host even then its needs access to the data.
- Container orchestration systems like Kubernetes can help to mitigate  these problems, but always require a robust storage system that is  attached to the host servers.



![img](./static/8-Storage.png)

**Storage is provisioned via a central storage system. Containers  on Server A and Server B can share a volume to read and write data**

The [Container Storage Interface (CSI)](https://github.com/container-storage-interface/spec) came up to offer a uniform interface which allows attaching different  storage systems no matter if it’s cloud or on-premises storage.
