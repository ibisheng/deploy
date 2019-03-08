#!/usr/bin/env bash
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/drive_full:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor_app:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/editor:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/convert:$1
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/search:free
docker pull registry.cn-zhangjiakou.aliyuncs.com/bisheng/tootls:${tag}