#!/bin/bash

# Source: https://cprayer.github.io/posts/tls-cert-secret-create-and-replace
# Create secret
kubectl create secret tls ${secret-tls-name} --key ${tls-key} --cert ${tls-cert} -n ${namespace} --save-config
# Create secret YAML manifest
kubectl create secret tls ${secret-tls-name} --key ${tls-key} --cert ${tls-cert} -n ${namespace} --dry-run=client -o yaml > secret.yaml
# Apply secret
kubectl create secret tls ${secret-tls-name} --key ${tls-key} --cert ${tls-cert} -n ${namespace} --dry-run=client -o yaml | kubectl apply -f -
