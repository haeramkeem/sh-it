#!/bin/bash

function sort_pkg {
    local WORKDIR=$(pwd)

    mkdir -pv $WORKDIR/installed_pkgs

    for rpm_file in $(ls $WORKDIR/*.rpm); do
        rpm -q $(rpm -qp $rpm_file --nosignature) &> /dev/null \
        && mv $rpm_file $WORKDIR/installed_pkgs/
    done
}
