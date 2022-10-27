#!/bin/bash

# As 'save_img_from_yaml' func will be deprecated pretty soon, use this func instead
#   Kubernetes manifest YAML must be provided via STDIN
#   Example:
#       $ cat nginx.yaml | get_img_list_from_yaml
function get_img_list_from_yaml {
    echo $(cat - \
        | sed -nr "s/[^#]\s*image:\s*['\"]?([^'\"]+)['\"]?/\1/gp" \
        | sort -u)
}
