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

**[Kubernetes Cluster](https://kubernetes.io/docs/tutorials/kubernetes-basics/create-cluster/cluster-intro/)**

*Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit*. Kubernetes allows to deploy containerized applications

![Cluster](/images/module_01_cluster.svg)

Kubernetes clusters consist of **two different server node types**

Cluster Components -  **Control Plane** & **Worker nodes**

- **Control Plane nodes**
  
  - the brain of operation
  - contains components to manage the cluster 
  - control various tasks like deployment, scheduling and self-healing of containerized workloads
  - Kubernetes API(exposed by the control plane) is used for communications with Node-level components.
  
- **Worker nodes** (just **Nodes**)

  - A node is a VM or a physical computer that serves as a worker machine in a Kubernetes cluster.

    - Each node has a **Kubelet**- agent for managing the node and communicating(uses [Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)) with control plane
    - also has a container runtime for handling container operations 
      - containerd
      - CRI-O
  
  - applications run on worker nodes
  
  - their behavior is completely controlled by the control plane
  
    ![Kubernetes Architecture](/images/9-Kubernetesarchitecture.png)
  
  - **The kubelet in nodes communicate with the control plane using the [Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)**,

#### Services on <u>Control Plane</u> nodes

- **kube-apiserver**
  - centerpiece of Kubernetes
  - All components interact with api-server
  - users access the cluster using this
  - kube-apiserver scales horizontally i.e. it scales by deploying more instances
- **etcd**
  - key-value database to store the state of the cluster
  - [etcd](https://etcd.io/) is not official part of Kubernetes
    - key-value store for distributer systems
- **kube-scheduler**
  - when a new workload should be scheduled
  - when new **Pods** are created, assignment to **Node**
  - kube-scheduler decides/choses that would fit the properties like CPU & Memory
- **kube-controller-manager**
  - contains non-terminating control loops
  - manage the state of cluster
  - for eg. one control loop can make sure a desired number of applications are available at all time
- **cloud-controller-manager**
  - used to interact with API of the cloud
  - create external resources like load-balancer, storage or security groups

#### Components of <u>Worker</u> nodes

- **container runtime**(docker, containerd, CRI-O, etc)
  - responsible for running containers on worker- nodes.
  - containerd is favored container runtime.
- **kubelet**
  - small agent runs on every worker node.
  - talks to tp api-server and container runtime to handle final stage of starting containers.
- **kube-proxy**
  - network proxy that handles inside and outside communication of a cluster.
  - it relies on underlying OS networking capabilities.



Application started on a worker node will continue to run even if the control plane is not available/offline but functionality like scaling, scheduling new applications etc will not be possible.

kubernetes has a concept of namespaces which are (not to be confused with kernel namespaces) which are used to divide the cluster in to multiple virtual cluster. They don't provide strong isolation and must be viewed as directory on a computer which has access controls for users.



## Kubernetes Setup

Test cluster can be setup with the following tools

- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [kind](https://kind.sigs.k8s.io/)
- [MicroK8s](https://microk8s.io/)

Production-grade cluster can be setup using 

- [kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/)
- [kops](https://github.com/kubernetes/kops)
- [kubespray](https://github.com/kubernetes-sigs/kubespray)

Cloud hosted options

- [Amazon](https://aws.amazon.com/eks/)(EKS)
- [Google(GKE)](https://cloud.google.com/kubernetes-engine)
- [Microsoft(AKS)](https://azure.microsoft.com/en-us/products/kubernetes-service/)
- [DigitalOcean(DOKS)](https://www.digitalocean.com/products/kubernetes/)

## Trying out Kubernetes

### Minikube

#### Introduction : Basics about Deployment

- Containerized applications are deployed on top of a running Kubernetes Cluster
- To run a containerized application you create a Kubernetes **Deployment**
- control plane schedules the application instance in the Deployment to run on individual **Nodes**
- **Deployment** **controller** continuously monitors created instances.
- **Node** hosting an instance goes down or is deleted, the **Deployment**  **controller** replaces the instance with an instance on another **Node** in the cluster - **self-healing**



![Deployment and containerized app](/images/module_02_first_app.svg)



Create a Cluster

Create Deployment

Create Service to expose 

​	expose the pod to the public

​	Provision an external IP address

Running a sample app on Kubernetes using minikube

- Install Minikube
- Install kubectl
  - kubectl is Kubernetes command-line tool, kubectl, allows you  to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs

- 
- https://www.youtube.com/watch?v=X48VuDVv0do

https://theaisummer.com/kubernetes/?utm_content=268889881&utm_medium=social&utm_source=twitter&hss_channel=tw-1259466268505243649



