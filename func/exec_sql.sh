#!/bin/bash

function exec_sql {
    SQL=$(cat -)

    if [ -z $DB_USERNAME ]; then
        echo "Abort: DB_USERNAME not provided as env" 1>&2
        exit 1
    fi

    if [ -z $DB_PASSWORD ]; then
        echo "Abort: DB_PASSWORD not provided as env" 1>&2
        exit 1
    fi

    if [ -z $DB_DATABASE ]; then
        echo "Abort: DB_DATABASE not provided as env" 1>&2
        exit 1
    fi

    if [ -z $SQL ]; then
        echo "Abort: SQL not provided to STDIN" 1>&2
        exit 1
    fi

    docker exec mariadb \
        mysql -u$DB_USERNAME -p$DB_PASSWORD $DB_DATABASE -e "$SQL" \
        echo $SQL
}
