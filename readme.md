Docker-Wrk
============

[![Build Status](https://travis-ci.org/skandyla/docker-wrk.svg?branch=master)](https://travis-ci.org/skandyla/docker-wrk)


## Summary

A minimal docker image with **[Wrk](https://github.com/wg/wrk)** http benchmarking tool based on **[Alpine](https://hub.docker.com/_/alpine/)** Linux (and optionally on [Debian8](https://hub.docker.com/_/debian/))  
Total image size is less then **10mb**  

Repository name in Docker Hub: **[skandyla/wrk](https://hub.docker.com/r/skandyla/wrk/)**  
Published via **automated build** mechanism  

## Images, tags and respective Dockerfile links

[![](https://images.microbadger.com/badges/version/skandyla/wrk.svg)](https://microbadger.com/images/skandyla/wrk "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/skandyla/wrk.svg)](https://microbadger.com/images/skandyla/wrk "Get your own image badge on microbadger.com")  
- `skandyla/wrk` ([alpine/Dockerfile](https://github.com/skandyla/docker-wrk/blob/master/alpine/Dockerfile)) - default image, based on Alpine Linux


[![](https://images.microbadger.com/badges/version/skandyla/wrk:debian8.svg)](https://microbadger.com/images/skandyla/wrk:debian8 "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/skandyla/wrk:debian8.svg)](https://microbadger.com/images/skandyla/wrk:debian8 "Get your own image badge on microbadger.com")
- `skandyla/wrk:debian8` ([debian8/Dockerfile](https://github.com/skandyla/docker-wrk/blob/master/debian8/Dockerfile)) - image, based on debian:jessie



## Installation

```
$ docker pull skandyla/wrk
```


## Usage

#### Show usage
```
$ docker run --rm skandyla/wrk
```


#### To login inside the container (optional)
```
$ docker run -it --rm  --entrypoint=/bin/sh skandyla/wrk
```

#### Script example
```
$ docker run --rm -v $(pwd):/data skandyla/wrk -s \
  script.lua  https://www.example.com
```

#### Custom hosts entries example
Add custom records to /etc/hosts:    
```
$ docker run --rm -v /etc/hosts:/etc/hosts \
  skandyla/wrk -t5 -c10 -d30  https://www.example.com
```


## Wrk mini-howto

**[wrk](https://github.com/wg/wrk) - a HTTP benchmarking tool**  
  wrk is a modern HTTP benchmarking tool capable of generating significant     
  load when run on a single multi-core CPU. It combines a multithreaded  
  design with scalable event notification systems such as epoll and kqueue.  

  An optional LuaJIT script can perform HTTP request generation, response  
  processing, and custom reporting. Details are available in SCRIPTING and  
  several examples are located in [scripts](https://github.com/wg/wrk/tree/master/scripts)

**Basic Usage:**  
`wrk -t12 -c400 -d30s http://127.0.0.1:8080/index.html`

  This runs a benchmark for 30 seconds, using 12 threads, and keeping
  400 HTTP connections open.

**Output:**  

```
  Running 30s test @ http://127.0.0.1:8080/index.html
    12 threads and 400 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
      Latency   635.91us    0.89ms  12.92ms   93.69%
      Req/Sec    56.20k     8.07k   62.00k    86.54%
    22464657 requests in 30.00s, 17.76GB read
  Requests/sec: 748868.53
  Transfer/sec:    606.33MB
```  



LuaJIT script example:  
*script.lua:*  

```lua
-- example HTTP POST script which demonstrates setting the
-- HTTP method, body, and adding a header
wrk.method = "POST"
wrk.body   = '{"value":"ourdata","type":"example"}'
wrk.headers["X-EXAMPLE-HEADER"] = "OurDataHeader"
```  

Launch:  
`wrk -t10 -c50 -d30s -s script.lua https://api.example.com`  



### Useful info
[Load testing with wrk when every reqeust has unique http hmac authorization header](http://www.puremistake.com/3/)  
