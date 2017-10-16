#!/bin/bash
echo  .............................. $0

export LEDEK3=$HOME/lede
export LD_LIBRARY_PATH=./:/usr/local/lib:/usr/lib
export CPLUS_INCLUDE_PATH=/usr/include/
ln -s /usr/lib/x86_64-linux-gnu/libsqlite3.so.0.8.6  /usr/lib/x86_64-linux-gnu/libsqlite3.so
[ ! -f /usr/lib/x86_64-linux-gnu/libhdf5_serial.so ] && \
  ln -s /usr/lib/x86_64-linux-gnu/libhdf5.so /usr/lib/x86_64-linux-gnu/libhdf5_serial.so && \
  ln -s /usr/lib/x86_64-linux-gnu/libhdf5_hl.so /usr/lib/x86_64-linux-gnu/libhdf5_serial_hl.so

cd $HOME
# if not exists lede then download
[ ! -d lede ] && git clone https://github.com/coolsnowwolf/lede.git
cd lede
./scripts/feeds update -a
./scripts/feeds install -a

#make menuconfig

echo .............................. $0 Done
