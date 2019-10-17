#!/usr/bin/env bash
apt-get -y update
apt-get -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get -y  update
apt-get -y install docker-ce docker-ce-cli containerd.io

systemctl start docker
systemctl enable docker

curl -L \
   https://get.daocloud.io/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` \
   -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
