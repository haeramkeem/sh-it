#!/bin/bash

CTX=""

while getopts 'c:h' opt; do
    case "$opt" in
        c)
            CTX=$OPTARG
            ;;
        h)
            echo "REQUIRED ARGS:"
            echo "-c \${kubectl context}"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

CMD="kubectl --context $CTX get po -A | grep -ivE 'running|completed'"

CNT=$(bash -c "$CMD" | wc -l)
printf "COUNT: $CNT\n\n"

bash -c "$CMD"
