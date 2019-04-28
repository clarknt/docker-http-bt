# docker-http-bt

A selection of HTTP benchmarking tools embedded in a Docker container.

ab: https://httpd.apache.org/docs/2.4/programs/ab.html  
h2load: https://nghttp2.org/documentation/h2load-howto.html  
hey: https://github.com/rakyll/hey  
siege: https://www.joedog.org/siege-home/  
wrk: https://github.com/wg/wrk

## Build

```sh
$ docker build -t clarknt/docker-http-bt .
```

## Run

```sh
$ docker run -it clarknt/docker-http-bt /bin/bash
```

## Available commands

```sh
$ ab
$ h2load
$ hey
$ siege
$ wrk
```
