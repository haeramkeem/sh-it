#!/bin/bash

# download .deb from apt
#   download the packages with all dependencies included from apt
#       `grep -v "i386"` will discard all dependencies with i386 architecture
#       ref: https://stackoverflow.com/a/45489718
#   usage:
#       $1: package name (only one permitted)
#       $2: package save directory path (mkdir if path not found)
function dl_deb_pkg {
    local pkgName=$1
    local dstPath=$2
    local pwd=$(pwd)

    mkdir -pv $dstPath
    cd $dstPath

    apt-get download $(apt-cache depends --recurse --no-recommends --no-suggests --no-conflicts \
        --no-breaks --no-replaces --no-enhances --no-pre-depends ${pkgName} | \
        grep "^\w" | grep -v "i386")

    cd $pwd
}
