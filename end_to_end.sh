#!/bin/bash -e

ADDR=$(starknet-compile contract.cairo \
    --output=contract_compiled.json \
    --abi=contract_abi.json && starknet deploy --contract contract_compiled.json | grep address | awk '{print $3}' | tr -d \\.)

echo "Address: ${ADDR}"

# initialize
starknet invoke --address ${ADDR} --abi contract_abi.json --function initialize --inputs 3582577746677722431740023720320633876956623133930419590527228763639578535453 1000 2

sleep 2
# send commitment
starknet invoke --address ${ADDR} --abi contract_abi.json --function commit --inputs 2042536649993117364296625103999908576248412199423456520000316129072735862954 3261967588085170658862293428587059222438269839015135942205506249609410833918 383622200922475827691447562161872358420401626548600386003465214370732507533 166731635083539346047790634754225714698968525453493336513299480525988223874

sleep 2
# end commitment phase
starknet invoke --address ${ADDR} --abi contract_abi.json --function end_commitment_phase --inputs 1572514341211381639146744466808246693800547744347028176296700256447030933678 1978481093464076802357781694214950813691007442586456313662641217350746463161

sleep 2
# submit key
starknet invoke --address ${ADDR} --abi contract_abi.json --function submit_key --inputs 284697472624386009295839589936418945178 3224560532100339074740113102065711825633396413956247303725126014773482991514 2291167198440858938698896566523731692215085667023695658054610128415429789324

sleep 2
# claim drop
starknet invoke --address ${ADDR} --abi contract_abi.json --function claim_drop --inputs 2042536649993117364296625103999908576248412199423456520000316129072735862954 1409864911388159352029816777278381225970523230642148213329717159060539927901 0 1 0 1 1 0 0 1 0 0 0 1 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 0 0 1 1 0 1 1 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 1 0 1 1 0 1 1 1 1 0 1 1 0 1 0 1 0 1 0 0 1 0 0 1 1 1 0 0 1 0 1 0 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 1 0 0 0 1 0 1 1 1 1 0 1 0 1 1 1 0 1 0 0 0 1 1 0 1 0 1 1