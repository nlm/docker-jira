FROM ubuntu:latest
MAINTAINER Nicolas Limage <docker@xephon.org>
RUN apt-get -q update
RUN apt-get -y install wget
WORKDIR /opt
RUN wget 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=111741' -O jre-8u66-linux-x64.tar.gz
RUN tar zxf jre-8u66-linux-x64.tar.gz
RUN ln -s jre1.8.0_66 jre
ENV JAVA_HOME=/opt/jre
RUN useradd jira
ENV JIRA_VERSION 7.0.2
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-$JIRA_VERSION-jira-$JIRA_VERSION.tar.gz
RUN tar zxf atlassian-jira-software-$JIRA_VERSION-jira-$JIRA_VERSION.tar.gz
RUN ln -s atlassian-jira-software-$JIRA_VERSION-standalone jira
ENV JIRA_HOME=/opt/jira
EXPOSE 8080
CMD ["/opt/jira/bin/start-jira.sh", "-fg"]
