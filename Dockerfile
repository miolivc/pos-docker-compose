FROM tomcat
COPY target/app.war ${CATALINA_HOME}/webapps
#VOLUME ["/usr/local/tomcat/webapps"]