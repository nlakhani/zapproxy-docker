FROM debian:jessie
MAINTAINER Naeem Lakhani "naeem.lakhani@gmail.com"

RUN wget https://github.com/zaproxy/zaproxy/releases/download/2.4.2/ZAP_2.4.2_Linux.tar.gz \
    apt-get update && \
    apt-get --no-install-recommends install -q -y openjdk-7-jre-headless && \
    tar -xzvf ZAP_2.4.2_Linux.tar.gz \
    mkdir /opt/zapproxy \
    cp -Ra ZAP_2.4.1 /opt/zapproxy
EXPOSE 8080
RUN cd /opt/zapproxy \
    sh zap.sh -daemon -config api.disabledkey=true
CMD [""]
