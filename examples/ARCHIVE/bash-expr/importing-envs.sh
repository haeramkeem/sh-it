#!/bin/sh

# `.` is a official POSIX standard for importing the variables and functions
. $FILE

# `source` is an alias for `.` in bash (or zsh) -> BUT NOT IN SH
source $FILE
