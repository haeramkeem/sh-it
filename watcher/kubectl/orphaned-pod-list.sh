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

KUBE_CMD="kubectl $CTX $NS get pod -o yaml"
YQ_QUERY=".items.[] | select(.metadata.ownerReferences == null) | .metadata.name"
if [[ "$(bash -c "$KUBE_CMD | yq '$YQ_QUERY' | wc -l | xargs")" != "0" ]]; then
    bash -c "$KUBE_CMD | yq '$YQ_QUERY'"
else
    echo "Orphaned pod not found."
fi
