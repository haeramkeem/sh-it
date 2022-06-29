#!/bin/bash

## Defaults
VERSION=""

## Options
while getopts 'v:' opt; do
    case "$opt" in
        v) VERSION="-$OPTARG" ;;
        *) echo "Unknown option '$opt'"; exit 1 ;;
    esac
done

## Installation
sudo dnf install -y keepalived$VERSION
