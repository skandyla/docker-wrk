# Docker image for wrk
#
FROM       ubuntu:latest
MAINTAINER Sergey Kandyla <skandyla@gmail.com>

RUN apt-get -y update \
    && apt-get -y install build-essential curl

RUN WRK_VERSION=$(curl -L https://github.com/wg/wrk/raw/master/CHANGES 2>/dev/null | \
                  egrep '^wrk' | head -n 1 | awk '{print $2}') \
    && echo $WRK_VERSION \
    && mkdir /opt/wrk \
    && cd /opt/wrk \
    && curl -L https://github.com/wg/wrk/archive/$WRK_VERSION.tar.gz | \
       tar zx --strip 1 \
    && make \
    && cp wrk /usr/local/bin/

RUN apt-get clean \
    && apt-get -y remove build-essential curl \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /opt/wrk/


WORKDIR /data
ENTRYPOINT ["wrk"]
CMD ["--help"]


    

