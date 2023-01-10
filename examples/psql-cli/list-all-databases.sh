#!/bin/bash

CMD="psql -h $DB_HOST -p $DB_PORT -U $DB_USERNAME -c"

# Command `\l` prints all databases in the postgres
$CMD \\l
