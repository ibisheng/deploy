#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "必须指定一个安装目录"
    exit
fi

if [ ! -n "$1" ] ;then
    echo "必须指定本机IP"
    exit
fi

echo "copy resource data"

rm -rf $1/*
docker rm minio dgraphServer dgraphZero redis dgraphRatel rabbit search mongoddb  drive_full editor_app convert editor -f

export basedir=$1
export tag=free
sh pullImage.sh $tag

echo $1 > .config
echo $2 >> .config
echo "free" >> .config

mkdir $1/{service,workspace}

cp -r service/* $1/service
cp -r workspace/* $1/workspace


cd $1/service

sysctl -w vm.max_map_count=262144
mkdir -p dgraph
mkdir -p mongod/{db,log}
touch  mongod/log/mongod.log
mkdir -p rabbitmq/{data}
mkdir -p minio/{config,data}
mkdir -p elasticsearch/{data,logs}

chmod 777 elasticsearch/ -R


docker-compose up -d

cd -



#cp config.sample.yml config.yml

sed -e 's/IP/'$2'/g' workspace/config/config.sample.yml > $1/workspace/config/config.yml

sleep 60

cd tools

./init -config=$1/workspace/config/config.yml -type=7 -resource=resource/



cd $1/workspace
mkdir temp
mkdir logs

docker-compose up -d

sleep 20

cd -

cd tools

./init -config=$1/workspace/config/config.yml -type=8 -resource=resource/
