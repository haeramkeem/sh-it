#!/bin/bash

# lsmod doesn't have any options
lsmod | grep ${MODULE_NAME}
