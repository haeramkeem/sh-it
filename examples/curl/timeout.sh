#!/bin/bash

# Source: https://unix.stackexchange.com/a/94612
curl --max-time $SEC $URL
curl --connect-timeout $SEC $URL
