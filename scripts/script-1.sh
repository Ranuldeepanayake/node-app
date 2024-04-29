#!/bin/bash

#exec 3>&1 4>&2
#trap 'exec 2>&4 1>&3' 0 1 2 3
#exec 1>script-1.log 2>&1


echo "`date "+%Y-%m-%d-%H:%M:%S"`> Script started" | 2>&1 tee -a script-1.log
#date | 2>&1 tee -a script-1.log

#Show the current directory.
pwd | 2>&1 tee -a script-1.log

#Count the number of files.
#file_count=ls -la | wc -l
echo "Files in the current location: `ls -la | wc -l`" | 2>&1 tee -a script-1.log

#Check if a file exists.
if [ -f "./skidrow.dll" ];
then
	echo "skidrow.dll not found!" | 2>&1 tee -a script-1.log

	touch ./skidrow.dll
	echo "skidrow.dll created" | 2>&1 tee -a script-1.log

	tar -zvf ./skidrow.dll
	echo "archive created" | 2>&1 tee -a script-1.log

else
	 echo "skidrow.dll found" | 2>&1 tee -a script-1.log
fi

#| 2>&1 tee -a script-1.log

#Rename files
directory="./*"

for file in $directory;
do
	echo "$file" | 2>&1 tee -a script-1.log
	cp "$file" "$file.bak-`date "+%Y-%m-%d"`" | 2>&1 tee -a script-1.log
done



