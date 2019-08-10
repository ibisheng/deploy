#!/usr/bin/env bash
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/drive_full:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/convert:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/tools:$1

docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/dgraph:v1.0.5
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/mongo:3.6
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/redis:4.0
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/rabbitmq:3.6
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/minio:latest
