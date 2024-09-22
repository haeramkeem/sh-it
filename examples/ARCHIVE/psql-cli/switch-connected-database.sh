#!/bin/bash

# Source: https://www.postgresqltutorial.com/postgresql-administration/postgresql-show-tables/
psql -h $HOST -p $PORT $DATABASE1 -c '\c DATABASE2'
