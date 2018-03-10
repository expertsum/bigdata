#!/usr/bin/env bash

docker run \
	--name spark-worker3 \
	--net spark-cluster \
	-p 8083:8081 \
	-d spark-worker:latest spark://spark-driver:7077
