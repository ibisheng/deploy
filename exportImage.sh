#!/usr/bin/env bash
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$1 > $2/editor_app.tar

docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/mysql:8-oracle > $2/mysql.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/rejson:2.0.9 > $2/redis_4.0.tar
docker save registry.cn-zhangjiakou.aliyuncs.com/bisheng/minio:RELEASE.2021-10-10T16-53-30Z.fips > $2/minio.tar
