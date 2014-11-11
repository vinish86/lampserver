#FROM vinish/supervisor_base
FROM ubuntu:14.04
MAINTAINER Vinish Soman <vinish@qburst.com>
# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install apache2 libapache2-mod-php5 php5 libapache2-mod-auth-mysql php5-mysql php5-gd php5-mcrypt php5-curl vim mysql-client

RUN apt-get install wget -y
RUN mkdir -p /var/www/html/pma
WORKDIR /var/www/html/pma
RUN wget http://sourceforge.net/projects/phpmyadmin/files/phpMyAdmin/4.2.11/phpMyAdmin-4.2.11-all-languages.tar.gz

#CMD ["tar", "-zxvf", "/var/www/html/pma/pmaphpMyAdmin-4.2.11-all-languages.tar.gz", "--strip-components=1", "-C", "/var/www/html/pma"]
RUN tar -zxvf *.tar.gz --strip-components=1 -C .
RUN rm -rf /var/www/html/pma/pmaphpMyAdmin-4.2.11-all-languages.tar.gz
RUN cp /var/www/html/pma/config.sample.inc.php /var/www/html/pma/config.inc.php
RUN sed -i '/?>/d' /var/www/html/pma/config.inc.php
ADD phpmyadmin.conf /opt/phpmyadmin.conf
RUN cat /opt/phpmyadmin.conf >> /var/www/html/pma/config.inc.php
RUN rm -rf /opt/phpmyadmin.conf
EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
