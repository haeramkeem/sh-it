#!/bin/bash

# Doing `cd` in sub session do not change working directory for current session
echo "$(cd $RELATIVE_PATH && pwd)"
