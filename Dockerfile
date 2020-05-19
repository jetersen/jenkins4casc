FROM jenkins/jenkins:lts
LABEL maintainer="man@praqma.net"

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

##### JENKINS SETUP. For alpha releases use the experimental update center
ENV JENKINS_HOME /var/jenkins_home
ENV CASC_PATH="${JENKINS_HOME}/casc_configs"
ENV CASC_JENKINS_CONFIG="${CASC_PATH}"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY jenkins-minimal-example.yaml ${CASC_PATH}/
