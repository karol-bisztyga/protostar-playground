#!/bin/bash

set -e

# ../../crypto/protostar/dist/protostar/protostar test tests/test_counter.cairo --disable-hint-validation

../../crypto/protostar/dist/protostar/protostar build
../../crypto/protostar/dist/protostar/protostar deploy ./build/main.json --inputs initial_value=100

# ➜  ~/Desktop/workspace/tmp/protostar-test-2 git:(deploy) ✗ ./execute_scripts.sh      git:(deploy|✚3…3 
# 19:01:25 [INFO] Built the project successfully                                                         
# 19:01:25 [INFO] Execution time: 1.22 s
# 19:01:26 [WARNING] `protostar deploy` will be removed in the future release                            
# https://docs.starknet.io/docs/Blocks/transactions/#deploy-transaction
# 19:01:27 [INFO] Deploy transaction was sent.
# Contract address: 0x03342310a9e3777495c967544faa4626ae578f7278d4b36a8a6838d38dbab044
# Transaction hash: 0x053723121e4f4aafeb63d400ed2a75ee901691f8839f8786a2cae889210e380c

# https://goerli.voyager.online/contract/0x03342310a9e3777495c967544faa4626ae578f7278d4b36a8a6838d38dbab044
# 19:01:27 [INFO] Execution time: 1.78 s