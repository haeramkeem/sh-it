#!/bin/bash

isi job jobs start treedelete --paths $DIRECTORY

# Multiple directory is also allowed
isi job jobs start treedelete --paths $DIRECTORY_1 --paths $DIRECTORY_2
