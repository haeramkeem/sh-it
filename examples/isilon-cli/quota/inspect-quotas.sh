#!/bin/bash

# Listing OneFS SmartQuota
isi quota quotas list

# Detailed output
isi quota quotas list -v

# Get only one quota
isi quota quotas list -v --path=$QUOTA_ROOT_DIRECTORY
