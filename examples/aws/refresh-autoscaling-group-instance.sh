#!/bin/bash

aws autoscaling start-instance-refresh \
    --no-paginate \
    --auto-scaling-group-name $AWS_ASG_NAME
