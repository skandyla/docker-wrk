FROM alpine:3.4
MAINTAINER Sergey Kandyla <skandyla@gmail.com>
WORKDIR /tmp
RUN apk add --update alpine-sdk perl libssl1.0 && \
    git clone https://github.com/wg/wrk && \ 
    cd wrk && \ 
    make && \
    mv ./wrk /usr/local/bin && \
    rm -rf /tmp/wrk && \
    apk del --purge alpine-sdk && \
    apk add libgcc

ENTRYPOINT ["/usr/local/bin/wrk"]
