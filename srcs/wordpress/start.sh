#!/bin/sh

# users:
# - froussel	42
# - user1		password1
# - user2		password2

MYSQL="mysql -h $WORDPRESS_DB_HOST -u $WORDPRESS_DB_USER --password=$WORDPRESS_DB_PASSWORD"

conn_error()
{
	echo Connection error! Exiting...
	exit 1
}

# crash if connection error
$MYSQL -e '' || conn_error

# init database
if ! $MYSQL -e 'USE wordpress;'
then
	echo Initializing database...

	$MYSQL -e 'CREATE DATABASE wordpress;' ||
		( $MYSQL -e 'DROP DATABASE wordpress;'; conn_error)
	$MYSQL wordpress < /db_wordpress.sql ||
		( $MYSQL -e 'DROP DATABASE wordpress;'; conn_error)
fi

# setup
sed -i 's/^exec .*//' /usr/local/bin/docker-entrypoint.sh
docker-entrypoint.sh php-fpm

# run
/usr/sbin/nginx && /usr/local/sbin/php-fpm
