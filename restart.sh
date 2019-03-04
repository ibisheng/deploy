#!/usr/bin/env bash
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

cd $data/workspace
docker-compose restart drive_full editor_app editor convert