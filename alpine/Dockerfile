FROM alpine:latest as build
RUN apk add --update alpine-sdk perl
RUN cd /tmp                               && \
    git clone -b 4.0.2 https://github.com/wg/wrk
RUN cd /tmp/wrk                           && \
    make

FROM alpine:latest
MAINTAINER Sergey Kandyla <skandyla@gmail.com>
COPY --from=build /tmp/wrk/wrk /usr/local/bin/
RUN apk add --update libgcc
WORKDIR /data
ENTRYPOINT ["wrk"]
