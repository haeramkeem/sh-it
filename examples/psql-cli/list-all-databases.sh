#!/bin/bash

# Command `\l` prints all databases in the postgres
psql -h $DB_HOST -p $DB_PORT -U $DB_USERNAME -c '\l'
