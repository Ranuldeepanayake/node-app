#!/bin/bash

#Run this script every 6 mins.

cd ~/repos/node-app/scripts

find ./log-rotator -maxdepth 1 -iname '*.log' -mmin +4 -type f -exec rm "{}" \;