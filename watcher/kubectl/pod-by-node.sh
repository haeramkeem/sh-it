#!/bin/bash

NODE=""
CTX=""

while getopts 'c:n:h' opt; do
    case "$opt" in
        n)
            NODE=$OPTARG
            ;;
        c)
            CTX=$OPTARG
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

kubectl --context $CTX get po -A --field-selector spec.nodeName=$NODE
