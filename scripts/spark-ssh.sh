#!/bin/sh
MAIN_IP=$(sudo docker inspect `sudo docker ps | grep spark-master | awk '{print $1}'` | grep IPAddress | sed -r "s/.*: \"(.*)\"\,/\1/g")
ssh -i docker-scripts/apache-hadoop-hdfs-precise/files/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@$MAIN_IP
