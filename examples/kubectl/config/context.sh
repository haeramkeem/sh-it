#!/bin/bash


# Get all contexts
kubectl config get-contexts

# Switch context
kubectl config use-context $CTX_NAME
