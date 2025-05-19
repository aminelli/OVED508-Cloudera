#!/bin/bash

JAVA_HOME="/usr/lib/jvm/java-1.8.0-amazon-corretto"


ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name


$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR httpfs
