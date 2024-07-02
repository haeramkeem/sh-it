#!/bin/bash

# Source:

# Check file exists
if test -f $FILE_PATH; then
    echo exists
fi

if [ -f $FILE_PATH ]; then
    echo exists
fi

if [[ -f $FILE_PATH ]]; then
    echo exists
fi

# Check directory exists
if test -d $FILE_PATH; then
    echo exists
fi

if [ -d $FILE_PATH ]; then
    echo exists
fi

if [[ -d $FILE_PATH ]]; then
    echo exists
fi
