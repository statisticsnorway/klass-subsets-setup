#!/usr/bin/env bash

if [ ! -d "jq-win64.exe" ];
then
  for i in $(find examples -type f); do
    ENTITY=$(echo "$i" | sed 's:examples/::' | sed 's:\([^_]*\).*:\1:')
    ID=$(jq -r .id "$i")
    curl -i -X PUT http://localhost:9090/ns/${ENTITY}/${ID} --data-binary "@$i" &
  done
else
  for i in $(find examples -type f); do
    ENTITY=$(echo "$i" | sed 's:examples/::' | sed 's:\([^_]*\).*:\1:')
    ID=$(./jq-win64.exe -r .id "$i")
    curl -i -X PUT http://localhost:9090/ns/${ENTITY}/${ID} --data-binary "@$i" &
  done
fi
