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

rm -rf $data/workspace/fonts/*

cp -r workspace/fonts/* $data/workspace/fonts

bash init.sh 64 $tag $data

sed -i 's/workspace\/workspace/workspace/g' $data/workspace/fonts/nutrition.js