#!/bin/bash

# Source: https://linuxhint.com/bash_if_else_examples
if $CONDITION; then
    $IF_EXPRS
elif $CONDITION; then
    $ELSE_IF_EXPRS
else
    $ELSE_EXPRS
fi
