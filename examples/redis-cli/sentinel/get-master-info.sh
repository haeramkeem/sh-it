#!/bin/bash

# Print master list
redis-cli -h $REDIS_HOST -p $REDIS_PORT -c 'SENTINEL MASTERS'

# Print all info for a master
redis-cli -h $REDIS_HOST -p $REDIS_PORT -c 'SENTINEL MASTER mymaster'

# Print master addr
redis-cli -h $REDIS_HOST -p $REDIS_PORT -c 'SENTINEL get-master-addr-by-name mymaster'
