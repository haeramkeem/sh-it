#!/bin/bash

export ES_URL="192.168.1.101:29200"

function health_check {
    curl -X GET $ES_URL/_cluster/health?pretty
}
