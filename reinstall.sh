#!/usr/bin/env bash
echo "remove container nginx"
docker rm nginx -f 1 > /dev/null 2>&1
echo "remove apps "
docker rm drive_full editor_app convert editor -f  1 > /dev/null 2>&1
echo "remove service"
docker rm minio dgraphServer dgraphZero redis dgraphRatel rabbit search mongod -f  1 > /dev/null 2>&1
docker network create bisheng 1 > /dev/null 2>&1


var=$(cat .config)
arr=()
for element in $var
do
    arr[${#arr[*]}]=$element
done
echo ${arr[0]} ${arr[1]};
data=${arr[0]}
tag=${arr[1]}

echo "copy nginx config"
mv $data/service/nginx/config/conf.d/bisheng.conf $data/service/nginx/config/conf.d/bisheng.conf.bak
cp service/nginx/config/conf.d/bisheng.conf  $data/service/nginx/config/conf.d -r

mv .config
echo "$data latest" > .config

bash upgrade.sh
