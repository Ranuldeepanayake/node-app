#!/bin/bash

cd ~/

mkdir aws-cli

cd aws-cli

sudo apt update

sudo apt install net-tools -y

sudo apt install unzip -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

sudo apt install keepalived -y

sudo apt install apache2 -y

cd /var/www/

mkdir web-worker

chown ubuntu:ubuntu web-worker

cd web-worker

echo "<html> \
<head><title>Welcome</title></head> \
<body><center><h1>Welcome!</h1></center></body> \
</html>" > index.html

