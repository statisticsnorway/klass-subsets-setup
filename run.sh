#!/usr/bin/env bash

docker-compose down

./generate-schema.sh "$1"

docker pull statisticsnorway/lds-server:1.0.9
docker-compose up -d
