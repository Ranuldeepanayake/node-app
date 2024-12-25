#!/bin/bash
cd /home/ranul/repos/node-app/scripts

sudo -u ranul touch priv-file.dat

touch priv-file-root.dat

systemctl stop apache2

systemctl status apache2

systemctl start apache2