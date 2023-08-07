#!/bin/bash

# Source: https://stackoverflow.com/a/18000433
cat $FILE | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g"
