set -e
export FORCE_UNSAFE_CONFIGURE=1 
cp  /tmp/archives/.config_K3 $HOME/lede/.config
cd $HOME/lede/
make -j1 V=s
