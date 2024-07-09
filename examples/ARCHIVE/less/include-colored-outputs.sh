#!/bin/bash

# How to include color codes in less command
# Source: http://mockingeye.com/piping-ls-through-less-with-colors-on-mac-os/
ls -al | less -R
# Or
ls -al | less -r
# Or
ls -al | less -L
