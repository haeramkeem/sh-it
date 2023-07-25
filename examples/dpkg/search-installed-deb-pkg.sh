#!/bin/bash

# Source: https://wiki.debian.org/PackageManagement/Searching
dpkg -l | grep ${PKG_NAME}
dpkg -l ${PKG_NAME}
