#!/bin/bash

ENDPOINTS=""

function helpme() {
cat << EOF | column -t -s '|'
ARG|VALUE|DESCRIPTION|REQUIRED|DEFAULT
-e|comma-separated endpoint list|List of endpoints to check|True|
-h| |Help|False|
EOF
}

while getopts "e:h" opt; do
    case $opt in
        e)
            ENDPOINTS=$(tr ',' ' ' <<< $OPTARG)
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

if [[ $ENDPOINTS == "" ]]; then
    echo "Option '-e' required" 1>&2
    exit 1
fi

function icmpcheck() {
    local ip=$1
    local OK_MSG="CONN"
    local FAIL_MSG="FAIL"

    if `ping -c1 -W1 $ip &> /dev/null`; then
        echo -n $OK_MSG
    else
        echo -n $FAIL_MSG
    fi
}

function tcpcheck() {
    local ip=$1
    local port=$2
    local OK_MSG="CONN"
    local FAIL_MSG="FAIL"

    if `nc -z $ip $port &> /dev/null`; then
        echo -n $OK_MSG
    else
        echo -n $FAIL_MSG
    fi
}

function certcheck() {
    local ip=$1
    local port=$2
    local OK_MSG="VALID"
    local FAIL_MSG="INVALID"

    if `true | openssl s_client -connect $ip:$port 2>/dev/null | openssl x509 -noout -checkend 0`; then
        echo -n $OK_MSG
    else
        echo -n $FAIL_MSG
    fi
}

function http_code_check() {
    local ip=$1
    local scheme="https"
    curl -s -o /dev/null -I -w "%{http_code}" $scheme://$ip
}

function print_table() {
    echo "ENDPOINT|IP|80/TCP|443/TCP|CERTIFICATE|HTTPCODE"
    for e in $ENDPOINTS; do
        echo "${e}|$(icmpcheck $e)|$(tcpcheck $e 80)|$(tcpcheck $e 443)|$(certcheck $e 443)|$(http_code_check $e)"
    done
}

print_table | column -t -s '|'
