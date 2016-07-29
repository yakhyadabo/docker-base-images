DOCKER_REPO = yakhyadabo

## Commands 
PUSH = docker push
BUILD = docker build

## Images'versions
JAVA_IMAGE_VERION = alpine-openjdk-1.8.0
NEW_RELIC_IMAGE_VERION = 3.28.0 
MAVEN_IMAGE_VERION = 3.3-2-git


## Build commands
newrelic-image-build:
	${BUILD} -f newrelic/Dockerfile -t ${DOCKER_REPO}/newrelic:${NEW_RELIC_IMAGE_VERION} newrelic

java-image-build:  
	${BUILD} -f java/Dockerfile -t ${DOCKER_REPO}/java:${JAVA_IMAGE_VERION} java

maven-image-build:
	${BUILD} -f maven-git/Dockerfile -t ${DOCKER_REPO}/maven:${MAVEN_IMAGE_VERION} maven-git


## Push commands
newrelic-image-push:
	${PUSH} ${DOCKER_REPO}/newrelic:${NEW_RELIC_IMAGE_VERION} 

java-image-push:
	${PUSH} ${DOCKER_REPO}/java:${JAVA_IMAGE_VERION} 

maven-image-push:
	${PUSH} ${DOCKER_REPO}/maven:${MAVEN_IMAGE_VERION}
