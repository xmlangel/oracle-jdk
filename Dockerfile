FROM xmlangel/base-ubuntu14.04

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

ENV JDK_VERSION 7u80
ENV JDK_JAVA_VERSION_PATH jdk1.7.0_80

# Install JDK
COPY jdk-7u80-linux-x64.tar.gz / 

RUN mkdir /opt/jdk && tar -zxf jdk-${JDK_VERSION}-linux-x64.tar.gz -C /opt/jdk \
&& rm /jdk-${JDK_VERSION}-linux-x64.tar.gz

WORKDIR /opt
RUN update-alternatives --install /usr/bin/java java /opt/jdk/${JDK_JAVA_VERSION_PATH}/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/${JDK_JAVA_VERSION_PATH}/bin/javac 100

WORKDIR /root
 
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk/${JDK_JAVA_VERSION_PATH}