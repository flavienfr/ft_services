export MINIKUBE_HOME="/sgoinfre/goinfre/Perso/froussel/ft_service/minikube/"
minikube start

kubectl apply -f srcs/admin-user.yaml
kubectl apply -f srcs/admin-role.yaml
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

#docker built ...

# kubectl apply -f nginx-deployment.yaml
# kubectl apply -f nginx-service.yaml 

# minikube addons enable ingress

#kubectl create -f ingress-controller.yaml
#kubectl get ingress test-ingress 	

#apiVersion: apps/v1
#kind: Deployment
#metadata:
#  name: nginx
#  labels:
#    app: nginx
#  namespace: default
#spec:
#  selector:
#    matchLabels:
#      app: nginx
# strategy: 		# ici
#    type: Recreate  # ici
#  template:
#    metadata:
#      labels:
#        app: nginx
#    spec:
#      restartPolicy: Always    # ici
#      containers:
#      - name: nginx
#        image: nginx_ssh
#        imagePullPolicy: Never  # ici