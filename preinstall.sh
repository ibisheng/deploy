#!/usr/bin/env bash
yum -y update
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker
systemctl enable docker

wget  https://github.com/docker/compose/releases/download/1.25.4/docker-compose-Linux-x86_64
mv docker-compose-Linux-x86_64  >> /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
