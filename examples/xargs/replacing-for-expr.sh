#!/bin/bash

# `xargs -n1` is equal to
# `for ... in ...; do ...; done`

# thus, the command below
echo  "file1 file2 file3" |  xargs -n1 touch

# is equal to
for f in $(echo "file1 file2 file3"); do
    touch $f
done

# and is equal to
touch file1
touch file2
touch file3
