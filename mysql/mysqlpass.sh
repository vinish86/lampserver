#!/usr/bin/env sh

/etc/init.d/mysql start
echo 'Setting root password to root'
/usr/bin/mysqladmin -u root password 'vinish'
/usr/bin/mysql -u root -pqburst -e 'show databases;use mysql;GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "vinish";'

