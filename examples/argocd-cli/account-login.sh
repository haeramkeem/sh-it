#!/bin/bash

# Login with SSO
argocd login $ARGOCD_URL --sso

# Show current account
argocd account get-user-info
