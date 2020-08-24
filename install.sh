#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "必须指定一个安装目录"
    exit
fi

if [ ! -x "$1" ] ;then
     mkdir "$1"
fi
basepath=$(cd `dirname $0`; pwd)
echo "copy resource data"

rm -rf $1/*
docker rm nginx minio dgraphServer dgraphZero redis dgraphRatel rabbit mongod  drive_full editor_app convert editor -f  1 > /dev/null 2>&1
docker network create bisheng

export basedir=$1
export tag=dev_base
bash pullImage.sh $tag

echo "$1 dev_base" > .config

mkdir $1/service
mkdir $1/workspace
mkdir $1/resource
mkdir $1/nginx

cp -r service/* $1/service
cp -r workspace/* $1/workspace
cp -r resource/* $1/resource
cp -r nginx/* $1/nginx


cd $1/service

#sysctl -w vm.max_map_count=262144
mkdir -p dgraph
mkdir -p mongod/db mongod/log
touch  mongod/log/mongod.log
mkdir -p minio/config minio/data
#mkdir -p elasticsearch/data elasticsearch/logs
mkdir -p nginx/temp nginx/keys
touch  nginx/temp/error.log
touch  nginx/temp/access.log
#mkdir  nginx/config/conf.d
#sed -e 's/HOST/'$2'/g' ../workspace/config/bisheng.conf >  nginx/config/conf.d/bisheng.conf


#chmod 777 elasticsearch/ -R




cd $1/workspace
mkdir temp
mkdir logs



cd $basepath


bash upNodes.sh
bash init.sh 7 dev_base $1
sleep 20
bash init.sh 8 dev_base $1
sleep 30
bash fontsService.sh
bash restart.sh
bash clearImages.sh

echo "你开始使用毕升Office即表示你同意链接 https://ibisheng.cn/apps/blog/posts/agreement.html 中的内容"
echo "在你的浏览器中打开 http://IP 即可访问毕升office，请参看安装文档激活毕升office"
