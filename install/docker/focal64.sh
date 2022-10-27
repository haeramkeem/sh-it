#!/bin/bash

# Installation script for Docker
# Maintained by @SaltWalks/coworking/2022
# Ref: https://docs.docker.com/engine/install/ubuntu/

# ARGs
VER=${1:+"=$1"}                 # $1: (OPTIONAL) Docker version

# Uninstall old version
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Install docker APT repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt-get update
sudo apt-get install -y docker-ce$VER docker-ce-cli$VER containerd.io docker-compose-plugin
sudo systemctl enable --now docker

# Post-installation
if [[ $USER != "root" ]]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "/home/$USER/.docker" -R
fi
