#!/bin/bash

CTX=""
OPTS=""

while getopts 'c:wh' opt; do
    case "$opt" in
        c)
            CTX=$OPTARG
            ;;
        w)
            OPTS="$OPTS -owide"
            ;;
        h)
            echo "REQUIRED ARGS:"
            echo "-c \${kubectl context}"
            echo "-n \${node name}"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

kubectl --context $CTX get no $OPTS
echo
kubectl --context $CTX top no
