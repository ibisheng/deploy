#!/usr/bin/env bash
var=$(cat .config)
arr=()
for element in $var 
do
    arr[${#arr[*]}]=$element
    #echo $element
done
echo ${arr[0]} ${arr[1]};

