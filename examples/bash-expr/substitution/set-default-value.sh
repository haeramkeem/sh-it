#!/bin/bash

# Prints $DEFAULT_VALUE if $1 is not provided
echo ${1:-$DEFAULT_VALUE}
