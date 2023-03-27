#!/bin/bash

ENDPOINTS=""

while getopts "e:h" opt; do
    case $opt in
        e)
            ENDPOINTS=$(tr ',' ' ' <<< $OPTARG)
            ;;
        h)
            echo "REQUIRED ARGS:"
            echo "-e \${comma-separated endpoint list}"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2
            exit 1
            ;;
    esac
done

function tcpcheck() {
    local ip=$1
    local port=$2
    local CONN_MSG="CONN"
    local FAIL_MSG="FAIL"

    if `nc -z $ip $port &> /dev/null`; then
        echo -n $CONN_MSG
    else
        echo -n $FAIL_MSG
    fi
}

echo "HTTP | HTTPS | ENDPOINT"
echo "-----|-------|---------"
for e in $ENDPOINTS; do
    tcpcheck $e 80
    printf " | "
    tcpcheck $e 443
    printf "  | $e\n"
done
