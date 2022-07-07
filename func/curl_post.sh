#!/bin/bash

## Usage
#   cat << EOF | curl_post http://localhost:8080
#   {
#       "holy": "moly"
#   }
#   EOF

function curl_post {
    STDIN=$(cat -)
    BODY=$(sed ':a; N; s/[[:space:]]//g; ta' <<< $STDIN) # Remove whitespace
    URL=$1

    if [ -z "$URL" ]; then
        echo "Abort: URL is not provided in arg[1]" 1>&2
        exit 1
    fi

    if [ -z "$BODY" ]; then
        echo "Abort: request body is not provided with STDIN" 1>&2
        exit 1
    fi

    curl -d "$BODY" \
        -H "Content-Type: application/json" \
        -X POST \
        -v \
        $URL
    echo ""
}
