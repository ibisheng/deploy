#!/usr/bin/env bash
yun -y update
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io    

systemctl start docker


curl -L \
   https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` \
   -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose   
