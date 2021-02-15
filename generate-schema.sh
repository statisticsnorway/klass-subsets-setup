#!/usr/bin/env bash

rm -rf klass-subsets-schema
git clone https://github.com/statisticsnorway/klass-subsets-schema.git

if [ ! -f "klass-subsets-schema/graphqlschemas/schema.graphql" ]; then
  cd klass-subsets-schema || exit
  ./update_dependencies.sh
  ./generate_gql.sh "$1"
  cd ..
fi

cp -r "$1"/klass-subsets-schema/graphqlschemas .
rm -rf klass-subsets-schema
