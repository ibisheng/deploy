#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "初始化类型"
    exit
fi
if [ ! -n "$2" ] ;then
    echo "必须指定容器标签"
    exit
fi

if [ ! -n "$3" ] ;then
    echo "指定安装目录"
    exit
fi
docker rm tools -f 1 > /dev/null 2>&1

docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/tools:$2

docker run --name tools --privileged  \
    -v $3:/workspace \
    -e RUN_ENV=docker \
    -e type=$1  \
    -e args=$4  \
    --net=bisheng  \
    registry.cn-zhangjiakou.aliyuncs.com/bisheng/tools:$2
