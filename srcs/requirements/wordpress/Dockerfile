# ----------------------------------------------------------------------
# -> Wordpress/php dockerfile
# ----------------------------------------------------------------------

# -> Based on alpine:3.14 image
FROM alpine:3.14

# -> Specify arguments to use when buliding containe (passed through docker-compose)
ARG DOMAIN_NAME=DOMAIN_NAME
ARG MDB_USER=MDB_USER
ARG MDB_PWS=MDB_PWS
ARG MDB=MDB
ARG WP_ADMIN=WP_ADMIN
ARG WP_ADMIN_PSW=WP_ADMIN_PSW
ARG WP_USER=WP_USER
ARG WP_USER_PSW=WP_USER_PSW

# -> Update system using apk, then upgrade
RUN apk update && apk upgrade

# -> Install wordpress and its dependencies
RUN apk add php7 php7-fpm php7-opcache php7-mysqli \
    php7-session php7-iconv php7-json \
    php7-gd php7-curl php7-xml php7-common \
    php7-imap php7-cgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-redis \
    php7-gettext php7-ldap php7-ctype php7-dom php7-phar curl

# -> Specify custom configuration file
COPY ./conf/* ./

# -> Add a user with administrator rights in wordpress
RUN adduser -D php-fpm-mboy

# -> Specify constum script that will always run when the container is initiated
ENTRYPOINT ["sh", "installation.sh"]

# -> Run wordpress/php
CMD ["php-fpm7", "-F"]

# -> Exposed on default port 9000 
EXPOSE 9000