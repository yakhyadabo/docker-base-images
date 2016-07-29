FROM yakhyadabo/java:alpine-openjdk-1.8.0

MAINTAINER Yakhya Dabo <yakhya.dabo@gmail.com> 

ENV NEW_RELIC_DIR=/opt/newrelic \
    NEW_RELIC_VERSION=3.28.0

USER root

RUN mkdir $NEW_RELIC_DIR

RUN apk --update add curl unzip 

RUN curl -sS -o $NEW_RELIC_DIR/newrelic.zip \
     http://download.newrelic.com/newrelic/java-agent/newrelic-agent/${NEW_RELIC_VERSION}/newrelic-java-${NEW_RELIC_VERSION}.zip \
    && unzip -j -d $NEW_RELIC_DIR $NEW_RELIC_DIR/newrelic.zip \
    && rm $NEW_RELIC_DIR/newrelic.zip

RUN chown -R ydabo:ydabo $NEW_RELIC_DIR

COPY script/entrypoint.sh /var/lib  

WORKDIR $PROJECT_DIR

USER ydabo

ENTRYPOINT ["/var/lib/entrypoint.sh"]

CMD ["java","-javaagent:/opt/newrelic/newrelic.jar","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]

EXPOSE 8080
