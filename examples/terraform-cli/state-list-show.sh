#!/bin/bash

# Show a list of resources/data/etc based on tfstate
terraform state list

# Show detail info
terraform state show $RESOURCE