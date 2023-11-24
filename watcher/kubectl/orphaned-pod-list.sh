#!/bin/bash

CTX=""
NS=""
OPT=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-c|kube-context|Kube context name|False|current context
-n|namespace|Namespace name|False|current context namespace
-W| |Wide output (same as '-o wide')|False|
-h| |Help|False|
EOF
}

while getopts 'c:n:Wh' opt; do
    case "$opt" in
        c)
            CTX="--context $OPTARG"
            ;;
        n)
            NS="--namespace $OPTARG"
            ;;
        W)
            OPT="$OPT -o wide"
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

KUBE_CMD="kubectl $CTX $NS get pod -o yaml"
YQ_QUERY=".items.[] | select(.metadata.ownerReferences == null) | .metadata.name"
if [[ "$(bash -c "$KUBE_CMD | yq '$YQ_QUERY' | wc -l | xargs")" != "0" ]]; then
    kubectl $CTX $NS get pod $(bash -c "$KUBE_CMD | yq '$YQ_QUERY'") $OPT
else
    echo "Orphaned pod not found."
fi
