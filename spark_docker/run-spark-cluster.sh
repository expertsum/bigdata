#!/usr/bin/env bash

docker network create spark-cluster

./run-spark-driver.sh
./run-spark-worker1.sh
./run-spark-worker2.sh
./run-spark-worker3.sh
