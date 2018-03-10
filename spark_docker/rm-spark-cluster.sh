#!/usr/bin/env bash

docker network rm spark-cluster
docker rm spark-driver
docker rm spark-worker1
docker rm spark-worker2
docker rm spark-worker3
