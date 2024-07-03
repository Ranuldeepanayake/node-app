#!/bin/bash

while getopts u:a: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        a) age=${OPTARG};;
    esac
done

echo "Username: $username";
echo "Age: $age";

read -p "Enter your name: " name
echo "Your name is $name"