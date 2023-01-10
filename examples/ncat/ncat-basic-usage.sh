#!/bin/bash

# `nc` works exactly same; it's an alias for the ncat

# Server) Open socket & listen TCP
#   -l: Listen
#   -v: Verbose
#   -k: Multi-client
ncat -lvk $PORT

# Client) Connect & write data to the network TCP
ncat $IP $PORT

# Client) If u dont wanna keep STDIN open, use `|` or `<<<` to provide message to the STDIN
ncat $IP $PORT <<< "goodie"

# Client) Connect to the server only (no data sending)
ncat -z $IP $PORT