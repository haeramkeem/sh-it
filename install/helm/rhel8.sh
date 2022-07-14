#!/bin/bash

# Defaults
VER="v3.9.1"
OS="linux"
ARCH="amd64"
INSTALL_DIR="/usr/local/bin"

# ARGs
while getopts 'v:o:a:' opt; do
    case "$opt" in
        v) VER=${OPTARG:+"-$OPTARG"} ;;     # (OPTIONAL) - Helm version
        o) OS=${OPTARG} ;;                  # (OPTIONAL) - OS name
        a) ARCH=${OPTARG} ;;                # (OPTIONAL) - Arch
        i) INSTALL_DIR=${OPTARG} ;;         # (OPTIONAL) - Install directory
    esac
done

# Install
curl -LO https://get.helm.sh/helm-$VER-$OS-$ARCH.tar.gz
sudo mv $OS-$ARCH/helm $INSTALL_DIR/helm

# Clean up
rm -rf helm-$VER-$OS-$ARCH.tar.gz
rm -rf $OS-$ARCH/
