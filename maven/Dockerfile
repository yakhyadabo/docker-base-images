FROM yakhyadabo/java:alpine-openjdk-1.8.0

MAINTAINER Yakhya Dabo <yakhya.dabo@gmail.com> 

ENV MAVEN_VERSION 3.3.3
ENV M2_HOME /usr/share/maven
ENV PROJECT_DIR /usr/src/app

USER root

# Install curl, tar, Maven 3.3.3
RUN apk --update add curl tar && \
   curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share && \
   mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven && \
   ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
   apk del curl && \
   rm /var/cache/apk/*

RUN mkdir -p $PROJECT_DIR
RUN mkdir $M2_HOME/repository \
   && chmod 777 $M2_HOME/repository

VOLUME $PROJECT_DIR, $M2_HOME/repository

WORKDIR $PROJECT_DIR

