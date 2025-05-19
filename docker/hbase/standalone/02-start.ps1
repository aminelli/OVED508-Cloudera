

# HBASE - Standalone

# Creazione rete

docker network create net-hadoop

# Lanciare un'instanza zookepeer

docker run `
    -d `
    --name zookeeper `
    --hostname zookeeper `
    --network net-hadoop `
    -p 2181:2181 `
    zookeeper:3.8.0


# Lanciare un'instanza hbase

docker run `
    -d `
    --name hbase `
    --hostname hbase `
    --network net-hadoop `
    -p 16010:16010 `
    aci-hbase:2.5.11-standalone