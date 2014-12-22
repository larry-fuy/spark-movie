# Spark-movie

Moive recommendation example from AMPLab spark camp 

## Clone this repo

## Prepare data
```
cd spark-movie
wget  http://d12yw77jruda6f.cloudfront.net/ampcamp5-usb.zip
unzip ampcamp5-usb.zip
mv ampcamp5-usb/data ./data
rm -r ampcamp5-usb
```

## Lauch Vagrant box and docker Spark cluster

```
vagrant up
```

## Login the Vagrant box
```
vagrant ssh
```

## Launch Spark cluster
```
cd ~ && git clone https://github.com/amplab/docker-scripts.git
cd ~/docker-scripts/bin 
sudo ./deploy.sh -i amplab/spark:1.0.0 -w 3 -v /vagrant/data
```
or
```
cd /vagrant/scripts && ./run-spark.sh
```  


## To run the movie recommendation there is a package should be install on each node

```
ssh -i /home/vagrant/docker-scripts/deploy/../apache-hadoop-hdfs-precise/files/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@[woker_ip]
work$ apt-get install libgfortran3
... 
```

## Login master node of the Spark cluster
```
/vagrant/spark-ssh.sh
```
or
```
ssh -i /home/vagrant/docker-scripts/deploy/../apache-hadoop-hdfs-precise/files/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@[master_ip]
```

## Change the mode of MovieLens data
```
chmod 666 /data/movielens/medium/ratings.dat
```


## Test submitting Spark app
```
./spark-submit --class org.apache.spark.examples.SparkPi --master spark://master:7077 --executor-memory 512M --total-executor-cores 1 ../lib/spark-examples-1.0.0-hadoop1.0.4.jar 1
```

## Run the Movie Recommendation example within Spark (Note : only model training, no recommendation)
```
./spark-submit --class org.apache.spark.examples.mllib.MovieLensALS --master spark://master:7077 --executor-memory 512M --total-executor-cores 1 ../lib/spark-examples-1.0.0-hadoop1.0.4.jar --rank 5 --numIterations 20 --lambda 1.0 --kryo file:///data/movielens/medium/ratings.dat
```