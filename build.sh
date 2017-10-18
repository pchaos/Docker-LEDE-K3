#!/usr/bin/bash

# 当数一非空时，改变buildName
[ $1 ]  && buildName=$1
[ ! $buildName ] && buildName="lean:ledeLast"

#下载相关资源
[ ! -d lede ] && git clone https://github.com/coolsnowwolf/lede.git &

[ -d lede ] && echo "git pull coolsnowwolf lede .........." && cd lede && git pull && cd ..

chmod a+x sh/*.sh
chmod a+x *.sh

set -e
echo "building .............................. $buildName"
docker build -t=$buildName .

echo "build .............................. done"
echo --------------------------------------------------
echo run in shell:
echo "run docker: ./start.sh"
echo "in docker run: make menuconfig"
echo --------------------------------------------------

