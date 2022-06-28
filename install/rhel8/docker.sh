#!/bin/bash

# Install Docker on CentOS/RHEL Linux
# Managed by @SaltWalks/coworking/2022
# Ref: https://docs.docker.com/engine/install/centos/

# ARGs
while getopts 'v:c' opt; do
    case "$opt" in
        v) VER=${OPTARG:+"-$OPTARG"} ;; # (OPTIONAL) - docker version
        c) CONTAINERD="true" ;;         # Install containerd only
    esac
done

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

# Install containerd
if [[ $CONTAINERD == "true" ]]; then
    sudo yum install containerd.io
    sudo systemctl enable --now containerd.io
    sudo systemctl restart containerd.io
    exit 0
fi

# Install docker
sudo yum install -y docker-ce$VER \
                    docker-ce-cli$VER \
                    containerd.io \
                    docker-compose-plugin
sudo systemctl enable --now docker
sudo systemctl restart docker

# Post-installation
if [[ $USER != "root" ]]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "/home/$USER/.docker" -R
fi
