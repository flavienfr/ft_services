FROM alpine:latest

LABEL froussel <froussel@student.42.fr>

RUN apk update && apk upgrade && apk --update --no-cache add vsftpd
#debug
RUN apk add vim 

RUN addgroup ftpsgroup && adduser -D -g ftpsgroup ftpsuser
RUN echo 'ftpsuser:test' | chpasswd
COPY vsftpd.conf /etc/vsftpd/

EXPOSE 21 20

COPY start.sh /usr/local/bin/
RUN chmod 700 /usr/local/bin/start.sh  

ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["sh"]
