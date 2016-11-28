# Running Spark inside Jupyter

See https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook
for details.

This directory is setup just like our parent directory, but for the pyspark
notebook from jupyter/docker-stacks.

To test in local mode, try something like this in a notebook:

````
import pyspark
sc = pyspark.SparkContext('local[*]')
# do something to prove it works
rdd = sc.parallelize(range(1000))
rdd.takeSample(False, 5)
````

If you want to connect to a Mesos cluster, you need something like this:

````
import os
# make sure pyspark tells workers to use python3 not 2 if both are installed
os.environ['PYSPARK_PYTHON'] = '/usr/bin/python3'

import pyspark
conf = pyspark.SparkConf()

# point to mesos master or zookeeper entry (e.g., zk://10.10.10.10:2181/mesos)
conf.setMaster("mesos://10.10.10.10:5050")
# point to spark binary package in HDFS or on local filesystem on all slave
# nodes (e.g., file:///opt/spark/spark-1.6.0-bin-hadoop2.6.tgz)
conf.set("spark.executor.uri", "hdfs://10.122.193.209/spark/spark-1.6.0-bin-hadoop2.6.tgz")
# set other options as desired
conf.set("spark.executor.memory", "8g")
conf.set("spark.core.connection.ack.wait.timeout", "1200")

# create the context
sc = pyspark.SparkContext(conf=conf)

# do something to prove it works
rdd = sc.parallelize(range(100000000))
rdd.sumApprox(3)
````
