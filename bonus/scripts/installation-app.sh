#!/bin/bash 

echo "\033[0;32mCréer le namspace devbonus \033[0;0m"
kubectl create namespace devbonus 
sleep 2 
echo "\033[0;32mle namespace est crées \033[0;0m" 

echo "\033[0;32mAppliquer les configurations de l'application devBonus ArgoCD\033[0;30m"
kubectl apply -f  ../bonus/confs/application.yaml -n argocd
sleep 2

# Inception-of-things