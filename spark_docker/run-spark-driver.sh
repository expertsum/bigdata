#!/usr/bin/env bash

docker run \
	--name spark-driver \
	--net spark-cluster \
	-p 8080:8080 \
	-p 7077:7077 \
	-d spark-driver:latest
