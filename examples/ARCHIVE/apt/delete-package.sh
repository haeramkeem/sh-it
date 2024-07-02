#!/bin/bash

sudo apt-get remove --purge -y ${PKG_NAME} \
    && sudo apt-get autoremove --purge -y
