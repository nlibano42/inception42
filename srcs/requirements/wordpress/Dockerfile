FROM debian:bullseye

RUN apt update && \
	apt upgrade -y && \
    apt install -y php7.4 php-fpm php-mysql mariadb-client curl && \
	rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www/nlb/wordpress

RUN mkdir /run/php/

COPY conf/setup.sh /

RUN chown -R root:root /var/www/nlb/wordpress/

CMD ["sh", "/setup.sh"]
