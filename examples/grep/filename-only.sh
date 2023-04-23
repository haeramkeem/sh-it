#!/bin/bash

# To print filenames that contains the ${PATTERN}
grep -l ${PATTERN} ${FILES}
# For example,
grep -l 'pattern' ./*

# To print filenames that DO NOT contain the ${PATTERN}
grep -L ${PATTERN} ${FILES}
# For example,
grep -L 'pattern' ./*
