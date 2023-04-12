#!/bin/bash

# Source: https://unix.stackexchange.com/a/700484
function show_cgroup_cache_status() {
    sudo find /sys/fs/cgroup -name 'memory.stat' \
        | xargs -n1 grep -HE '^(file|cache) ' \
        | sort -nk 2
}
