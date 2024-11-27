#!/bin/bash

var=/home/ranul/

echo "$var"

sh """sed -i "s~PH~$var~g" /home/ranul/repos/node-app/scripts/sed.log"""