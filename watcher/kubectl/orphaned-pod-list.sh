#!/bin/bash

CTX=""
NS=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-c|kube-context|Kube context name|False|current context
-n|namespace|Namespace name|False|current context namespace
-h| |Help|False|
EOF
}

while getopts 'c:n:h' opt; do
    case "$opt" in
        c)
            CTX="--context $OPTARG"
            ;;
        n)
            NS="--namespace $OPTARG"
            ;;
        h)
            helpme
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2
            exit 1
            ;;
    esac
done

kubectl $CTX $NS get pod -o yaml \
    | yq '.items.[].metadata | [{"name":.name,"ownerReferences":.ownerReferences}]' \
    | grep null -B1 \
    || echo "ORPHANED POD NOT FOUND"
