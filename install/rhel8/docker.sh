#!/bin/bash

# Install Docker on CentOS/RHEL Linux
# Managed by @SaltWalks/coworking/2022
# Ref: https://docs.docker.com/engine/install/centos/

# ARGs
VER=${1:+"-$1"}     # $1: Optional - docker version

# Uninstall old one
sudo yum remove -y  docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine

# Add repo
sudo yum install -y yum-utils
sudo yum-config-manager \
                    --add-repo \
                    https://download.docker.com/linux/centos/docker-ce.repo

# Install docker
sudo yum install -y docker-ce$VER \
                    docker-ce-cli$VER \
                    containerd.io \
                    docker-compose-plugin
sudo systemctl start docker

# Post-installation
if [[ $USER != "root" ]]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "/home/$USER/.docker" -R
fi
