#!/bin/bash

#Source: https://www.cyberciti.biz/faq/linux-change-user-group-uid-gid-for-all-owned-files/

# Change UID
sudo usermod -u ${UID} ${USERNAME}
# Change GID
sudo groupmod -g ${GID} ${GROUPNAME}
