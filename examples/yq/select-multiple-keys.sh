#!/bin/bash

# Source: https://github.com/mikefarah/yq/issues/287#issuecomment-1276579225
cat file.yaml | yq '.[] | [{"name": .name, "status": .status}]'
