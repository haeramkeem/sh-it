#!/bin/bash

# Command `\du` prints all databases in the postgres
psql -h $DB_HOST -p $DB_PORT -U $DB_USERNAME -c '\du'

# `\du+` for more information
psql -h $DB_HOST -p $DB_PORT -U $DB_USERNAME -c '\du+'
