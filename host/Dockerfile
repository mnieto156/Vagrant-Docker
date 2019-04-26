FROM jenkins/jenkins:lts-slim
USER root
RUN mkdir -p /usr/java/packages/lib/ext 
WORKDIR /usr/java/packages/lib/ext
USER jenkins
COPY postgresql-42.2.5.jar .