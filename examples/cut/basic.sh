#!/bin/bash

# Source: https://stackoverflow.com/a/38905821
cut -d "$DELIMITER" -f "$FIELD_NUM" <<< "$INPUT"
