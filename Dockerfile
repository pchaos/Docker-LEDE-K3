FROM ubuntu:14.04
MAINTAINER chaos "p19992003@gmail.com"

LABEL Description="ubuntu docker ubuntu 14.04 LTS x64 系统安装lede for K3"

ARG chinaLang=C.UTF-8
ARG ledehome=/home/ledeK3

#设置时区和默认语言
ENV LANG=$chinaLang \
 LANGUAGE=$chinaLang \
 LC_ALL=$chinaLang \
 tmpdir=/tmp \
 HOME=$ledehome \
 # TZ=Asia/Shanghai \
 DEBIAN_FRONTEND=noninteractive

#安装中文和英文语言支持
COPY sh/10_SetUpBasicEnvironment.sh \
     sh/10_ubuntusource.list \
  $tmpdir/

#替换apt源
RUN cp -f $tmpdir/10_ubuntusource.list /etc/apt/sources.list.d/docker.list && rm -f /etc/apt/sources.list

COPY archives $tmpdir/archives/

RUN $tmpdir/10_SetUpBasicEnvironment.sh

ENV PATH=/usr/local/bin:$PATH  \
 LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR $ledehome

COPY  lede $HOME/lede/
COPY sh/30_buildlede.sh $tmpdir/
RUN $tmpdir/30_buildlede.sh

COPY sh/40_buildclean.sh $tmpdir/


#
CMD "cd lede"
