#!/bin/bash

# Source: https://superuser.com/a/125326
# This automatically adds the known hosts entry for current session
ssh -o "StrictHostKeyChecking no" user@host
