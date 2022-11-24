#!/bin/bash

# Source: https://stackoverflow.com/a/58018440
# $CONTAINER_NAME refers to the value of 'spec.template.spec.containers.name'
kubectl set image $TARGET $CONTAINER_NAME=$IMAGE
