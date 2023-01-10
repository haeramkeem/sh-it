#!/bin/bash

# fmt: SENTINEL CONFIG GET ${PATTERN}
redis-cli -h $REDIS_HOST -p $REDIS_PORT -c 'SENTINEL CONFIG GET *'
