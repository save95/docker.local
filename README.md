#docker.local#

目前只支持 laravel5 环境

##命令##

`make init` 初始化环境。主要建立需要使用的目录、设置权限、下载使用到的 docker 基础镜像

`make pull` 下载使用到的 docker 基础镜像

`make download` 下载使用到的 PHP 扩展 PREL 包

`make learn` twang2218 的个人 docker 教程

`make clean` 清理废弃资源。主要清理 runtime 目录、<none> 镜像、废弃的 docker 挂载卷

##启动 docker 容器##

`docker-compose up`

##一般启动方式##

```bash
make init
# 执行下载可能因为国内网络问题，无法直接下载，请自动FQ
make download
make clean

docker-compose up
```

##目录说明##

`container/php/download` php扩展下载目录

`~/.docker` docker 运行挂载目录

`~/.docker/nginx/log` nginx 运行日志目录

`~/.docker/nginx/conf.d` nginx 站点配置目录。可以复制 _container/nginx/config/nginx.conf-website_ 
文件到此目录，需要以 __.conf__ 结尾

`~/.docker/php/log` php 运行日志目录

`~/.docker/database/percona` mysql 数据库文件

`~/.docker/percona/conf.d` mysql 数据库配置文件

`~/webroot` web站点目录

