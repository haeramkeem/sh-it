#!/bin/bash

# Find loadable module .ko file in /lib/modules
# Loadable modules are in /etc/modules/${KERNEL_VERSION}/...
sudo find /lib/modules/$(uname -r) | grep ${MODULE_NAME}
