# docker-tomcat
Minimal (118.3 MB) Docker image with tomcat.

### Try it
Run like this:

`docker run --rm --name=myTomcatTest -p 10080:8080 netbisect/tomcat:8.0.32-jre8`

Copy your war file into the container (just for testing):

`docker cp YOUR_WAR_FILE myTomcatTest:/usr/tomcat/webapps/ROOT.war`

Then navigate to:

`http://localhost:10080/`


### Build it on your own
* Clone the repo
* run `docker build -t netbisect/tomcat:8.0.32-jre8 .` in its root folder.
