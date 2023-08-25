#!/bin/bash

# Source: https://blog.scottlowe.org/2020/01/25/manually-loading-container-images-with-containerd
ctr -n k8s.io images import ${OCI_IMAGE_TAGBALL}
