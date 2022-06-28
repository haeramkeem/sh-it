#!/bin/bash

# Installation script for kube-wtfs (kubelet, kubectl, kubeadm)
# Managed by @SaltWalks/coworking/2022
# Ref: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/

# ARGs
VER=${1:+"-$1"}                 # $1: (OPTIONAL) Kubernetes version

# Install prerequisites
sudo yum install -y epel-release

# -------------------------
# ContainerD
# -------------------------
# Install containerd if not installed
if ! `ctr --version &> /dev/null`; then
    bash <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/install/rhel8/docker.sh) -c
fi

# Configurations
# - Load 'overlay' and 'br_netfilter' for containerd
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# - Configurations for containerd
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' \
    /etc/containerd/config.toml
sudo systemctl restart containerd

# -------------------------
# Kubernetes
# -------------------------
# Install kube repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

# Install Kubelet, Kubeadm, Kubectl
sudo yum install -y kubelet$VER kubeadm$VER kubectl$VER --disableexcludes=kubernetes
sudo systemctl enable --now kubelet

# Configurations
# - Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# - Kubernetes requires the disabling of the partition swapping
sudo swapoff -a
sudo sed -i.bak -r 's/(.+\s+swap\s+.+)/#\1/' /etc/fstab

# - Configurations for CRICTL
sudo crictl config runtime-endpoint unix:///var/run/containerd/containerd.sock
sudo crictl config image-endpoint unix:///var/run/containerd/containerd.sock

# - Configure iptables for kubernetes-CRI
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system
sudo systemctl restart kubelet

# Post installation
echo ""
echo ""
echo "# Installing Kubelet, Kubeadm and Kubectl done"
echo "# As this installation script doesn't cover initiating the K8s cluster,"
echo "# you have to initiate it manually"
echo "# Recommended post-installation script:"
echo "# - Do 'sudo tee -a /etc/hosts <<< \"\$NODE_IP \$NODE_HOSTNAME\"'for all nodes to resolve cluster nodes"
echo "# - Do 'kubeadm init' in control plane node"
echo "# - Do 'kubeadm join ...' in worker node"
echo ""
echo ""
