#!/bin/bash

CMD="psql -h $DB_HOST -p $DB_PORT -U $DB_USERNAME -c"

# Command `\du` prints all databases in the postgres
$CMD \\du

# `\du+` for more information
$CMD \\du+
