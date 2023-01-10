#!/bin/bash

# Source: https://jeffkreeftmeijer.com/git-combine/

# If u wanna merge dst repo <- src repo ...
# Go to the destination repository
cd $DST_REPO_DIR

# Fetch metadata
git remote add $SRC_REPO_NAME $SRC_REPO_DIR
git fetch $SRC_REPO_NAME

# Merge
# `--allow-unrelated-histories` option is the key
git merge $SRC_REPO_NAME/$SRC_REPO_BRANCH --allow-unrelated-histories
