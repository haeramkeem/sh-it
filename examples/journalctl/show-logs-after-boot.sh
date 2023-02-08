#!/bin/bash

# Check boot index
journalctl --list-boots

# Show log
journalctl -b ${BOOT_INDEX} -n ${LINE_NUM:-10}
