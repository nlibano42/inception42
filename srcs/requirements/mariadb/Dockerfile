FROM debian:bullseye

RUN apt update && \
	apt upgrade -y && \
	apt install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY conf/setup.sh /

CMD ["sh", "/setup.sh"]