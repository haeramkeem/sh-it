#!/bin/bash

# Source:

# How to convert plain-text to cloud-init password
mkpasswd -m sha-512

# ...inject password from stdin
echo good | mkpasswd -m sha-512 -s
