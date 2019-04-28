# A selection of HTTP benchmarking tools embedded in a Docker container
# https://github.com/clarknt/docker-http-bt

FROM ubuntu:18.04

RUN \
    apt-get -qqy update >/dev/null && \
    apt-get -qqy upgrade >/dev/null

# utils
RUN apt-get -qqy install curl wget >/dev/null 

# ab, siege, h2load
RUN apt-get -qqy install apache2-utils siege nghttp2-client >/dev/null

# hey
RUN \
    mkdir -p /opt/hey && \
    wget -q -O /opt/hey/hey https://storage.googleapis.com/jblabs/dist/hey_linux_v0.1.2 && \
    chmod +x /opt/hey/hey && \
    export PATH=$PATH:/opt/hey
ENV PATH="${PATH}:/opt/hey"

# wrk
RUN \
    apt-get -qqy install build-essential libssl-dev >/dev/null && \
    mkdir -p /opt/wrk/build && \
    wget -q -O /opt/wrk/build/wrk.tar.gz https://github.com/wg/wrk/archive/4.1.0.tar.gz && \
    tar -C /opt/wrk/build --strip 1 -zxf /opt/wrk/build/wrk.tar.gz && \
    make -s -C /opt/wrk/build >/dev/null && \
    mv /opt/wrk/build/wrk /opt/wrk && \
    rm -rf /opt/wrk/build && \
    export PATH=$PATH:/opt/wrk
ENV PATH="${PATH}:/opt/wrk"