#!/bin/bash

set -e

# ../../crypto/protostar/dist/protostar/protostar test tests/test_counter.cairo --disable-hint-validation

echo "BUILD"
./protostar build
echo "DECLARE"

OUT=$(./protostar declare ./build/main.json --json)
echo "DEPLOY"
CLASS_HASH=$(/Users/karolbisztyga/.asdf/installs/python/3.9.14/bin/python -c "import sys, json; print(json.loads(sys.argv[1])['class_hash'])" $OUT)
echo "class hash: $CLASS_HASH"
./protostar deploy $CLASS_HASH
