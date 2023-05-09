#!/bin/bash

# EXAMPLE SOURCE YAML FILE:
# items:
#   - saveDirName: "prometheus"
#     images:
#       - pull: "quay.io/prometheus/prometheus:v2.43.1"
#         save: "192.168.1.101:20443/quay.io/prometheus/prometheus:v2.43.1"
#   - saveDirName: "exporters"
#     images:
#       - pull: "nvcr.io/nvidia/k8s/dcgm-exporter:3.0.4-3.0.0-ubuntu20.04"
#         save: "192.168.1.101:20443/nvcr.io/nvidia/k8s/dcgm-exporter:3.0.4-3.0.0-ubuntu20.04"
#       - pull: "quay.io/prometheus/node-exporter:v1.3.1"
#         save: "192.168.1.101:20443/quay.io/prometheus/node-exporter:v1.3.1"
#       - pull: "registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.6.0"
#         save: "192.168.1.101:20443/registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.6.0"

FILE="-"
OUTPUT="."

while getopts 'f:o:h' opt; do
    case "$opt" in
        f)
            FILE=$OPTARG
            ;;
        o)
            OUTPUT=$OPTARG
            ;;
        h)
            echo "Docker-airgap version v0.0.1:"
            echo "-f : YAML file path, default to STDIN"
            echo "-o : Save dir name, default to '.'"
            exit 0
            ;;
        *)
            echo "Unknown option '$opt'" 1>&2; exit 1
            ;;
    esac
done

YAML="$(cat $FILE)"
mkdir -pv $OUTPUT

for i in $(yq '.items | keys' <<< "$YAML" | yq '.[]'); do
    SUBDIR=$OUTPUT/$(yq '.items.['$i'].saveDirName' <<< "$YAML")

    mkdir -pv $SUBDIR

    for y in $(yq '.items.['$i'].images | keys' <<< "$YAML" | yq '.[]'); do
        PULL=$(yq '.items.['$i'].images.['$y'].pull' <<< "$YAML")
        SAVE=$(yq '.items.['$i'].images.['$y'].save' <<< "$YAML")
        TAR=$SUBDIR/$(echo $SAVE | tr '/' '_' | tr ':' '_').tar
        docker pull $PULL
        docker tag $PULL $SAVE
        docker save $SAVE -o $TAR
    done
done
