#!/bin/bash

# The pod will be terminated right after the container is exited.
# The example below is sample command for executing shell in the pod
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm /bin/sh
