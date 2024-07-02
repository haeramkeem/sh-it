#!/bin/bash

# Source: https://stackoverflow.com/a/22727211
echo $INPUT | rev | cut -d "$DELIMITER" -f 1 | rev
