---
title: "2023 01 09 03 Container Orchestration"
date: 2023-01-09T08:57:27+03:00
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

## Use of Containers

Generic Steps to run a web application, written in Python, on a server or a local machine

1. Install and configure an operating system
2. Install core python packages
3. Install python extensions specific to the program for eg. requirements.txt
4. configure networking in the the system
5. connect to databases or cache or storage(for eg. filer)

Servers are configured for a single purpose like for a database or an application then connect it to the network.

- VMs can be used on top of single hardware to isolate the environments.
- but VMs use the full operating system including the kernel which comes with an overhead
- Containers can solve this problem of managing the dependencies and running more effeciently than VMs



## Container Basics

- `chroot` command can be earliest ancestor to the modern container technology
- `chroot` could isolate a process from the root filesystem and "hide" the files from the process and simulate new root directory.
- The isolated environment is called chroot jail where files cant be accessed by the process but is still present on the system
- to isolate process even more than `chroot`, current linux kernels provide features like *namespaces* and *cgroups*
  - namespaces are used to isolate various resources like network. A process can have its own IP address and this leads to a complete abstraction of network interfaces and routing tables

 
