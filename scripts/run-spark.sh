#!/bin/sh
cd ~ && git clone https://github.com/amplab/docker-scripts.git
cd docker-scripts && sudo ./deploy/deploy.sh -i amplab/spark:1.0.0 -w 3

