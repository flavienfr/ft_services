  
FROM alpine

RUN apk add --update mysql mysql-client && \
	rm -f /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf
COPY start.sh /start.sh

RUN mkdir /app

EXPOSE 3306
CMD sh /start.sh
