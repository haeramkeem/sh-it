#!/bin/bash

# Source: https://man7.org/linux/man-pages/man1/journalctl.1.html

# journalctl hacks
#   `-p`, `--priority`: Set log severities
#   `--facility`: Set log facilities
journalctl -p 0 --facility 0
