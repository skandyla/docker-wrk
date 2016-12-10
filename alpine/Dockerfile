FROM alpine:3.4
MAINTAINER Sergey Kandyla <skandyla@gmail.com>
RUN apk add --update alpine-sdk perl      && \
    cd /tmp                               && \
    git clone https://github.com/wg/wrk   && \
    cd wrk                                && \
    make                                  && \
    mv ./wrk /usr/local/bin               && \
    rm -rf /tmp/wrk                       && \
    apk del --purge alpine-sdk perl       && \
    apk add libgcc

ENTRYPOINT ["/usr/local/bin/wrk"]
