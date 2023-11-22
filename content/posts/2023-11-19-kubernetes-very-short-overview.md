---
title: "2023 11 19 Kubernetes Very Short Overview"
date: 2023-11-19T10:04:07+03:00
draft: true
# weight: 1
# aliases: ["/first"]
tags: ["kubernetes","quick overview"]
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

## Traditional Server

- Physical machine or a VM

- Increasing traffic , increasing number of instances of the server

- Internal Load-balancer to manage the load

- Same system more than one server with more than one application

- External Load-balancer to route requests to different internal load balancers

  ![img](/images/traditional-servers.png)

## Kubernetes

It does the exact same thing as above but with different names

Internal load balancer is **Service**

External Load Balancer is **Ingress**

Different apps are **Deployments**

Application containers are **Pods**

Physical or Virtual Machine is **Node** that runs many **Pods**

Collection of **Nodes** is a **Cluster**

Possible to have a **physical cluster** or a **virtual cluster**(name space)



| Without Kubernetes     | With Kubernetes |
| ---------------------- | :-------------- |
| Containers             | Pod             |
| Internal Load Balancer | Service         |
| External Load Balancer | Ingress         |
| Application            | Deployment      |
| Physical Machine       | Node            |
| Cluster of Machines    | Cluster         |
| Virtual Cluster        | Namespace       |

![img](/images/app-with-kubernetes-design.png)
