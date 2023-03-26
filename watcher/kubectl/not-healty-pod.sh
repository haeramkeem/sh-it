#!/bin/bash

CTX=""

while getopts 'c:' opt; do
    case "$opt" in
        c)
            CTX=$OPTARG
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
