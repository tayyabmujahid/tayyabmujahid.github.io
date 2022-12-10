---
title: "Docker Cheatsheet"
date: 2022-12-04T08:48:10+03:00
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





### Manage Containers

list containers

`docker ps` list of <u>running</u> containers

`docker ps -a` list of <u>all</u> containers

`docker rm CONTAINER_ID` to remove container

`docker images` list all images 

`docker rmi IMAGE` remove an image here IMAGE can IMAGE ID



### Building & Rebuilding



To rebuild and image from scratch without referring to cache use the following commands

`docker-compose build --no-cache` - this will re-build images from scratch

`docker-compose up --force-recreate`- this will recreate containers

according to this [^1]  the above method is hacky and quick fix but not a permanent solution

[^1]: https://vsupalov.com/docker-compose-runs-old-containers/

docker-compose up 

docker-compose down –rmi all



Running a container

Start stopped containers



Rebuilding



### Notes

#### RUN vs CMD vs ENTRYPOINT[^2]

[^2]:https://awstip.com/docker-run-vs-cmd-vs-entrypoint-78ca2e5472bd `**footnote**`

- `RUN` executes commands and creates new image layers.

  - `RUN` instruction allows you to install your application and packages required for it. It executes any commands on top of the current image and creates a new layer by committing the results. 
  - Often there are multiple RUN instructions in a Dockerfile.

- `CMD` sets the command and its parameters to be executed by default after the container is started. However `CMD` can be replaced by `docker run` command line parameters.

  - `CMD` instruction allows you to set a default command, which will be executed only when you run container without specifying a command. If Docker container runs with a command, the default command will be ignored. <u>I<u>f Dockerfile has more than one `CMD` instruction, all but last</u>
        `CMD` instructions are ignored</u>
  - `CMD` has three formats:
    1. Exec format: `CMD [“executable”,”param1",”param2"]`
    2. `CMD [“param1”, ”param2"]`, this format is used in combination of `ENTRYPOINT` , to provide extra parameters
    3. Shell format: `CMD command param1 param2`

- `ENTRYPOINT` configures the command to run when the container starts, similar to `CMD` from a functionality perspective.

  - The `ENTRYPOINT` directive allows the container to run as an application or service.
  - `ENTRYPOINT` has two formats:
    1. Exec format: `ENTRYPOINT [“executable”, “param1”, “param2”]` This is the recommended format for `ENTRYPOINT`.
    2. Shell format: `ENTRYPOINT command param1 param2`

  

### References

https://dockerlabs.collabnix.com/docker/cheatsheet/

https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-dockerfile

https://github.com/collabnix/dockerlabs 
