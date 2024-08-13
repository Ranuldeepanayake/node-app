#!/bin/bash

#Script to send email health alerts.

#Run this script every 2 mins.
cd ~/repos/node-app/scripts

#Create variables.
_date=`date +%Y-%m-%d_%H:%M:%S`
_ram=`free -h`
_disk_space=`df -h`

echo $_date | 2>&1 tee -a alerts.log

_email_subject='Health Report'
_email_recipient='ranuldeepanayake@outlook.com'
_email_content=$_date+\n+$_ram+' \n '+$_disk_space

#Send an email.
printf '%s \n\n %s \n\n %s' "$_date $_ram $_disk_space" | mail -s "$_email_subject" -a "From: ansible-controller-1" $_email_recipient
echo "mail sent"

