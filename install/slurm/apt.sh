#!/bin/bash

# Install slurm for controller
sudo apt-get install -y slurmctld
# Install slurm for compute node
sudo apt-get install -y slurmd

# NOTE: Munge will be installed as a dependency for dlurm; make sure UID and GID for munge running user (default munge) to be equal and the munge key (default /etc/munge/munge.key) to be synced across the cluster
