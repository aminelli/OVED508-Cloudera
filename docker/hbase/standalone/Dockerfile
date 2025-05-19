FROM openjdk:11-jdk-slim

ENV HBASE_VERSION=2.5.11
ENV HBASE_HOME=/opt/hbase
ENV PATH=${PATH}:${HBASE_HOME}/bin

RUN apt-get update && \
    apt-get install -y curl wget tar nano htop net-tools && \
    wget https://dlcdn.apache.org/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz && \
    tar xzf hbase-${HBASE_VERSION}-bin.tar.gz -C /opt && \
    mv /opt/hbase-${HBASE_VERSION} /opt/hbase && \
    rm hbase-${HBASE_VERSION}-bin.tar.gz

COPY hbase-site.xml /opt/hbase/conf/hbase-site.xml

EXPOSE 16000 16010 16020 16030 2181

CMD ["hbase", "master", "start"]