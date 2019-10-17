#!/usr/bin/env bash
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/drive_full:$1 > $2/drive_full.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$1 > $2/editor_app.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor:$1 > $2/editor.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/convert:$1 > $2/convert.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/tools:$1 > $2/tools.tar

docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/dgraph:v1.0.5 > $2/graph_v1.0.5.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/mongo:3.6 > $2/mongo_3.6.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/redis:4.0 > $2/redis_4.0.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/rabbitmq:3.6 > $2/rabbitmq_3.6.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/minio:latest > $2/minio_latest.tar
