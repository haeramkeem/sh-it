#!/bin/bash

# Doc: https://redis.io/docs/management/security/acl/
redis-cli -h $HOST -p $PORT -c "ACL LIST"
