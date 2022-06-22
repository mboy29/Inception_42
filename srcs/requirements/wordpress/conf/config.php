<?php

// ---------------------------------------------------------------------- -->
// -> Php custom configuration
// ----------------------------------------------------------------------

// -> Base definitions for database
define( 'DB_NAME', getenv( 'MDB' ) ); // -> WordPress database name
define( 'DB_USER', getenv( 'MDB_USER' ) ); // -> MySQL database username
define( 'DB_PASSWORD', getenv( 'MDB_PWS' ) ); // -> MySQL database password
define( 'DB_HOST', 'mariadb:3306' ); // -> MySQL hostname
define( 'DB_CHARSET', 'utf8' ); // -> MySQL database charset to use for database tables creations
define( 'DB_COLLATE', 'utf8_bin' ); // -> MySQL collate default type

// -> Base definitions for wordpress
define( 'WP_SITEURL', 'https://mboy.42.fr'); // -> WordPress site URL
define( 'WP_HOME', 'https://mboy.42.fr'); // -> WordPress home site URL

// -> WordPress authentication unique keys and salts
define('AUTH_KEY',         '*94o+xof{_|-%uA=EBe+}JmxXt6XA/Ez/mZ(M+*&=ih}-Y}d$*r|1bzHBwYl&n=+');
define('SECURE_AUTH_KEY',  '&.a|[*du={vqyTjdk|~[rN!B!ltVcP[/cw22*2h.S{s=l2-B[]eV0CdL#rKv0o`h');
define('LOGGED_IN_KEY',    '.[5ltt<ti{AM]5P~!U:NU0P02u?#SVnlM*/qNOelBew2d@2x*o{]&SPUyfBeTXk]');
define('NONCE_KEY',        'D`m+cBw7(-KR+wSm-|I7&MRs]x;d?L.k5A:^|!=Q:-g8GU(Z+ m7%tKq{)I&AD;P');
define('AUTH_SALT',        'yH>7`YzIjp<&JFi+Nw7F={-ee%(|^zHg|77VeF*n}4ad~eo$ku[R_[2wbYfBS4xE');
define('SECURE_AUTH_SALT', '~6Evw7WP*6WXYbyjo&g^ ~)D_-PCqb8,2+ZwY{/Ve)@;@{uK}EE#;7,c.Rwkw!@H');
define('LOGGED_IN_SALT',   'iI^/<k!B#U*|2)j%.lL;+ ri)X3o|Rmlu; ,5K|1a:+J0f 8 7%aq+F+-?=Bfkj/');
define('NONCE_SALT',       '+ p%X[fUsqRJN#$Iln@FaL3`:<9/yo&4:r>rsjSly8sx@xD3#i|.XS=#w/^rwU.=');

// -> WordPress database table prefix
$table_prefix = 'wp_';

// -> WordPress debugging mode
define( 'WP_DEBUG', false );

// -> Absolute path to the WordPress directory
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

// -> Set up WordPress vars and files to include
require_once ABSPATH . 'wp-settings.php';