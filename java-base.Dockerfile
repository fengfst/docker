############################################################
# Dockerfile with jdk8(jdk-8u201) and maven (3.6.0)
# Based on centos
############################################################
FROM centos
MAINTAINER sundays
WORKDIR ~/

run yum install -y wget unzip \
# ADD jdk-8u201-linux-x64.rpm /root/
&& wget --no-check-certificate --no-cookies --header \
"Cookie: oraclelicense=accept-securebackup-cookie" \
https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.rpm \
&& rpm -ivh jdk-8u201-linux-x64.rpm \
&& rm -rf jdk-8u201-linux-x64.rpm \
&& wget http://mirrors.hust.edu.cn/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz \
&& mkdir -p /usr/share \
&& tar -zxvf apache-maven-3.6.0-bin.tar.gz -C /usr/share/ \
&& rm -rf apache-maven-3.6.0-bin.tar.gz

ENV MAVEN_HOME /usr/share/apache-maven-3.6.0
ENV JAVA_HOME /usr/java/jdk1.8.0_201-amd64
ENV PATH $PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin
