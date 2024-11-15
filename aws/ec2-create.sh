#!/bin/bash

#Show available subnets.
#aws ec2 describe-subnets --profile default | grep subnet

#Show available security groups.
#aws ec2 describe-security-groups --profile default | grep Group

#aws ec2 describe-key-pairs

aws ec2 run-instances --image-id ami-047126e50991d067b --count 1 --instance-type t2.micro --key-name ec2-key-1-windows \
--security-group-ids sg-001429f4b76c8906d --subnet-id subnet-08675481f2991773d
