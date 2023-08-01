#!/bin/bash

# Source: https://itslinuxfoss.com/add-delete-samba-user-under-linux

# User add
sudo smbpasswd -a ${USER_NAME}

# User del
sudo smbpasswd -x ${USER_NAME}
