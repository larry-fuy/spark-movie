#!/bin/bash

sudo apt-get update -y
sudo apt-get -y curl git 
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
cd ~ && git clone https://github.com/amplab/docker-scripts.git

# run spark clusters
cd docker-scripts && sudo ./deploy/deploy.sh -i amplab/spark:1.0.0 -w 3

# TODO: port forwarding (without change deploy script, iptable/socat)
