FROM alpine:latest
MAINTAINER Sergey Kandyla <skandyla@gmail.com>
RUN apk add --update alpine-sdk perl      && \
    cd /tmp                               && \
    git clone -b 4.0.2 https://github.com/wg/wrk   && \
    cd wrk                                && \
    make                                  && \
    mv ./wrk /usr/local/bin               && \
    rm -rf /tmp/wrk                       && \
    apk del --purge alpine-sdk perl       && \
    apk add libgcc

WORKDIR /data
ENTRYPOINT ["wrk"]
