@echo off

echo "== CREAZIONE RETE CONTAINER =="
docker network create net-hadoop

pause

echo "== CREAZIONE cluster HDFS =="
echo "== CREAZIONE di NR 1 NAME NODE =="

docker run -d --name namenode --hostname namenode --network net-hadoop -p 9870:9870 -p 9000:9000 -v hadoop_namenode:/hadoop/dfs/name --env-file hadoop.env -e CLUSTER_NAME=test aci-hadoop:3.4.1-namenode

pause

echo "== CREAZIONE DI NR 3 DATA NODE =="

docker run -d --name datanode1 --hostname datanode1 --network net-hadoop -p 9864:9864 -v hadoop_datanode1:/hadoop/dfs/data --env-file hadoop.env -e SERVICE_PRECONDITION=namenode:9870 aci-hadoop:3.4.1-datanode
docker run -d --name datanode2 --hostname datanode2 --network net-hadoop -p 9865:9864 -v hadoop_datanode2:/hadoop/dfs/data --env-file hadoop.env -e SERVICE_PRECONDITION=namenode:9870 aci-hadoop:3.4.1-datanode
docker run -d --name datanode3 --hostname datanode3 --network net-hadoop -p 9866:9864 -v hadoop_datanode3:/hadoop/dfs/data --env-file hadoop.env -e SERVICE_PRECONDITION=namenode:9870 aci-hadoop:3.4.1-datanode


pause

echo "== CREAZIONE cluster YARN =="

echo "== CREAZIONE di NR 1 RESOURCE MANAGER =="
docker run -d --name resourcemanager --hostname resourcemanager --network net-hadoop --env-file hadoop.env -e SERVICE_PRECONDITION="namenode:9000 namenode:9870 datanode:9864" aci-hadoop:3.4.1-resourcemanager
pause

echo "== CREAZIONE di NR 1 NODE MANAGER =="
docker run -d --name nodemanager --hostname nodemanager --network net-hadoop --env-file hadoop.env -e SERVICE_PRECONDITION="namenode:9000 namenode:9870 datanode:9864 resourcemanager:8088" aci-hadoop:3.4.1-nodemanager
pause

echo "== CREAZIONE di NR 1 history server =="
docker run -d --name historyserver --hostname historyserver --network net-hadoop --env-file hadoop.env -v hadoop_historyserver:/hadoop/yarn/timeline -e SERVICE_PRECONDITION="namenode:9000 namenode:9870 datanode:9864 resourcemanager:8088" aci-hadoop:3.4.1-historyserver

echo "==> CLUSTER HDFS + YARN CREATO"



