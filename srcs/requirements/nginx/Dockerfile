FROM debian:bullseye

RUN apt update && \
	apt upgrade -y && \
	apt install -y nginx openssl && \
	rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/private-key.key -out /etc/ssl/certs/certificate.crt -subj "/C=FR/L=Paris/O=42/CN=nlibano.42.fr"

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	mkdir /var/www/nlb/

RUN chmod 755 /var/www/nlb/
RUN chown -R www-data:www-data /var/www/nlb/

CMD ["nginx", "-g", "daemon off;"]
