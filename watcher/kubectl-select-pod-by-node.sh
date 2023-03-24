#!/bin/bash

NODE=""
CTX=""

while getopts 'c:n:' opt; do
    case "$opt" in
        n)
            NODE=$OPTARG
            ;;
        c)
            CTX=$OPTARG
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

kubectl --context $CTX get po -A --field-selector spec.nodeName=$NODE
