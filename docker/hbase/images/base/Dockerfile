FROM openjdk:11-jdk-slim

ENV HBASE_VERSION=2.5.11
ENV HBASE_HOME=/opt/hbase
ENV PATH=${PATH}:${HBASE_HOME}/bin

# https://dlcdn.apache.org/hbase/2.5.11/hbase-2.5.11-bin.tar.gz


RUN apt-get update && \
    apt-get install -y curl wget tar nano htop net-tools && \
    wget https://dlcdn.apache.org/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar xzf hbase-${HBASE_VERSION}-bin.tar.gz -C /opt && \
    mv /opt/hbase-${HBASE_VERSION} /opt/hbase && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz

EXPOSE 16000 16010 16020 16030 8080 8085 9090 9095 2181 2888 3888  






