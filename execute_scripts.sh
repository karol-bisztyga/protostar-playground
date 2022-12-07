#!/bin/bash

set -e

echo "BUILD"
./protostar build
echo "TEST"
./protostar test
echo "DECLARE"

OUT=$(./protostar declare ./build/counter.json --json)
echo "DEPLOY"
CLASS_HASH=$(/Users/karolbisztyga/.asdf/installs/python/3.9.14/bin/python -c "import sys, json; print(json.loads(sys.argv[1])['class_hash'])" $OUT)
# echo "class hash: $CLASS_HASH"
OUT=$(./protostar deploy $CLASS_HASH --inputs 100 --json)
echo "CALL"
CONTRACT_ADDRESS=$(/Users/karolbisztyga/.asdf/installs/python/3.9.14/bin/python -c "import sys, json; print(json.loads(sys.argv[1])['contract_address'])" $OUT)
./protostar call --contract-address $CONTRACT_ADDRESS --function get_balance --json

echo "DONE"
