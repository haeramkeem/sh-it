#!/bin/bash

source ./.env

function health_check {
    curl -X GET $ES_URL/_cluster/health?pretty
}
