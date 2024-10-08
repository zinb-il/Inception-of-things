#!/bin/sh 

#Os : Debian

sudo apt update 
 
#installer curl, vim 
sudo apt install -y curl

#installer docker
echo "\033[0;32mInstaller docker\033[0;0m" 
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update 
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin  
sudo systemctl start docker
sudo systemctl enable docker 
sudo usermod -aG docker $(whoami)
newgrp docker

 

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

