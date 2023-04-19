#!/bin/bash

# Source: https://stackoverflow.com/a/61440699
# This exports all files from the image
# To export just one file, you should use multi-stage build and scratch image
# See @source for more explanation & examples
DOCKER_BUILDKIT=1 docker build -f ${PATH_TO_DOCKERFILE} -o ${OUTPUT_DIR} .
