#!/bin/bash

# Show ARP cache table
arp
# or use `-a` to show additional info
arp -a

# Delete ARP cache
arp -d $HOST
