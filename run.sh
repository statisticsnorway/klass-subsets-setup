#!/usr/bin/env bash

docker-compose down

if [ ! -d "gsim-raml-schema" ]; then
  git clone https://github.com/statisticsnorway/gsim-raml-schema.git
fi

if [ ! -f "gsim-raml-schema/graphqlschemas/schema.graphql" ]; then
  docker run -v "$1"/gsim-raml-schema:/raml-project --rm statisticsnorway/raml-to-graphql-schema:latest
fi

docker pull statisticsnorway/lds-server:1.0.9
docker-compose up -d
