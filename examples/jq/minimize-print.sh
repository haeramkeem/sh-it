#!/bin/bash

# Source: https://stackoverflow.com/a/32457197
cat $FILE | jq -c '.'
