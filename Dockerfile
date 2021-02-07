FROM ubuntu:20.04
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password 01-2W-Lq" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password 01-2W-Lq" | debconf-set-selections
RUN apt-get install -y mysql-server
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y default-jre
COPY JavaWebServerStXaJ.jar /root/
COPY esempiodb_persona.sql/root/
CMD service mysql start && mysql -u root -p01-2W-Lq < /root/esempiodb_persona.sql && java -jar /root/JavaWebServerStXaJ.jar