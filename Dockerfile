FROM openjdk:11-jdk-slim
LABEL maintainer="su"

ARG JMETER_VERSION=5.6.3

RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
        wget \
        telnet \
        vim \
        net-tools \
        htop \
        iputils-ping \
        unzip
RUN mkdir /jmeter && \
    cd /jmeter/ && \
    wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz && \
    tar -xzf apache-jmeter-$JMETER_VERSION.tgz && \
    rm apache-jmeter-$JMETER_VERSION.tgz

RUN cd /jmeter/apache-jmeter-$JMETER_VERSION/ && \
    wget -q -O /tmp/JMeterPlugins-Standard-1.4.0.zip https://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.4.0.zip && \
    unzip -n /tmp/JMeterPlugins-Standard-1.4.0.zip && \
    rm /tmp/JMeterPlugins-Standard-1.4.0.zip

RUN cd /jmeter/apache-jmeter-$JMETER_VERSION/lib/ext && \
    wget -q -O jmeter-plugins-influxdb2-listener-2.7.jar https://github.com/mderevyankoaqa/jmeter-influxdb2-listener-plugin/releases/download/v2.7/jmeter-plugins-influxdb2-listener-2.7.jar && \
    wget -q -O jmeter-plugins-manager-1.10.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.10/jmeter-plugins-manager-1.10.jar

ADD setenv.sh /jmeter/apache-jmeter-$JMETER_VERSION/bin/setenv.sh

ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

ENV PATH $JMETER_HOME/bin:$PATH
