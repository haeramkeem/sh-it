#!/bin/bash

# Download and tag docker images based on kubernetes manifest YAML
#   Kubernetes manifest YAML must be provided via STDIN
#   All the images are saved after they are tagged
#   to be able to push into private image registry
#   when image prefix is set
#   Synopsis: save_img_from_yaml [DESTINATION] [IMAGE_PREFIX]
#       $1: Destination directory path (create if not exists)
#       $2: Optional: Image prefix
#           This can be use to specify the hostname or repository
#           of the private image registry
#   Example:
#       $ cat nginx.yaml | save_img_from_yaml ./images example.com
function save_img_from_yaml {
    local dst_path=$1
    local img_prefix=$2

    mkdir -pv $dst_path

    img_list=$(cat - \
        | sed -nr "s/[^#]\s*image:\s*['\"]?([^'\"]+)['\"]?/\1/gp" \
        | sort -u)

    for img_name in $img_list; do

        docker pull $img_name
        save_img=$img_name
        img_name_only=$(awk -F/ '{print $NF}' <<< ${img_name})

        if [[ $img_prefix != "" ]]; then

            save_img="$img_prefix/$img_name_only"
            docker tag $img_name $save_img

        fi

        docker save $save_img > $dst_path/$img_name_only.tar
        echo "Docker image $save_img saved to $dst_path"

    done
}
