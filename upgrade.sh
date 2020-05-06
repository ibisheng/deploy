#!/usr/bin/env bash
git pull
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

bash pullImage.sh $tag

bash upNodes.sh


cp -r resource/icon/* $1/resource/icon

#sleep 60
#bash fontsService.sh

bash clearImages.sh
echo "你开始使用毕升Office即表示你同意链接 https://bishengoffice.com/apps/blog/posts/agreement.html 中的内容"
echo "在你的浏览器中打开 http://IP 即可访问毕升文档"
