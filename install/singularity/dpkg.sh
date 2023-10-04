#!/bin/bash

VERSION='4.0.0'
DISTRO='jammy'
ARCH='amd64'
curl -L https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce_${VERSION}-${DISTRO}_${ARCH}.deb -o singularity.deb
sudo dpkg -i singularity.deb
