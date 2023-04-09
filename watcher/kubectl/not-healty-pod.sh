#!/bin/bash

CTX=""
KOPT=""

while getopts 'c:hw' opt; do
    case "$opt" in
        c)
            CTX=$OPTARG
            ;;
        w)
            KOPT="$KOPT -owide"
            ;;
        h)
            echo "REQUIRED ARGS:"
            echo "-c \${kubectl context}"
            echo "-w (same as '-o wide')"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

CMD="kubectl --context $CTX get po -A $KOPT | grep -ivE 'running|completed'"

CNT=$(bash -c "$CMD" | wc -l)
printf "COUNT: $CNT\n\n"

bash -c "$CMD"
