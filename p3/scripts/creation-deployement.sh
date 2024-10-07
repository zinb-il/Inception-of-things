#!/bin/sh

#echo "Créer un cluster avec deux pods "

#sudo k3d cluster create p3 --api-port 6443 -p 8080:80@loadbalancer --agents 2

#echo "votre cluster est encours de création"
#sleep 5
#echo "Vérification de si le cluster a été bien créer"
#kubectl cluster-info


#echo "Créer les namspaces argcd et dev"
#sudo kubectl create namespace dev
#sudo kubectl create namespace argocd
#sleep 2
#echo "les deux namespace sont crées"


#echo “Installer Argocd dans le namespace argocd”
#sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#sleep 2

echo “Appliquer la configuration de l’ingress “
sudo kubectl apply -f ../confs/argocd-ingress.yaml -n argocd
sleep 2
