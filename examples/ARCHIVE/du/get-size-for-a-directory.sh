#!/bin/bash

# Source: https://linuxize.com/post/how-get-size-of-file-directory-linux/
# -h: human-readable (print size with GiB, MiB, etc)
# -s: show only root dir size
du -sh ${DIR}
