#!/bin/bash

CTX=""
NS="-A"
OUT=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-c|kube-context|Kube context name|False|current context
-n|namespace|Namespace name|False|all namespace
-W| |Wide output|False|
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

CMD="kubectl $CTX get po $NS $OUT | grep -ivE 'running|completed'"

CNT=$(bash -c "$CMD" | wc -l)
printf "COUNT: $(( $CNT - 1 ))\n\n"

bash -c "$CMD"
