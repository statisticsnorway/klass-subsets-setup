#!/usr/bin/env bash

if output=$(jq --help);
then
  jqv=jq
elif [ -f "jq-win64.exe" ];
then
  jqv=./jq-win64.exe
else
  echo "FAILED: 'jq' is not on PATH, nor found locally in project folder as 'jq-win64.exe'."
  exit 126
fi

for i in $(find examples -type f); do
  ENTITY=$(echo "$i" | sed 's:examples/::' | sed 's:\([^_]*\).*:\1:')
  ID=$("$jqv" -r .id "$i")
  curl -X POST http://localhost:9090/ns/"${ENTITY}"/"${ID}" -d "@$i" -H "Content-Type: application/json"
done

wait