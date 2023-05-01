#!/bin/bash

# Source: https://unix.stackexchange.com/a/53629
yum-config-manager --disable repository
yum-config-manager --add-repo http://www.example.com/example.repo
