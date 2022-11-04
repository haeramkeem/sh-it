#!/bin/bash

# Example source: https://kubernetes.io/docs/tasks/manage-daemon/rollback-daemon-set/

# List all revisions:
kubectl rollout history $TARGET

## See details for a revision:
kubectl rollout history $TARGET --revision $REVISION

# Roll back to a specific version:
kubectl rollout undo $TARGET --to-revision $REVISION

# Tip) save the reason for the change: this will help you to figure out why the $TARGET has been changed.
kubectl apply -f $WHATEVER --record
