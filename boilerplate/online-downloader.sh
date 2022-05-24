#!/bin/bash

# Offline-stuff online downloader
# Copyright (c) SaltWalks/Coworking 2022
# Source: https://github.com/haeramkeem/sh-it/tree/main/boilerplate/online-downloader.sh

# This boilerplate is to download all the required stuffs for adding something to the Kubernetes cluster
# Here's how to use:
# 1. Download this boilerplate
# 2. Fill out the scripts as you want
# 3. Run this on the online node (via Vagrant or something)
# 4. Copy the generated directory to the offline node (via SCP or something)
# 5. Run 'install.sh' file to install

# ENVs
STUFF=""
WORKDIR="/home/vagrant/$STUFF"
VERSION=""

# Working directories
mkdir -pv $WORKDIR
mkdir -pv $WORKDIR/debs
mkdir -pv $WORKDIR/bins
mkdir -pv $WORKDIR/images
mkdir -pv $WORKDIR/charts
mkdir -pv $WORKDIR/values
mkdir -pv $WORKDIR/etcs

# Install dependencies
bash <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/install/docker.sh)
bash <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/install/helm.sh)

# Import functions
source <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/func/dl_deb_pkg.sh)
source <(curl -sL https://raw.githubusercontent.com/haeramkeem/sh-it/main/func/save_img_from_yaml.sh)

# FILL OUT THE 'AS YOU WANT's

# FILL OUT THE 'install.sh' CONTENT
touch $WORKDIR/install.sh
chmod 711 $WORKDIR/install.sh
cat <<EOF >> $WORKDIR/install.sh
EOF
