#!/bin/bash

# Source: https://stackoverflow.com/a/1951752

# To create a new symlink (will fail if symlink exists already):
ln -s /path/to/file /path/to/symlink

# To create or update a symlink:
ln -sf /path/to/file /path/to/symlink
