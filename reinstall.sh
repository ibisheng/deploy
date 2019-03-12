#!/usr/bin/env bash

docker rm nginx 1 > /dev/null 2>&1
docker rm drive_full editor_app convert editor -f  1 > /dev/null 2>&1
docker rm minio dgraphServer dgraphZero redis dgraphRatel rabbit search mongod  1 > /dev/null 2>&1
docker network create bisheng 1 > /dev/null 2>&1

sh upgrade.sh
