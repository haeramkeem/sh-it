#!/bin/bash

# Image tagging
sudo ctr -n k8s.io images tag $OLD $NEW

# Image push
sudo ctr -n k8s.io images push $IMG
