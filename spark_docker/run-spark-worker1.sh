#!/usr/bin/env bash

docker run \
	--name spark-worker1 \
	--net spark-cluster \
	-p 8081:8081 \
	-d spark-worker:latest spark://spark-driver:7077
