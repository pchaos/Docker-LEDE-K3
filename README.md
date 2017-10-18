# lede-K3-Docker
lean lede for 斐讯 K3,Docker编译环境搭建


使用前请确保已安装docker环境
磁盘剩余空间最少20G，越大越好。否则可能编译过程中磁盘空间耗尽。


docker默认磁盘空间为10G，编译过程中可能会耗尽空间，编译失败。需要修改docker配置文件 /etc/docker/daemon.json后重启生效。配置文件参见：
{
  "storage-driver": "devicemapper",
  "storage-opts": [
     "dm.basesize=20G"
  ]
}


archivesmu目录下的.config_K3 .config_x86分别为斐逊路由器K3，x86平台配置文件样例，供参考


lede代码更新见：https://github.com/coolsnowwolf/lede
