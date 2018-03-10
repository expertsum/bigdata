FROM openjdk:8-alpine

ARG spark_dir=spark-2.3.0-bin-hadoop2.7

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat coreutils procps && \
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/work-dir \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

COPY $spark_dir/jars /opt/spark/jars
COPY $spark_dir/bin /opt/spark/bin
COPY $spark_dir/sbin /opt/spark/sbin
COPY $spark_dir/conf /opt/spark/conf
COPY $spark_dir/examples /opt/spark/examples
COPY $spark_dir/data /opt/spark/data

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir
