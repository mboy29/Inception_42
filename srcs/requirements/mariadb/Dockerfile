# ----------------------------------------------------------------------
# -> MariaDB dockerfile
# ----------------------------------------------------------------------

# -> Based on alpine:3.14 image
FROM alpine:3.14

# -> Update system using apk, then upgrade
RUN apk update && apk upgrade

# -> Install mariaDB and its dependencies
RUN apk add mariadb mariadb-common mariadb-client mariadb-server-utils

# -> Replace MariaDB default configuration file with a custom one
RUN rm -f /etc/my.cnf.d/mariadb-server.cnf && rm -f /etc/my.cnf.d/my.cnf
COPY conf/my.cnf /etc/my.cnf.d/mly.cnf
COPY conf/my.cnf /etc/mysql/my.cnf

# -> Create necessary directories
RUN mkdir -p /run/mysqld /var/lib/mysql && chown -R mysql /var/lib/mysql

# -> Run MariaDB custom start script
COPY conf/start.sh start.sh
CMD ["sh", "start.sh"]

# -> Exposed on default port 3306
EXPOSE 3306