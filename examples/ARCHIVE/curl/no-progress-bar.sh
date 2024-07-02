#!/bin/bash

# Source: https://stackoverflow.com/a/7373922

# STDOUT:
curl -s $URL

# File:
curl -s $URL 2> /dev/null > $FILE_NAME
