#!/bin/bash

# Source: https://linuxhint.com/bash_arithmetic_operations/
# Works as the string
expr '10 + 30'

# Works as the string
expr 10+30

#Perform the addition
expr 10 + 30

#Find out the remainder value
expr 30 % 9

#Using expr with backtick
myVal1=`expr 30 / 10`
echo $myVal1

#Using expr within command substitute
myVal2=$( expr 30 - 10 )
echo $myVal2
