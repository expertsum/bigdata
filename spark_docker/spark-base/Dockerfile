# Based on https://github.com/apache/spark/blob/master/resource-managers/kubernetes/docker/src/main/dockerfiles/spark/Dockerfile

FROM openjdk:8-alpine

ARG SPARK_BIN=./spark-bin

ENV SPARK_HOME /opt/spark
ENV SPARK_NO_DAEMONIZE 1

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat coreutils procps python3 && \
    mkdir -p $SPARK_HOME && \
    mkdir -p $SPARK_HOME/work-dir && \
    touch $SPARK_HOME/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    ln -sv /usr/bin/python3 /usr/bin/python && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

COPY ./conf $SPARK_HOME/conf
COPY $SPARK_BIN/jars $SPARK_HOME/jars
COPY $SPARK_BIN/bin $SPARK_HOME/bin
COPY $SPARK_BIN/sbin $SPARK_HOME/sbin
COPY $SPARK_BIN/examples $SPARK_HOME/examples
COPY $SPARK_BIN/data $SPARK_HOME/data
COPY $SPARK_BIN/python $SPARK_HOME/python

WORKDIR $SPARK_HOME/work-dir

ENTRYPOINT ["tini", "--"]
