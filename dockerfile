FROM centos:6.10

LABEL maintainer="sahmed@gainsight.com"

RUN yum install -y httpd && yum install java -y

WORKDIR /opt

ADD ./apache-tomcat-7.0.107.tar.gz /opt/

ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /opt/apache-tomcat-7.0.107/webapps/

VOLUME [ "/cradius-data-local/" ]

EXPOSE 8080

ENTRYPOINT ["/opt/apache-tomcat-7.0.107/bin/catalina.sh","run"]
