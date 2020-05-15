#!/usr/bin/env bash

if output=$(jq --help);
then
  echo "using jq on PATH"
  for i in $(find examples -type f); do
    ENTITY=$(echo "$i" | sed 's:examples/::' | sed 's:\([^_]*\).*:\1:')
    ID=$(jq -r .id "$i")
    curl -X PUT http://localhost:9090/ns/"${ENTITY}"/"${ID}" -d "@$i" -H "Content-Type: application/json"
  done
elif [ -f "jq-win64.exe" ];
then
  echo "using jq-win64.exe"
  for i in $(find examples -type f); do
    ENTITY=$(echo "$i" | sed 's:examples/::' | sed 's:\([^_]*\).*:\1:')
    ID=$(./jq-win64.exe -r .id "$i")
    curl -X PUT http://localhost:9090/ns/"${ENTITY}"/"${ID}" -d "@$i" -H "Content-Type: application/json"
  done
else
  echo "FAILED: 'jq' is not on PATH nor found locally in project folder as 'jq-win64.exe'."
fi

wait
