FROM yakhyadabo/java:alpine-openjdk-1.8.0

MAINTAINER Yakhya Dabo <yakhya.dabo@gmail.com> 

ENV MAVEN_VERSION 3.3.3
ENV M2_HOME /usr/share/maven
ENV PROJECT_DIR /usr/src/app

USER root

# Make ssh dir
RUN mkdir /root/.ssh/ && \
    chmod 600 /root

# Install curl, tar, git, openssh and config ssh
RUN apk --update add curl tar openssh-client git \
    && echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config \  
    && echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# Install Maven 3.3.3
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

RUN mkdir -p $PROJECT_DIR
RUN mkdir $M2_HOME/repository \
	&& chmod 777 $M2_HOME/repository


# Set git user.name and user.email in the entrypoint
COPY script/entrypoint.sh /var/lib

ENTRYPOINT ["/var/lib/entrypoint.sh"]

VOLUME PROJECT_DIR, $M2_HOME/repository

WORKDIR $PROJECT_DIR
CMD ["mvn", "clean", "install"]
