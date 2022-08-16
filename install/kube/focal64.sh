#!/bin/bash

# Installation script for Kube-wtfs (Kubelet, Kubeadm, and Kubectl)
# Maintained by @SaltWalks/coworking/2022
# Ref: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

# ARGs
VER=${1:+"=$1"}                 # $1: (OPTIONAL) Kubernetes version

# Install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# -------------------------
# ContainerD
# -------------------------
# Install containerd if not installed
if ! `ctr --version &> /dev/null`; then
    bash <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/install/docker.sh)
fi

# Configurations for ContainerD
# - Load 'overlay' and 'br_netfilter'
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# - Save and modify configurations
sudo mkdir -pv /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' \
    /etc/containerd/config.toml
sudo sed -i 's$sandbox_image = "k8s.gcr.io/pause:3.6"$sandbox_image = "k8s.gcr.io/pause:3.7"$g' \
    /etc/containerd/config.toml
sudo systemctl restart containerd

# -------------------------
# Kubernetes
# -------------------------
# Install kube repo
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update

# Install Kubelet, Kubeadm, Kubectl
sudo apt-get install -y kubelet$VERSION kubeadm$VERSION kubectl$VERSION
sudo systemctl enable --now kubelet

# Configurations for Kubernetes
# - Modify configurations for CRICTL
cat <<EOF | sudo tee -a /etc/crictl.yaml
runtime-endpoint: unix:///var/run/containerd/containerd.sock
image-endpoint: unix:///var/run/containerd/containerd.sock
timeout: 2
pull-image-on-create: false
EOF

# - Configure iptables for kubernetes-CRI
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system

# - Kubernetes requires the disabling of the partition swapping
sudo swapoff -a
sudo sed -i.bak -r 's/(.+\s+swap\s+.+)/#\1/' /etc/fstab
sudo systemctl restart kubelet

# Post installation
echo ""
echo ""
echo "# Installing Kubelet, Kubeadm and Kubectl done"
echo "# As this installation script doesn't cover initiating the K8s cluster,"
echo "# you have to initiate it manually"
echo "# Recommended post-installation script:"
echo "# - Do 'kubeadm init' in control plane node"
echo "# - Do 'kubeadm join ...' in worker node"
echo ""
echo ""
