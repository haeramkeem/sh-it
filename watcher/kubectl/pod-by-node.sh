#!/bin/bash

NODE=""
CTX=""
NS="-A"
OUTPUT=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-c|kube-context|Kube context name|False|current context
-n|namespace|Namespace name|False|all namespace
-N|node|Target node name|True|
-W| |Wide output|False|
-h| |Help|False|
EOF
}

while getopts 'c:n:N:Wh' opt; do
    case "$opt" in
        c)
            CTX="--context $OPTARG"
            ;;
        n)
            NS="--namespace $OPTARG"
            ;;
        N)
            NODE=$OPTARG
            ;;
        W)
            OUTPUT="-o wide"
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

if [[ $NODE == "" ]]; then
    echo "Option '-N' is required" 1>&2
    exit 1
fi

kubectl $CTX get po $NS $OUTPUT --field-selector spec.nodeName=$NODE
