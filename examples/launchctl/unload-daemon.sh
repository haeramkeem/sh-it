#!/bin/bash

# `launchctl` is an equivalent cli tool with `systemctl` for MacOS
# Source: https://rsec.kr/?p=871

# For system-wide agent:
launchctl unload -w /Library/LaunchAgents/${SERVICE_NAME}.plist
# For user-scopped agent:
launchctl unload -w /Users/유저명/Library/LaunchAgents/${SERVICE_NAME}.plist
