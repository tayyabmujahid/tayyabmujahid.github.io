---
title: "Kubernetes_Fundmentals 1/2"
date: 2023-04-03T09:57:48+03:00
draft: true
# weight: 1
# aliases: ["/first"]
tags: 
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

## Kubernetes Architecture

Kubernetes is often used as a cluster

Kubernetes clusters consist of two different server node types

- **Control Plane nodes**
  - the brain of operation
  - contains components to manage the cluster 
  - control various tasks like deployment, scheduling and self-healing of containerized workloads

- **Worker nodes**

  - applications run on worker nodes

  - their behavior is completely controlled by the control plane

    ![Kubernetes Architecture](/images/9-Kubernetesarchitecture.png)

#### Services on Control Plane nodes

- **kube-apiserver**
  - centerpiece of Kubernetes
  - All components interact with api-server
  - users access the cluster using this
- **etcd**
  - database to store the state of the cluster
  - [etcd](https://etcd.io/) is not official part of Kubernetes
    - key-value store for distributer systems
- **kube-scheduler**
  - when a new workload should be scheduled
  - kube-scheduler decides/choses that would fit the properties like CPU & Memory
- **kube-controller-manager**
  - contains non-terminating control loops
  - manage the state of cluster
  - for eg. one control loop can make sure a desired number of applications are available at all time
- **cloud-controller-manager**
  - used to interact with API of the cloud
  - create external resources like load-balancer, storage or security groups

#### Components of worker nodes

- **container runtime**
  - responsible for running containers on worker- nodes
  - containerd is favored container runtime
- **kubelet**
  - small agent runs on every worker node
  - talks to tp api-server and container runtime to handle final stage of starting containers
- **kube-proxy**
  - network proxy that handles inside and outside communication of a cluster
  - it relies on underlying OS networking capabilities



Application started on a worker node will continue to run even if the control plane is not available/offline but functionality like scaling, scheduling new applications etc will not be possible.

kubernetes has a concept of namespaces which are (not to be confused with kernel namespaces) which are used to divide the cluster in to mulitple virtual cluster. They don't provide strong isolation and must be viewed as directory on a computer which has access controls for users.
