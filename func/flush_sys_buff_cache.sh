#!/bin/bash

# Source: https://www.baeldung.com/linux/empty-buffer-cache#1-proc-sys-vm-drop-caches-command
function flush_sys_buff_cache() {
    echo 3 | sudo tee /proc/sys/vm/drop_caches
}
