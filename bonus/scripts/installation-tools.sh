#!/bin/bash 


#Créer le namspace gitlab
echo "\033[0;32mCréer le namspace gitlab\033[0;0m"
kubectl create namespace gitlab
sleep 2 

#Installer Gitlab
helm install gitlab gitlab/gitlab --namespace gitlab --values ../bonus/confs/gitlab-local-values.yaml
sleep 2
echo "\033[0;32mAttendre que toutes les pods soient prêtes\033[0;0m"
kubectl wait -n gitlab --for=condition=Ready pods --all
kubectl get pods -n gitlab
sleep 2


echo "\033[0;32mObtenir le mot de passe initial\033[0;0m"
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo
