# ----------------------------------------------------------------------
# -> MariaDB custom start script
# ----------------------------------------------------------------------

# -> Set MySQL data directory and create system tables, if they do not yet exist
/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql

# -> Startup MySQL database
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 10

# -> Create MySQL database if it does not yet exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB}\`;"

# -> Create MySQL user if it does not yet exist and grant all privileges
mysql -e "CREATE USER IF NOT EXISTS \`${MDB_USER}\`@'localhost' IDENTIFIED BY '${MDB_PWS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MDB}\`.* TO \`${MDB_USER}\`@'%' IDENTIFIED BY '${MDB_PWS}';"

# -> Modify MySQL accounts
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PSW}';"

# -> Reload the grant tables
mysql -e "FLUSH PRIVILEGES;"

# -> Shutdown MySQL database and start it again
pkill mysqld
sleep 1
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql