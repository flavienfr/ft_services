CONTAINERS
- Nginx			:80 :443
- FTPS			:21
- wordpress		:5050
- Mysql
- Phpmyadmin	:5000
- grafana		:3000
- influxDB

Add containers to pod: (https://www.youtube.com/watch?v=zztKO0iRX_w)
Ingress https://hackernoon.com/setting-up-nginx-ingress-on-kubernetes-2b733d8d2f45

Intalation : (https://urlz.fr/bwMO / https://urlz.fr/bwMU)
- brew install kubectl
- brew install minikube
- export MINIKUBE_HOME="/sgoinfre/goinfre/Perso/froussel/ft_service/minikube/"
- minikube start --vm-driver=virtualbox
- minikube config set vm-driver virtualbox

DashBoard Install: (https://urlz.fr/bwQ7)
- kubectl apply -f dashboard-admin-user.yaml
- kubectl apply -f dashboard-cluster-role-binding.yaml
- kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
kubectl proxy
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.

Pod states :
- kubectl get po -A
Start a cluster by running:
- minikube start
Access the Kubernetes Dashboard running within the minikube cluster:
- minikube dashboard
Once started, you can interact with your cluster using kubectl, just like any other Kubernetes cluster. For instance, starting a server:
- kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
Exposing a service as a NodePort
- kubectl expose deployment hello-minikube --type=NodePort --port=8080
minikube makes it easy to open this exposed endpoint in your browser:
- minikube service hello-minikube
Start a second local cluster (note: This will not work if minikube is using the bare-metal/none driver):
- minikube start -p cluster2
Stop your local cluster:
- minikube stop
Delete your local cluster:
- minikube delete
Delete all local clusters and profiles
- minikube delete --all

START FILE
Open Terminal
Run touch ~/.bash_profile; open ~/.bash_profile
In TextEdit, add
export PATH="$HOME/.rbenv/bin:$PATH"
Save the .bash_profile file and Quit (Command + Q) Text Edit.
Run source ~/.bash_profile

DOCKER
- docker image ls   or images			print all images
- docker rmi $(docker images -a -q)		dell all images
Push image
- docker login
- docker push froussel42/nginx_service:tag
