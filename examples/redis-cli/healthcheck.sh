#!/bin/bash

redis-cli -h $REDIS_HOST -p $REDIS_PORT -c 'PING'
