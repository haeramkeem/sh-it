#!/bin/bash

# Source: https://stackoverflow.com/a/1252010

# Replace file content
cat $FILE | tr ${OLD_CHAR} ${NEW_CHAR}

# Replace STDIN
tr ${OLD_CHAR} ${NEW_CHAR} <<< "${STRING}"
