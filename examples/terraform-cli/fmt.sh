#!/bin/bash

# Formatting code in-place
terraform fmt

# Formatting code in-place with printing differences
terraform fmt -diff

# Just cheching (not formatting)
terraform fmt -check