#!/bin/bash

set -e

# Redirect to the official Kustomize installation script
bash <(curl -sL https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh)

# Move binary
sudo mv -v kustomize /usr/local/bin/
