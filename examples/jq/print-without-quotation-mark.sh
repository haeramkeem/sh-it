#!/bin/bash

# Source: https://stackoverflow.com/a/44656583
# Use `-r` or `--raw-output` option
jq -r '.path' ${FILE}
