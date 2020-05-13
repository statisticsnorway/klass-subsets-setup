#!/usr/bin/env bash

if [ ! -d "gsim-raml-schema" ]; then
  git clone https://github.com/statisticsnorway/gsim-raml-schema.git
fi

if [ ! -d "gsim-raml-schema/graphqlschemas" ]; then
  docker run -v "$1"/gsim-raml-schema:/raml-project statisticsnorway/raml-to-graphql-schema:latest
elif [ ! -f "gsim-raml-schema/graphqlschemas/schema.graphql" ]; then
  docker run -v "$1"/gsim-raml-schema:/raml-project statisticsnorway/raml-to-graphql-schema:latest
fi

docker-compose up -d
