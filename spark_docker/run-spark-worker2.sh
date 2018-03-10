#!/usr/bin/env bash

docker run \
	--name spark-worker2 \
	--net spark-cluster \
	-p 8082:8081 \
	-d spark-worker:latest spark://spark-driver:7077
