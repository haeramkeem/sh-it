#!/bin/bash

# Reference: https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html

function init_mvn {
    local APPNAME=$1

    mvn archetype:generate \
        -DgroupId=$APPNAME \
        -DartifactId=$APPNAME \
        -DarchetypeArtifactId=maven-archetype-quickstart \
        -DarchetypeVersion=1.4 \
        -DinteractiveMode=false
}
