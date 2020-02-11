#!/bin/sh
#export MINIKUBE_HOME="/sgoinfre/goinfre/Perso/froussel/ft_service/minikube/"

# Ensure docker and minikube are installed
if ! which docker >/dev/null 2>&1 ||
    ! which minikube >/dev/null 2>&1
then
    echo Please install Docker and Minikube
    exit 1
fi

minikube start --vm-driver=virtualbox \
				--cpus 3 --disk-size=30000mb --memory=3000mb \
				--extra-config=apiserver.service-node-port-range=1-32767

kubectl apply -f srcs/adm/admin-user.yaml
kubectl apply -f srcs/adm/admin-role.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

minikube addons enable ingress
minikube addons enable metrics-server

export MINIKUBE_IP=$(minikube ip)

cp -f srcs/ftps/vsftpd_NO_IP.conf srcs/ftps/vsftpd.conf
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/ftps/vsftpd.conf
cp -f srcs/telegraf/telegraf_NO_IP.conf srcs/telegraf/telegraf.conf
sed -i '' "s/##MINIKUBE_IP##/$MINIKUBE_IP/g" srcs/telegraf/telegraf.conf

# Docker build
#docker build -t froussel42/grafana_service srcs/grafana
docker build -t froussel42/ftps_service srcs/ftps
#docker build -t froussel42/mysql_service srcs/mysql
#docker build -t froussel42/nginx_service srcs/nginx
#docker build -t froussel42/phpmyadmin_service srcs/phpmyadmin
#docker build -t froussel42/wordpress_service srcs/wordpress

#docker push froussel42/grafana_service
docker push froussel42/ftps_service
#docker push froussel42/mysql_service
#docker push froussel42/nginx_service
#docker push froussel42/phpmyadmin_service
#docker push froussel42/wordpress_service


kubectl apply -k ./srcs/

minikube ip



#docker built ...

# kubectl apply -f nginx-deployment.yaml
# kubectl apply -f nginx-service.yaml 

#kubectl create -f ingress-controller.yaml
#kubectl get ingress test-ingress 	


#kubectl create configmap influxdb-config --from-file=influxdb.conf
#kubectl apply -f influxdb-secrets.yaml
