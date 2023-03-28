#!/bin/bash

# Source: https://kerneltalks.com/virtualization/how-to-reset-iptables-to-default-settings
sudo iptables -P INPUT ACCEPT \
    && sudo iptables -P FORWARD ACCEPT \
    && sudo iptables -P OUTPUT ACCEPT \
    && sudo iptables -F INPUT \
    && sudo iptables -F OUTPUT \
    && sudo iptables -F FORWARD \
    && sudo iptables -t nat -F \
    && sudo iptables -t mangle -F \
    && sudo iptables -F \
    && sudo iptables -X
