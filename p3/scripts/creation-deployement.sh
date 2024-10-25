#!/bin/bash 
 
echo "\033[0;32mCréer un cluster p3 avec deux worker node \033[0;0m" 
k3d cluster create p3 --api-port 6443 -p 8080:80@loadbalancer --agents 2
echo "\033[0;32mvotre cluster est encours de création\033[0;0m"
sleep 5
echo "\033[0;32mVérification que le cluster a bien été créé \033[0;0m" 
kubectl cluster-info
echo "\033[0;32mListe des nœuds du cluster:\033[0;0m"
kubectl get nodes
echo "\033[0;32mListe des pods du système:\033[0;0m"
kubectl get pods -A

 

echo "\033[0;32mCréer les namspaces argcd et dev \033[0;0m"
kubectl create namespace dev 
kubectl create namespace argocd 
sleep 2 
echo "\033[0;32mles deux namespace sont crées \033[0;0m" 

 

echo "\033[0;32mInstaller Argocd dans le namespace argocd\033[0;0m" 
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
kubectl apply -n argocd -f ./p3/confs/install-argocd.yaml 
 
echo "\033[0;32mAttendre que tous les pods dans le namespace argocd atteignent l'état Ready\033[0;0m"
kubectl wait -n argocd --for=condition=Ready pods --all 
sleep 2 

echo "\033[0;32mAppliquer la configuration de la ConfigMap\033[0;0m" 
kubectl apply -f ./p3/confs/argocd-config-map.yaml -n argocd 
sleep 2


echo "\033[0;32mAppliquer la configuration de l’ingress\033[0;0m" 
kubectl apply -f ./p3/confs/argocd-ingress.yaml -n argocd 
sleep 2
 
echo "\033[0;32mChanger le mot de passe \033[0;0m " 
kubectl -n argocd patch secret argocd-secret \
	-p '{"stringData": { 
		"admin.password": "$2a$12$jxnCCcR.YqDBAckevqSZreuDLjRKRUqLulaEFDqBa0Qb9mt5UvP3W", 
		"admin.passwordMtime": "'$(date +%FT%T%Z)'" 
}}' 
sleep 2


echo "\033[0;32mAppliquer l'application ArgoCD\033[0;30m"
kubectl apply -f  ./p3/confs/application.yaml -n argocd
sleep 2

echo "\033[0;32mCéer une alias pour la commande kubectl\033[0;0m"
alias k="kubectl" 
rm -fr kubectl argocd

