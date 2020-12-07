#!/usr/bin/env bash

rm -rf gsim-raml-schema
git clone https://github.com/statisticsnorway/gsim-raml-schema.git

if [ ! -f "gsim-raml-schema/graphqlschemas/schema.graphql" ]; then
  docker run -v "$1"/gsim-raml-schema:/raml-project --rm statisticsnorway/raml-to-graphql-schema:latest
fi

cp -r "$1"/gsim-raml-schema/graphqlschemas .
rm -rf gsim-raml-schema
