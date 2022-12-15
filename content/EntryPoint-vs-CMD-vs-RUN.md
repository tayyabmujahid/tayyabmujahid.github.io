---
title: "ENTRYPOINT vs CMD vs RUN"
date: 2022-12-15T08:16:46+03:00
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

## RUN vs CMD vs ENTRYPOINT[^1]

[^1]: https://awstip.com/docker-run-vs-cmd-vs-entrypoint-78ca2e5472bd `**footnote**`

A docker container starts and exits at the same time if there is no `CMD` or `ENTRYPOINT` 

### `RUN` 

RUN executes commands and creates new image layers.

- `RUN` instruction allows you to install your application and packages required for it. It executes any commands on top of the current image and creates a new layer by committing the results. 
- Often there are multiple RUN instructions in a Dockerfile.

### `CMD` 

CMD sets the command and its parameters to be executed by default after the container is started. However `CMD` can be replaced by `docker run` command line parameters.

- `CMD` instruction allows you to set a default command, which will be executed only when you run container without specifying a command. If Docker container runs with a command, the default command will be ignored. <u>I<u>f Dockerfile has more than one `CMD` instruction, all but last</u>
      `CMD` instructions are ignored</u>
- `CMD` has three formats:
  1. Exec format: `CMD [“executable”,”param1",”param2"]`
  2. `CMD [“param1”, ”param2"]`, this format is used in combination of `ENTRYPOINT` , to provide extra parameters
  3. Shell format: `CMD command param1 param2`

### `ENTRYPOINT` 

- Dockerfile directive used to specify the executable when a container is started from an image

- ENTRYPOINT configures the command to run when the container starts, similar to `CMD` from a functionality perspective.

- The `ENTRYPOINT` directive allows the container to run as an application or service.
- `ENTRYPOINT` has two formats:
  1. Exec format: `ENTRYPOINT [“executable”, “param1”, “param2”]` This is the recommended format for `ENTRYPOINT`.
  2. Shell format: `ENTRYPOINT command param1 param2`

### General Rule

`ENTRYPOINT` + `CMD`  = default container commands

- Both can be overridden during runtime
- Both may be empty 
- The arguments of both are concatenated

How does docker interpret `ENTRYPOINT` and `CMD`

```dockerfile
ENTRYPOINT ["/bin/chamber", "exec", "production", "--"]
CMD ["/bin/service", "-d"]
```

following from the above docker snippet the default arguments for the container  will be concatenated to 

`["/bin/chamber", "exec", "production", "--", "/bin/service", "-d"]`

and this roughly translates to a shell command `/bin/chamber exec production -- /bin/service -d` 



**ALWAYS AS A RULE WRITE THE ARGUMENTS TO BOTH `ENTRYPOINT` AND `CMD` AS ARRAYS EVEN THOUGH ITS POSSIBLE OF STRINGS AS ARGUMENTS**

### `CMD` is a default

`CMD` in a Dockerfile is a default value. If a Docker container is run 

- with no arguments `docker run myservice` , then the translation of shell command is the following

  `["/bin/chamber", "exec", "production", "--","/bin/service", "-d"]`

- with non-option arguments `docker run myservice /bin/debug`

  `["/bin/chamber", "exec", "production", "--", "/bin/debug"]`

​		`CMD` is replaced entirely 

### `ENTRYPOINT` overriding

`ENTRYPOINT` can be overridden using the `--entrypoint` flag

`docker run --entrypoint /bin/logwrap myservice`

the shell command will be

`["/bin/logwrap","/bin/service", "-d"]` `

### Both `ENTRYPOINT` and `CMD` can also be overridden

`docker run --entrypoint /bin/logwrap myservice /bin/service -e`

the shell command will be

`["/bin/logwrap","/bin/service","-e"]`





### References

1. https://aws.amazon.com/blogs/opensource/demystifying-entrypoint-cmd-docker/
2. https://awstip.com/docker-run-vs-cmd-vs-entrypoint-78ca2e5472bd
