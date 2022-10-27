#!/bin/bash

# Load and tag image
#   Synopsis: load_img [IMAGE_PATH] [IMAGE_REGISTRY] [PUSH_IMAGE_TO_REGISTRY]
#       $1: Path of the images
#       $2: Optional: Image registry to tag
#       $3: Optional: Push image to registry automatically
#   Example:
#       $ load_image ./images example.harbor.domain --push
function load_img {
    local img_path=$1
    local img_registry=$2
    local is_push=$3

    for img_tar in $(ls $img_path/*.tar); do

        image=$(sudo docker load < $img_tar \
            | sed –nr "s/Loaded image: (.+)/\1/gp")
        echo "Docker image ${image} loaded"
        
        if [[ $img_registry != "" ]]; then

            conv_img_name="$img_registry/$(awk -F/ '{print $NF}' <<< ${img_name})"
            sudo docker tag $image $conv_img_name
            echo "Docker image ${image} tagged to ${conv_img_name}"

            if [[ $is_push == "--push" ]]; then

                sudo docker push $conv_img_name
                echo "Docker image ${conv_img_name} pushed to ${img_registry}"

            fi

        fi

    done

}
