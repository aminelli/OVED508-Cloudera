# CLOUDERA Installation

## Step 1 - Creeazione macchine virtuali:

- **Image**: Ubuntu Server 20.04 LTS
- **Size**: 4 vcpus, 16 Gb RAM
- **Disk**: 64 Gb
- **OS DIskType**: Standard

| VM              | IP             | Private IP |
| --------------- | -------------- | ---------- |
| CLOUDERA-MASTER | 13.79.130.119  | 10.3.0.4   |
| CLOUDERA-ND-01  | 74.234.95.92   | 10.3.0.5   |
| CLOUDERA-ND-02  | 134.149.20.154 | 10.3.0.6   |
| CLOUDERA-ND-03  | 20.238.115.174 | 10.3.0.7   |
| CLOUDERA-ND-04  | 134.149.57.131 | 10.3.0.8   |


## Step 2 Configurazione ambienti

```shell
# == SU TUTTI I NODI + MASTER ==
sudo apt-get update
sudo apt install -y nodejs npm yarn selinux-utils policycoreutils net-tools

# Python
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py

# == SU TUTTI I NODI TRANNE IL MASTER MASTER ==
sudo pip install psycopg2==2.7.5 --ignore-installed


# == Ogni comenado successivo va eseguito singolarmente su singolo server ==
sudo hostnamectl set-hostname manager.cloudera.corso.internal 
sudo hostnamectl set-hostname node-01.cloudera.corso.internal
sudo hostnamectl set-hostname node-02.cloudera.corso.internal
sudo hostnamectl set-hostname node-03.cloudera.corso.internal
sudo hostnamectl set-hostname node-04.cloudera.corso.internal

# == SU TUTTI I NODI + MASTER ==
# Configurazione host

# Modifica file hosts
sudo nano /etc/hosts
# MAPPATURA DNS RETE INTERNA VM
10.3.0.4 manager.cloudera.corso.internal CLOUDERA-MASTER
10.3.0.5 node-01.cloudera.corso.internal CLOUDERA-ND-01 
10.3.0.6 node-02.cloudera.corso.internal CLOUDERA-ND-02 
10.3.0.7 node-03.cloudera.corso.internal CLOUDERA-ND-03 
10.3.0.8 node-04.cloudera.corso.internal CLOUDERA-ND-04 

# TUNNG DI BASE: Parametro swappiness
sudo nano /etc/sysctl.conf
# impostare:
# vm.swappiness=10

## DISABILITARE SELINUX SU TUTTI I NODI
# Verifica sui nodi dei SELINUX; SELinu se abilitato va disabilitato
sudo sestatus

# Nel caso si debba modificare, per farlo in modo permanente:
cat /etc/selinux/config
# Modify :
# FROM:
# SELINUX=enforcing
# TO:
# SELINUX=disabled


# == SOLO MASTER (MANAGER) ==
wget https://archive.cloudera.com/cm7/7.4.4/cloudera-manager-installer.bin
chmod u+x cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin


## SU PROPRIO PC FARE MATTURA SU FILE HOSTS
13.79.130.119  manager.cloudera.corso.internal
74.234.95.92   node-01.cloudera.corso.internal
134.149.20.154 node-02.cloudera.corso.internal
20.238.115.174 node-03.cloudera.corso.internal
134.149.57.131 node-04.cloudera.corso.internal

```



## Appunti post installazione

Dashboards: 

| Desc    | Node   | URL                                          |
| ------- | ------ | -------------------------------------------- |
| Manager | Master | http://manager.cloudera.corso.internal:7180/ |


Postgres Data:

| PRM | Value                                |
| --- | ------------------------------------ |
| EP  | manager.cloudera.corso.internal:7432 |
| DB  | rman                                 |
| usr | rman                                 |
| pwd | zSoSAZ9248                           |