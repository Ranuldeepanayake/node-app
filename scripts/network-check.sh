#!/bin/bash

_default_ips=(8.8.8.8 1.1.1.1 192.168.1.1)

echo -e "Select an option to proceed \n
1 Use default checks
2 Enter custom IP address
3 Enter subnet (x.x.x.x/x)
\n"

read -p "Enter selection: " _temp

if [ $_temp -eq 1 ]
then
    for ip in ${_default_ips[@]}; do
        ping $ip -c 2
    done
fi

if [ $_temp -eq 2 ]
then
    read -p "Enter custom IP address: " _temp
    ping $_temp -c 2
fi

if [ $_temp -eq 3 ]
then
   read -p "Enter IP range: " _temp
   echo "Pinging $_temp"

   ip_range=$_temp
   subnet_start=0

    ping 

fi
# _ip_1='8.8.8.8'

# ping $_ip_1