#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "初始化类型"
    exit
fi
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

sh init.sh $1 $tag $data
