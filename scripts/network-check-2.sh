#!/bin/bash

#read -p "Enter IP range: " _temp
#echo "Pinging $_temp"

ip_range="192.168.1.0/24"
network=`echo $ip_range | awk -F '.' '{print $1"."$2"."$3}'`
mask=`echo $ip_range | awk -F '/' '{print $2}'`
subnet_start=1

echo $network
echo $mask

for i in {1..254..1}
do
    ip="$network.$subnet_start"
    echo "Pinging $ip"
    output=`ping $ip -c 2`

    #echo $output | awk -F 'received' '{print $1}'
    #echo ${output%*received}
    #echo ${output%received*}
    output=${output%received*}
    #echo $output

    output=${output: -2}
    #echo $output
    
    if [ $output -eq 0 ]
    then
        echo "$ip : FAIL" | tee -a network-check.log
    else
        echo "$ip : PASS" | tee -a network-check.log
    fi
    subnet_start=$(( subnet_start+1 ))
done
#address=ip
#ping 

