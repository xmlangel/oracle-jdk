FROM xmlangel/base-ubuntu14.04

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

ENV JDK_VERSION 6u45
ENV JDK_JAVA_VERSION_PATH jdk1.6.0_45

# Install JDK
COPY jdk-${JDK_VERSION}-linux-x64.bin / 
RUN chmod +x jdk-${JDK_VERSION}-linux-x64.bin \
&& ./jdk-${JDK_VERSION}-linux-x64.bin \
&& mkdir /opt/jdk \
&& mv /${JDK_JAVA_VERSION_PATH} /opt/jdk \
&& rm /jdk-${JDK_VERSION}-linux-x64.bin

WORKDIR /opt

RUN update-alternatives --install /usr/bin/java java /opt/jdk/${JDK_JAVA_VERSION_PATH}/bin/java 100 \
&& update-alternatives --install /usr/bin/javac javac /opt/jdk/${JDK_JAVA_VERSION_PATH}/bin/javac 100 \
&& update-alternatives --install /usr/bin/javaws javaws /opt/jdk/${JDK_JAVA_VERSION_PATH}/bin/javaws 100

WORKDIR /root
 
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk/${JDK_JAVA_VERSION_PATH}
