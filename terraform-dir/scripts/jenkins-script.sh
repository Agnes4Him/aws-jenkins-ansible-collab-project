#!/bin/bash

sudo apt update

sudo apt install openjdk-11-jdk -y

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add  

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' 

sudo apt update

sudo apt install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo ufw allow 8080 