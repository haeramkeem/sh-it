#!/bin/bash

# download .deb from apt
#   download the packages with all dependencies included from apt
#       list of the package must be provided via STDIN
#       ref: https://www.lesstif.com/lpt/apt-get-118096015.html
#   usage:
#       $1: package save directory path (mkdir if path not found)
#   example:
#       dl_deb_pkg ./pkgs <<< "git vim"
function dl_deb_pkg {
    local pkgName=$(cat -)
    local dstPath=$1
    local pwd=$(pwd)

    mkdir -pv $dstPath
    cd $dstPath

    echo "Downloading ${pkgName}"
    # Emptying cache
    rm -rf /var/cache/apt/archives/*.deb
    apt-get reinstall --download-only -y ${pkgName}
    mv /var/cache/apt/archives/*.deb .

    cd $pwd
}
