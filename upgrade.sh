#!/usr/bin/env bash
git pull
var=$(cat .config)
arr=()
for element in $var
do
    arr[${#arr[*]}]=$element
done
echo ${arr[0]} ${arr[1]} ${arr[2]};
data=${arr[0]}
IP=${arr[1]}
tag=${arr[2]}

export basedir=$data
export tag=$tag

sh pullImage.sh $tag

cd $data/service

docker-compose up -d
cd -
sleep 30

cd $data/workspace

docker-compose up -d

cd -


cd $data/ningx

docker-compose up -d

cd -

sh restart.sh
