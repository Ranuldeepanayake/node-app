#!/bin/bash

#Script to clean files.
#Run this script every 6 mins.

_date=`date +%Y-%m-%d_%H:%M:%S`

echo "------------------------------------------------"
echo $_date
echo "Cleaning files"

cd ~/repos/node-app/scripts

find ./log-rotator -maxdepth 1 -iname '*.log' -mmin +4 -type f -exec rm "{}" \;

echo "Files cleaned"