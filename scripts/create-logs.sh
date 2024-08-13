#!/bin/bash

#Script to create files.
#Run this script every 2 mins.

#Prepare the file name.
_date=`date +%Y-%m-%d_%H:%M:%S`

echo "------------------------------------------------"
echo $_date
echo "Creating files"

cd ~/repos/node-app/scripts

#Create a text file.
touch ./log-rotator/$_date.log

#Add content to the file.
echo -e \
'['$_date']\n'\
'These are the contents of this log file.\n'\
'End of this log file.'\
>> ./log-rotator/$_date.log

echo "Files created"
