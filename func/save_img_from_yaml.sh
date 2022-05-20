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

        if [[ $img_prefix != "" ]]; then

            conv_img_name="$img_prefix/$(awk -F/ '{print $NF}' <<< ${img_name})"
            docker tag $img_name $conv_img_name
            docker save $conv_img_name > $dst_path/$img_name

        else

            docker save $img_name > $dst_path/$img_name

        fi

        docker rmi $img_name $conv_img_name &> /dev/null
        echo "Docker image $img_name saved to $dst_path"

    done
}
