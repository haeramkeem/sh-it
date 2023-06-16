#!/bin/bash

# Source: https://www.geeksforgeeks.org/column-command-in-linux-with-examples/
cat << EOF | column -t -s '|'
No|Dish|Y/N
01|Idli|Y
02|Samosa|Y
EOF
