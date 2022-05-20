#!/bin/bash

# MIT License
#   copyright 2022 (c) saltwalks/coworking

# Download docker images based on kubernetes manifest YAML
#   kubernetes manifest YAML must be provided via STDIN
#   Synopsis: dlDockerImages [DESTINATION]
#       $1: Destination directory path (create if not exists)
#   Example:
#       $ cat nginx.yaml | dlDockerImages
function dl_img_from_yaml {
    local dstPath=$1
    mkdir -pv $dstPath

    imgList=$(cat - | sed -nr "s/[^#]\s*image:\s*['\"]?([^'\"]+)['\"]?/\1/gp" | sort -u)
    for imgName in $imgList; do
        imgFile=${imgName//\//.}.tar
        docker pull $imgName
        docker save $imgName > $dstPath/$imgFile
        docker rmi $imgName &> /dev/null
        echo "Docker image $imgFile saved to $dstPath"
    done
}
