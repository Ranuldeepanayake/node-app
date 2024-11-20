#!/bin/bash

# aws ec2 run-instances --image-id ami-047126e50991d067b --count 1 --instance-type t2.micro --key-name ec2-key-1-windows \
# --security-group-ids sg-001429f4b76c8906d --subnet-id subnet-08675481f2991773d

# aws ec2 run-instances --image-id ami-047126e50991d067b --count 1 --instance-type t2.micro --key-name ec2-key-1-windows \
# --security-group-ids sg-001429f4b76c8906d --subnet-id subnet-08675481f2991773d --network-interfaces 'AssociatePublicIpAddress=false,DeviceIndex=0'

# aws ec2 run-instances --image-id ami-047126e50991d067b --count 1 --instance-type t2.micro --key-name ec2-key-1-windows \
# --security-group-ids sg-001429f4b76c8906d --subnet-id subnet-08675481f2991773d --network-interfaces 'AssociatePublicIpAddress=false,DeviceIndex=0' \
# --block-device-mappings "[{\"DeviceName\":\"/dev/sde\",\"Ebs\":{\"VolumeSize\":30,\"DeleteOnTermination\":true}}]" \
# --tag-specifications 'ResourceType=instance,Tags=[{Key=name,Value=demo-server}]' 'ResourceType=volume,Tags=[{Key=name,Value=demo-server-disk}]'

aws ec2 run-instances --image-id ami-047126e50991d067b --count 2 --instance-type t2.micro --key-name ec2-key-1-windows \
--security-group-ids sg-001429f4b76c8906d --subnet-id subnet-08675481f2991773d --network-interfaces 'AssociatePublicIpAddress=false,DeviceIndex=0' \
--user-data file://ec2-user-data-script-1.sh

