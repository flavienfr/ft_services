#!/bin/sh

vsftpd &

exec "$@"