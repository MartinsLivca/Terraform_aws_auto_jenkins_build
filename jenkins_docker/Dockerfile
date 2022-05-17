FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
USER root
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY credentials.xml /var/jenkins_home
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml
RUN mkdir -p /var/jenkins_home/jobs/jenkins_task
COPY config.xml /var/jenkins_home/jobs/jenkins_task/config.xml
RUN chown -R jenkins:jenkins $JENKINS_HOME
