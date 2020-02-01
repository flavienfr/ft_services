#!/bin/sh

#nginx &
/usr/sbin/sshd -D &

exec "$@"
