#!/bin/bash

# Source: https://stackoverflow.com/a/1252010
cat $FILE | tr -d ${CHAR_TO_DELETE}
