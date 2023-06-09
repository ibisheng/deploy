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
docker rm nginx minio  redis mysql  editor_app -f  1 > /dev/null 2>&1
docker network create bisheng

export basedir=$1
export tag=v3.1
bash pullImage.sh $tag

echo "$1 v3.1" > .config

mkdir $1/service
mkdir $1/workspace
mkdir $1/workspace/resource
mkdir $1/nginx

cp -r service/* $1/service
cp -r workspace/* $1/workspace
cp -r resource/*  $1/workspace/resource
cp -r nginx/* $1/nginx


cd $1/service

#sysctl -w vm.max_map_count=262144
mkdir -p dgraph
mkdir -p minio/config minio/data
mkdir -p nginx/temp nginx/keys
touch  nginx/temp/error.log
touch  nginx/temp/access.log
chmod  755 nginx/temp/ -R
chmod  755 redis/config -R
#mkdir  nginx/config/conf.d
#sed -e 's/HOST/'$2'/g' ../workspace/config/bisheng.conf >  nginx/config/conf.d/bisheng.conf


#chmod 777 elasticsearch/ -R




cd $1/workspace
mkdir temp
mkdir logs



cd $basepath


bash upNodes.sh
bash init.sh 3 v3.1 $1
bash initAdminPass.sh bisheng
sleep 20
bash fontsService.sh
bash restart.sh
bash clearImages.sh

echo "你开始使用毕升Office即表示你同意链接 https://ibisheng.cn/apps/blog/posts/agreement.html 中的内容"
echo "在你的浏览器中打开 http://IP 即可访问毕升office，请参看安装文档激活毕升office"
