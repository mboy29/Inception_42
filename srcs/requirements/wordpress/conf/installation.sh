# ----------------------------------------------------------------------
# -> Wordpress/php custom installation script
# With CLI : A tool that enables you to interact with your WordPress 
# site directly by using commands in a text-based interface.
# ----------------------------------------------------------------------

sleep 20

# -> Download Wordpress/php CLI to specified directory and give permissions
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp

# -> Dowload Wordpress/php with CLI to specified directory
chmod 777 /var/www/html
ls /var/www/html
wp core download --allow-root --path="/var/www/html"

# -> Replace default configuration files with custom ones for Wordpress and php
rm -f /var/www/html/wp-config.php7
rm -f /etc/php7/php-fpm.d/www.conf
cp ./config.php /var/www/html/wp-config.php
cp ./www.conf /etc/php7/php-fpm.d/www.conf

# -> Lauchn Wordpress/php with CLI installation, specifying a admin and default user
wp core install --allow-root --url=${DOMAIN_NAME} --title="Inception" --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PSW} --admin_email="admin@admin.com" --path="/var/www/html"
wp --allow-root user create ${WP_USER} "mboy@mboy.com" --role="author" --user_pass=${WP_USER_PSW}  --path="/var/www/html"
sleep 2

# -> Deamonizer
$@