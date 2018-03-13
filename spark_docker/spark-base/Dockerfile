FROM openjdk:8-alpine

ARG spark_dir=./spark-bin

RUN set -ex && \
    apk upgrade --no-cache && \
    apk add --no-cache bash tini libc6-compat coreutils procps python3 && \
    mkdir -p /opt/spark && \
    mkdir -p /opt/spark/work-dir && \
    touch /opt/spark/RELEASE && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh && \
    ln -sv /usr/bin/python3 /usr/bin/python && \
    chgrp root /etc/passwd && chmod ug+rw /etc/passwd

COPY $spark_dir/jars /opt/spark/jars
COPY $spark_dir/bin /opt/spark/bin
COPY $spark_dir/sbin /opt/spark/sbin
COPY $spark_dir/conf /opt/spark/conf
COPY $spark_dir/examples /opt/spark/examples
COPY $spark_dir/data /opt/spark/data
COPY $spark_dir/python /opt/spark/python

ENV SPARK_HOME /opt/spark

WORKDIR /opt/spark/work-dir
