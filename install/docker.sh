#!/bin/bash

# Ref: https://docs.docker.com/engine/install/ubuntu/

# Uninstall old version
sudo apt-get remove docker docker-engine docker.io containerd runc

# Install prerequisites
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Install docker apt repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable --now docker

# Post-installation
UNAME=${1:-$USER}

sudo groupadd docker
sudo usermod -aG docker $UNAME
newgrp docker
sudo chown "$UNAME":"$UNAME" /home/"$UNAME"/.docker -R
sudo chmod g+rwx "/home/$UNAME/.docker" -R
