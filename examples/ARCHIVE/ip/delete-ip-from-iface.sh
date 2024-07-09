#!/bin/bash

# Source: https://www.baeldung.com/linux/remove-ip-interface
ip addr del $IP_CIDR dev $DEVICE_NAME
