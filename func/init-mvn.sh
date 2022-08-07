#!/bin/bash

function init-mvn {
    local APPNAME=$1

    mvn archetype:generate \
        -DgroupId=$APPNAME \
        -DartifactId=$APPNAME \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.4 \
        -DinteractiveMode=false
}
