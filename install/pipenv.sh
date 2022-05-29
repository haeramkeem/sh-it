#!/bin/bash

if ! `pip3 --version &> /dev/null`; then
    sudo apt-get update
    sudo apt-get install python3-pip
fi

pip3 install pipenv
