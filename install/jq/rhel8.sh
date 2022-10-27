#!/bin/bash

if ! `jq --version &> /dev/null`; then
    sudo dnf install -y jq
fi
