#!/bin/bash

# `\dt` prints all tables in the database
psql -h $HOST -p $PORT $DATABASE -c '\dt'
