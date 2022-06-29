#!/bin/bash

## Defaults
VERSION="2.6"

## Options
while getopts 'v:' opt; do
    case "$opt" in
        v) VERSION="$OPTARG" ;;
        *) echo "Unknown option '$opt'"; exit 1 ;;
    esac
done

## Installation
sudo apt-get update
sudo add-apt-repository -y ppa:vbernat/haproxy-$VERSION
sudo apt-get update
sudo apt-get install -y haproxy
