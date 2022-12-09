#!/bin/bash

set -e

echo "BUILD"
./protostar build
echo "TEST"
./protostar test
echo "DECLARE"
OUT=$(./protostar declare ./build/main.json --json)
echo "DEPLOY"
CLASS_HASH=$(echo $OUT | jq -r ".class_hash")
OUT=$(./protostar deploy $CLASS_HASH --inputs 100 --json)
echo "CALL"
CONTRACT_ADDRESS=$(echo $OUT | jq -r ".contract_address")
./protostar call --contract-address $CONTRACT_ADDRESS --function get_balance --json

echo "DONE"
