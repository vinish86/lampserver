FROM ubuntu:14.04
MAINTAINER Vinish Soman <vinish86@gmail.com>
# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq && apt-get install -y mysql-server

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN mkdir           /root/mysql/
ADD mysqlpass.sh  /root/mysql/run
RUN chmod +x        /root/mysql/run
RUN /bin/sh /root/mysql/run
RUN rm -rf /root/mysql

CMD ["mysqld_safe"]

EXPOSE 3306
