#!/bin/bash

# Show supported log levels
sudo dmesg --help

# Filtering
sudo dmesg --level $LOG_LEVEL
