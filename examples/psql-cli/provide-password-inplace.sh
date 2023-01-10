#!/bin/bash

# Source: https://stackoverflow.com/a/6405296
psql -h $HOST -p $PORT -c "PGPASSWORD=$PASSWORD psql -U $USERNAME $DATABASE"
