#!/bin/bash 

#installer helm
echo "\033[0;32mInstaller helm\033[0;0m"
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
sleep 2


#Ajouter le Repo GitLab Helm
echo "\033[0;32mAjouter le Repo GitLab Helm\033[0;0m" 
helm repo add gitlab https://charts.gitlab.io/
helm repo update
sleep 2


#Créer le namspace gitlab
echo "\033[0;32mCréer le namspace gitlab\033[0;0m"
kubectl create namespace gitlab
sleep 2 

#Installer Gitlab
helm install gitlab gitlab/gitlab --namespace gitlab --values ./bonus/confs/gitlab-local-values.yaml
sleep 2
echo "\033[0;32mAttendre que toutes les pods soient prêtes\033[0;0m"
kubectl wait -n gitlab --for=condition=Ready pods --all
kubectl get pods -n gitlab
sleep 2


echo "\033[0;32mObtenir le mot de passe initial\033[0;0m"
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo
