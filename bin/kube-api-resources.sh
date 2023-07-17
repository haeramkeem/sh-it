#!/bin/sh

CTX=""
NS=""
NAMESPACED="true"
WIDE=""

while getopts 'c:n:A' opt; do
    case "$opt" in
        c)
            CTX="--context=$OPTARG"
            ;;
        n)
            NS="--namespace=$OPTARG"
            ;;
        A)
            NAMESPACED="false"
            ;;
        W)
            WIDE="-o wide"
            ;;
        h)
            echo "-c \${KUBECONFIG_CONTEXT}: Target kubeconfig context, default to current context"
            echo "-n \${NAMESPACE}: Target namespace, default to current namespace"
            echo "-A: Show non-namespaced resources"
            echo "-W: Wide option; Same w/ '-o wide' in kubectl"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2
            exit 1
            ;;
    esac
done

for gvk in $(kubectl $CTX $NS api-resources --namespaced=$NAMESPACED -oname); do
    echo "GVK: $gvk"
    kubectl $CTX $NS get $gvk $WIDE
    echo
done
