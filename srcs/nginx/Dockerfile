FROM nginx:alpine

LABEL froussel <froussel@student.42.fr>

RUN apk update && apk upgrade && apk add vim

#---------- SSL ----------
RUN apk add openssl \
	&& openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#---------- SSH ----------
# ssh-keygen / ssh sshuser@IP -p PORT -i id_rsa
RUN apk add --no-cache openssh-server
COPY key/id_rsa /etc/ssh/ssh_host_rsa_key
RUN addgroup sshgroup && adduser -Ds /bin/sh -g sshgroup sshuser
RUN echo 'sshuser:' | chpasswd
ARG home=/home/sshuser/
RUN mkdir $home/.ssh
COPY key/id_rsa.pub $home/.ssh/authorized_keys
RUN chown sshuser:sshgroup $home/.ssh/authorized_keys && \
    chmod 600 $home/.ssh/authorized_keys

#---------- NGINX ----------
COPY default.conf /etc/nginx/conf.d/default.conf
# test
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80 443 22

COPY start.sh /usr/local/bin/
RUN chmod 700 /usr/local/bin/start.sh 

#CMD ["/usr/local/bin/start.sh"]
ENTRYPOINT ["/usr/local/bin/start.sh"]
CMD ["nginx", "-g", "daemon off;"]

#&& rm  -rf /tmp/* /var/cache/apk/*

#docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
