#!/bin/bash

# Source: https://stackoverflow.com/a/70019007

# `source <(cat $FILE)` command in Linux bash is not working in MacOS (Bash 3.2)
# Instead, use
eval "$(cat $FILE)"
