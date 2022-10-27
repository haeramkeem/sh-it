#!/bin/bash

# Have to install `nfs-common` to every worker nodes
#   Ref: https://stackoverflow.com/a/35786577
apt-get update
apt-get install nfs-common -y
if [[ $? != 0 ]]; then
    apt --fix-broken install -y
    apt-get install nfs-common -y
fi
