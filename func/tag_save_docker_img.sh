#!/bin/bash

# copyright 2022 (c) saltwalks/coworking

# Download and tag docker images based on kubernetes manifest YAML
#   kubernetes manifest YAML must be provided via STDIN
#   all the images are saved after they are tagged to be able to push into private image registry
#   Synopsis: dlDockerImages [DESTINATION] [REG_HOSTNAME]
#       $1: Destination directory path (create if not exists)
#       $2: Hostname of the private image registry
#   Example:
#       $ cat nginx.yaml | dlDockerImages ./images example.com
function tag_save_docker_img {
    local dst_path=$1
    local reg_host=$2

    mkdir -pv $dst_path

    img_list=$(cat - \
        | sed -nr "s/[^#]\s*image:\s*['\"]?([^'\"]+)['\"]?/\1/gp" \
        | sort -u)

    for img_name in $img_list; do
        docker pull $img_name
        conv_img_name="$reg_host/$(awk -F/ '{print $NF}' <<< ${img_name})"
        docker tag $img_name $conv_img_name
        docker rmi $img_name &> /dev/null
        docker save $conv_img_name > $dst_path/$img_name
        echo "Docker image $img_name saved to $dst_path"
    done
}
