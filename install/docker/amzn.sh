#!/bin/bash

sudo yum update -y
sudo yum install -y docker
sudo systemctl enable --now docker
