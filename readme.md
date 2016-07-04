Docker-Wrk
============

[![Build Status](https://travis-ci.org/skandyla/docker-wrk.svg?branch=master)](https://travis-ci.org/skandyla/docker-wrk)


## Summary

Repository name in Docker Hub: **[skandyla/wrk](https://hub.docker.com/r/skandyla/wrk/)**

This repository contains Dockerized [wrk](https://github.com/wg/wrk), published to the public [Docker Hub](https://registry.hub.docker.com/) via **automated build** mechanism.



## Configuration

This docker image contains the following software stack:

- Official Ubuntu latest image

- wrk


## Installation

   ```
   $ docker pull skandyla/wrk
   ```


## Usage


#### Show usage

```
$ docker run --rm skandyla/wrk
```

#### Login inside the conatiner

```
$ docker run --rm skandyla/wrk bash
```

#### Script example

```
$ docker run --rm  -v `pwd`:/data skandyla/wrk -s script.lua  https://www.google.com/
```

#### Custom hosts entries example
Add custom records to /etc/hosts  

```
$ docker run --rm -v '/etc/hosts:/etc/hosts' skandyla/wrk -c10 -d30  https://www.example.com/
```


