#!/bin/bash

if ! `pip3 --version &> /dev/null`; then
    echo "PIP is not installed" 1>&2
    exit 1
fi

pip3 install pipenv
