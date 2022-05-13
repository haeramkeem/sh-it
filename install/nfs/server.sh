#!/bin/bash

apt-get update
apt-get install nfs-kernel-server -y
if [[ $? != 0 ]]; then
    apt --fix-broken install -y
    apt-get install nfs-kernel-server -y
fi
mkdir -pv /nfs_shared
echo "/nfs_shared 192.168.1.0/24(rw,no_root_squash,no_subtree_check,sync)" >> /etc/exports
systemctl enable --now nfs-server
systemctl restart nfs-server
