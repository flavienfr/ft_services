#!/bin/sh

sed -i 's/^exec .*//' /docker-entrypoint.sh
/docker-entrypoint.sh php-fpm

php-fpm &
nginx -g 'daemon off;'
