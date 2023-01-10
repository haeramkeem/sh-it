#!/bin/bash

# Source: https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/

# `kubectl diff` command shows the expected changes using `kubectl apply --dry-run=server`
kubectl diff -f $MANIFEST
