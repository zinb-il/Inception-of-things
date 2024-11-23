#!/bin/bash 

#installer helm
echo "\033[0;32mInstaller helm\033[0;0m"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm version
rm -f get_helm.sh
sleep 2

#Ajouter le Repo GitLab Helm
echo "\033[0;32mAjouter le Repo GitLab Helm\033[0;0m" 
helm repo add gitlab https://charts.gitlab.io/
helm repo update
sleep 2