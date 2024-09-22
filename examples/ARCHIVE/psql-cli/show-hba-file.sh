#!/bin/bash

# Source: https://askubuntu.com/a/256711
psql -h $HOST -p $PORT -c "SHOW hba_file;"
