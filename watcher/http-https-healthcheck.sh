#!/bin/bash

ENDPOINTS=""
CONN_MSG="CONN"
FAIL_MSG="FAIL"

while getopts "e:" opt; do
    case $opt in
        e)
            ENDPOINTS=$(tr ',' ' ' <<< $OPTARG)
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2
            exit 1
            ;;
    esac
done

echo "HTTP | HTTPS | ENDPOINT"
echo "-----|-------|---------"
for e in $ENDPOINTS; do
    nc -z $e 80 &>/dev/null && echo -n $CONN_MSG || echo -n $FAIL_MSG
    printf " | "
    nc -z $e 443 &>/dev/null && echo -n $CONN_MSG || echo -n $FAIL_MSG
    printf "  | $e\n"
done
