#!/bin/bash

# Source: https://unix.stackexchange.com/a/367495
# Basic usage
sudo journalctl -k
sudo journalctl -t kernel

# Follow
sudo journalctl -kf
