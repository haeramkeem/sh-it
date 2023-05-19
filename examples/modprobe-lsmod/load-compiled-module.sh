#!/bin/bash

sudo mv ${MODULE_NAME}.ko /lib/modules/$(uname -r)/
sudo depmod
sudo modprobe ${MODULE_NAME}
