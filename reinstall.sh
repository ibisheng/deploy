#!/usr/bin/env bash
echo "remove container nginx"
docker rm nginx -f 1 > /dev/null 2>&1
echo "remove apps "
docker rm drive_full editor_app convert editor -f  1 > /dev/null 2>&1
echo "remove service"
docker rm minio dgraphServer dgraphZero redis dgraphRatel rabbit search mongod -f  1 > /dev/null 2>&1
docker network create bisheng 1 > /dev/null 2>&1

sh upgrade.sh
