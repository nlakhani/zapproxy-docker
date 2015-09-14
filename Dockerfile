FROM debian:jessie
MAINTAINER Naeem Lakhani "naeem.lakhani@gmail.com"

RUN apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    apt-get install -y wget && \
    wget https://github.com/zaproxy/zaproxy/archive/2.4.1.tar.gz && \
    tar -xzvf 2.4.1.tar.gz && \
    mkdir /opt/zapproxy && \
    cp -Ra zaproxy-2.4.1/* /opt/zapproxy
EXPOSE 8080
RUN cd /opt/zapproxy/src && \
    zap.sh -daemon -config api.disablekey=true
CMD [""]
