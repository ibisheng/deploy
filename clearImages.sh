#!/usr/bin/env bash
docker rmi -f  `docker images | grep '<none>' | awk '{print $3}'`