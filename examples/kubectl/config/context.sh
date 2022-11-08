#!/bin/bash


# Get all contexts
kubectl config get-contexts

# Switch context
kubectl config use-context $CTX_NAME

# Rename context
kuebctl config rename-context $OLD_CTX_NAME $NEW_CTX_NAME
