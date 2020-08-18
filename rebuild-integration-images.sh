#!/usr/bin/env bash

./generate-schema.sh

docker build . -f Dockerfile-lds olved/lds-with-graphql:latest
docker push olved/lds-with-graphql:latest
docker build . -f Dockerfile-pg olved/pg-for-lds:latest
docker push olved/pg-for-lds:latest