#!/usr/bin/env bash
if [ ! -n "$1" ] ;then
    echo "请输入控制台初始化密码"
    exit
fi


var=$(cat .config)
arr=()
for element in $var
do
    arr[${#arr[*]}]=$element
done
echo ${arr[0]} ${arr[1]};
data=${arr[0]}
tag=${arr[1]}

docker rm tools -f 1 > /dev/null 2>&1


docker run --name tools --privileged  \
    -v $data/workspace:/workspace \
    -e RUN_ENV=docker \
    -e type=32  \
    -e pass=$1  \
    --net=bisheng  \
    registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$tag
