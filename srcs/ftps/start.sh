#!/bin/sh

vsftpd &

exec "$@"
