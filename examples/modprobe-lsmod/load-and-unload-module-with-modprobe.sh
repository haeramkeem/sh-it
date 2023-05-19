#!/bin/bash

# Load module
sudo modprobe ${MODULE_NAME}

# Unload module
sudo modprobe -r ${MODULE_NAME}
