#!/bin/bash
docker images |grep lede

# 当数一非空时，改变buildName
[ $1 ]  && buildName=$1
[ ! $buildName ] && buildName="lean:ledeLast"

set -e
vpara=" -v $(pwd)/archives:/tmp/archives"
docker run \
       -i $vpara \
       -t $buildName \
       /bin/bash

echo .............................. Bye
