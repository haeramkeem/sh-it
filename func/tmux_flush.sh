#!/bin/bash

function tmux_flush() {
    tmux ls \
        | grep -v attached \
        | tr ':' ' ' \
        | awk '{print $1}' \
        | xargs -n1 tmux kill-session -t
}
