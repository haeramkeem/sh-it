#!/bin/bash

# Install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# Install kube repo
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update

# Install Kubelet, Kubeadm, Kubectl
VERSION=${1:+"=$1"}
sudo apt-get install -y kubelet$VERSION kubeadm$VERSION kubectl$VERSION
