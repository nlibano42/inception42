#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]
then 

service mariadb start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
sleep 5

fi

exec mysqld -u root