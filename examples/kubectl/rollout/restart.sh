#!/bin/bash

# This is how to rolling updates the pods
kubectl rollout restart $TARGET
