#!/bin/bash

# Source: https://stackoverflow.com/a/19570794
# Source: https://stackoverflow.com/a/51994494
# `sshpass` must be installed
export SSHPASS="some_ssh_password"
nohup rsync --rsh="sshpass -e ssh -o StrictHostKeyChecking=no -l ${REMOTE_USERNAME}" ${RSYNC_OPRIONS} ${SOURCE_PATH} ${DESINATION_PATH} &
