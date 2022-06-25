#!/bin/bash

## Defaults
VERSION="v4.25.3"
OS="linux"
ARCH="amd64"

## Options
## '-v ${VERSION}'  : Version
## '-o ${OS}'       : OS name
## '-a ${ARCH}'     : Architecture
while getopts "v:o:a:" opt; do
    case "$opt" in
        v) VERSION="$OPTARG" ;;
        o) OS="$OPTARG" ;;
        a) ARCH="$OPTARG" ;;
    esac
done

## Installation
sudo curl -Lo /usr/bin/yq \
    https://github.com/mikefarah/yq/releases/download/${VERSION}/yq_${OS}_${ARCH} && \
    sudo chmod +x /usr/bin/yq
