# ----------------------------------------------------------------------
# -> Nginx dockerfile
# ----------------------------------------------------------------------

# -> Based on alpine:3.14 image
FROM alpine:3.14

# -> Update system using apk, then upgrade
RUN apk update && apk upgrade

# -> Install nginx and its dependencies
RUN apk add nginx openssl

# -> Generate certificate and key
RUN	mkdir -p /etc/ssl/private && mkdir -p /etc/ssl/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=PACA/L=NICE/O=42Nice/CN=mboy.42.fr"

# -> Specify root directory for web content
RUN	 mkdir /var/www/html && echo "<h1>Inception</h1>" > /var/www/html/index.html;

# -> Specify custom nginx server configuration file
COPY ./conf/default.conf /etc/nginx/http.d/default.conf

# -> Run nginx
CMD [ "nginx", "-g", "daemon off;" ]

# -> Exposed on default port 443 & make listen to wordpress default port 80
EXPOSE 443 9000