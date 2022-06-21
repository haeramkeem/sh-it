#!/bin/bash

# download .rpm from yum(or dnf)
#   download the packages with all dependencies included from yum/dnf
#       list of the package must be provided via STDIN
#   usage:
#       $1: package save directory path (mkdir if path not found)
#   example:
#       dl_deb_pkg ./pkgs <<< "git vim"
function dl_rpm_pkg {
    local pkgName=$(cat -)
    local dstPath=$1
    local pwd=$(pwd)

    mkdir -pv $dstPath
    cd $dstPath

    # Download RPM
    echo "Downloading ${pkgName}"
    repotrack ${pkgName}

    cd $pwd
}
