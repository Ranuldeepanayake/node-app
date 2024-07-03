#!/bin/bash

#Display the start timestamp.
#date &

#The webhook relay script.
/bin/bash -c "relay forward --bucket gitlab-jenkins http://localhost:8080/github-webhook/"
