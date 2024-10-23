#!/bin/bash 

#Os : Debian

sudo apt update 
 

#installer kubectl 
echo "\033[0;32mInstaller kubectl\033[0;0m"
curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
alias k="kubectl"
 
#installer K3d 
echo "\033[0;32mInstaller K3d\033[0;0m"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash 
k3d version

#installer argocd cli
echo "\033[0;32mInstaller ArgocdCli\033[0;0m"
curl -sSL https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 -o argocd
sudo install argocd /usr/local/bin/

