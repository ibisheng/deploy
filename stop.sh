#!/usr/bin/env bash
var=$(cat .config)
arr=()
for element in $var
do
    arr[${#arr[*]}]=$element
done
echo ${arr[0]} ${arr[1]};
data=${arr[0]}
tag=${arr[1]}

export basedir=$data
export tag=$tag

cd $data/service
echo "up service"
docker-compose stop


cd -

cd $data/workspace
echo "up apps"
docker-compose stop


cd -

cd $data/nginx
echo "up nginx"
docker-compose stop

