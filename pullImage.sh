#!/usr/bin/env bash
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/drive_full:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$1

docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/dgraph:v1.0.5

docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/redis:6.2.8
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/minio:latest
