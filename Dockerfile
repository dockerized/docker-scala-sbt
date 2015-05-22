#
# Scala and sbt Dockerfile
#
# https://github.com/hseeberger/scala-sbt
#

# Pull base image
FROM xiocode/java:latest

ENV SCALA_VERSION 2.10.5
ENV SBT_VERSION 0.13.8

RUN \
  apt-get update && \
  apt-get install curl git unzip wget -y

# Install Scala
RUN \
  cd /root && \
  curl -o scala-$SCALA_VERSION.tgz http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
  tar -xf scala-$SCALA_VERSION.tgz && \
  rm -rf scala-$SCALA_VERSION.tgz && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm -rf sbt-$SBT_VERSION.deb && \
  apt-get install sbt -y

RUN \
  rm -rf /var/lib/apt/lists/*

# Define working directory
WORKDIR /root
