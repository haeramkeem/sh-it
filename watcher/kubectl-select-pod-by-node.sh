#!/bin/bash

NODE=""

while getopts 'n:' opt; do
    case "$opt" in
        n)
            NODE=$OPTARG
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

kubectl get po -A --field-selector spec.nodeName=$NODE
