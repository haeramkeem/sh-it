#!/bin/bash

CTX=""
NS="default"

while getopts 'c:n:h' opt; do
    case "$opt" in
        n)
            NS=$OPTARG
            ;;
        c)
            CTX=$OPTARG
            ;;
        h)
            echo "REQUIRED ARGS:"
            echo "-c \${kubectl context}"
            echo "-n \${namespace name}"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

kubectl --context $CTX --namespace $NS get pod -o yaml \
    | yq '.items.[].metadata | [{"name":.name,"ownerReferences":.ownerReferences}]' \
    | grep null -B1 \
    || echo "ORPHANED POD NOT FOUND"
