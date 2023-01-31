#!/bin/bash

# Source: https://mikefarah.gitbook.io/yq/operators/length
yq '.path.to.list | length' $YAML_FILE
