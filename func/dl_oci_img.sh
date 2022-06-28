#!/bin/bash

# Download OCI format container image via ContainerD
# As 'save_img_from_yaml' func will be deprecated pretty soon, use this func instead
#   Image list must be provided via STDIN
#   Synopsis: save_img_from_yaml [DESTINATION]
#       $1: Destination directory path (create if not exists)
#   Example:
#       $ echo "nginx busybox" | dl_oci_imgs ./images
function dl_oci_imgs {
    if ! `ctr version &> /dev/null`; then
        echo "ContainerD is not installed"
        exit 1
    fi

    local dst_path=$1
    mkdir -pv $dst_path

    for img_name in $(cat -); do
        ctr image pull $img_name
        ctr image export \
            $dst_path/$(awk -F/ '{print $NF}' <<< ${img_name}).tar \
            $img_name
        ctr image remove $img_name
    done
}
