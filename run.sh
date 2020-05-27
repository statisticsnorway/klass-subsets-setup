#!/usr/bin/env bash

if [ ! -d "gsim-raml-schema" ]; then
  git clone https://github.com/statisticsnorway/gsim-raml-schema.git
fi

if [ ! -f "gsim-raml-schema/graphqlschemas/schema.graphql" ]; then
  docker run -v "$1"/gsim-raml-schema:/raml-project statisticsnorway/raml-to-graphql-schema:latest
fi

docker pull statisticsnorway/lds-server:latest
docker-compose up -d
