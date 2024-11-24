#!/bin/sh

apt-get update
apt-get install curl -y

# k3s Installation & setting node ip option for the script #

curl -sfL https://get.k3s.io | sh -s - --node-ip 192.168.56.110

# Deployments and Services Config #

kubectl apply -f configs/config-webapp1.yaml
kubectl apply -f configs/config-webapp2.yaml
kubectl apply -f configs/config-webapp3.yaml

# Ingresses Config #

kubectl apply -f configs/config-ingress.yaml