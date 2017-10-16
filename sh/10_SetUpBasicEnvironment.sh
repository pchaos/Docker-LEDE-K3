#!/bin/bash
echo start ................................. $0

# 修复交互报错
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# instal update
echo .............................. apt-get update --fix-missing
apt-get update --fix-missing
apt-get install -y apt-utils

RUNLEVEL=1

debdir="/tmp/archives"
mkdir $HOME
mkdir $HOME/lede

cd $HOME
if [ ! -f $debdir/git_1%3a2.7.4-0ubuntu1.1_amd64.deb ]; then
    echo .............................. apt-get install language-pack-zh-hant language-pack-zh-hans language-pack-en
    #apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en build-essential git wget sudo vim git bzip2 -d -o dir::cache=./
    apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en
    apt-get install -y build-essential git wget sudo vim git bzip2
    #cp archives/ $debdir/
    #rm -rf archives/
fi

# install development environment
apt-get install -y build-essential
apt-get install -y asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev
apt-get install -y perl

echo done ................................. $0
