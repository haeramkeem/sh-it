#!/bin/bash

# Source: https://stackoverflow.com/questions/21334348/how-to-count-items-in-json-object-using-command-line
jq '.path.to.list[] | length' $JSON_FILE_PATH
