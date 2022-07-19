#!/bin/bash

# Defaults
VER="v3.9.1"
OS="linux"
ARCH="amd64"

# ARGs
while getopts 'v:o:a:' opt; do
    case "$opt" in
        v) VER=${OPTARG} ;;                 # (OPTIONAL) - Helm version
        o) OS=${OPTARG} ;;                  # (OPTIONAL) - OS name
        a) ARCH=${OPTARG} ;;                # (OPTIONAL) - Arch
        i) INSTALL_DIR=${OPTARG} ;;         # (OPTIONAL) - Install directory
    esac
done

# Install
curl -L https://get.helm.sh/helm-$VER-$OS-$ARCH.tar.gz -o helm.tar.gz
tar -xzvf helm.tar.gz
sudo cp -v $OS-$ARCH/helm /usr/local/bin/helm
sudo ln -s /usr/local/bin/helm /usr/bin/helm

# Additional install path
if [[ -z "$INSTALL_DIR" ]]; then
    cp -v $OS-$ARCH/helm $INSTALL_DIR/helm
fi

# Clean up
rm -rf helm.tar.gz
rm -rf $OS-$ARCH/
