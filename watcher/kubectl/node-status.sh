#!/bin/bash

CTX=""
OUT=""
NODE=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-c|kube-context|Kube context name|False|current context
-N|node|Target node name|False|all nodes
-W| |Wide output|False|
-h| |Help|False|
EOF
}

while getopts 'c:N:Wh' opt; do
    case "$opt" in
        c)
            CTX=$OPTARG
            ;;
        N)
            NODE=$OPTARG
            ;;
        W)
            OUT="-o wide"
            ;;
        h)
            helpme
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

kubectl --context $CTX get no $NODE $OUT
echo
kubectl --context $CTX top no $NODE
