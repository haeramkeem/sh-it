#!/bin/bash

# Attach label to the object
kubectl label $TARGET $LABEL_KEY=$LABEL_VALUE

# Detach label from the object
# Source: https://reuvenharrison.medium.com/how-to-delete-a-kubernetes-label-4dc33648c021
kubectl label $TARGET $LABEL_KEY-
