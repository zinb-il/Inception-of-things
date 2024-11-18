#!/bin/bash 

#Os : Debian

sudo apt update 
 
#installer curl, vim 
sudo apt install -y curl

#installer docker
echo "\033[0;32mInstaller docker\033[0;0m" 
sudo apt install -y apt-transport-https ca-certificates software-properties-common
sudo apt update
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $(whoami)
( newgrp docker && echo "You can now use Docker without sudo." )
docker --version