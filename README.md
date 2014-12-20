# Spark-movie

Moive recommendation example from AMPLab spark camp 

## Lauch Vagrant box and docker Spark cluster

```
vagrant up
vagrant ssh
```

## Login master node of the Spark cluster
```
/vagrant/spark-ssh.sh
```

## Example to submit Spark app
```
./spark-submit --class org.apache.spark.examples.SparkPi --master spark://master:7077 --executor-memory 512M --total-executor-cores 1 ../lib/spark-examples-1.0.0-hadoop1.0.4.jar 1
```