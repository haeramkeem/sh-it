#!/bin/sh

# Source: https://linux.die.net/man/8/groupadd
# `-r`: Create system group
sudo groupadd -r -g $GID $GROUP_NAME

# Source: https://linux.die.net/man/8/useradd
# `-r`: Create system user
# `-m`: Create home folder
sudo useradd -r -m -g $GID -u $UID $USERNAME
