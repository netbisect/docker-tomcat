FROM netbisect/java:jre-8.151.12-r0
MAINTAINER HFM <haniffm@kth.se>


RUN apk --update add curl ca-certificates
ENV TOMCAT_VERSION=9.0.0.M3

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/ca-certificates.crt \
  "https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && mv /usr/apache-tomcat* /usr/tomcat \
    && rm -rf /usr/tomcat/webapps/examples /usr/tomcat/webapps/docs /usr/tomcat/webapps/ROOT \
	&& rm -rf /var/cache/apk/*


# SET CATALINE_HOME and PATH
ENV CATALINA_HOME /usr/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

# Launch Tomcat on startup
CMD ${CATALINA_HOME}/bin/catalina.sh run
