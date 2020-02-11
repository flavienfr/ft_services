FROM phpmyadmin/phpmyadmin:fpm-alpine

RUN apk update && apk upgrade && apk add nginx \
&& apk add vim

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh


ENTRYPOINT sh /start.sh

CMD ["tail", "-F", "/var/log/nginx/access.log"]