FROM java:openjdk-8-alpine

MAINTAINER Yakhya Dabo <yakhya.dabo@gmail.com>

ENV PROJECT_DIR=/opt/app \
    _JAVA_OPTIONS="-Xmx128m -Xms128m"

USER root

RUN addgroup ydabo  \
	&& adduser -s /bin/bash -D -G ydabo ydabo


RUN mkdir -p $PROJECT_DIR \
	&& chown -R ydabo:ydabo $PROJECT_DIR 

USER ydabo

WORKDIR $PROJECT_DIR

CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]

EXPOSE 8080
