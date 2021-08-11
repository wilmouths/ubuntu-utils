#!/bin/bash

printf "\n[Docker: apt install]\n"
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

printf "\n[Docker: add GPG Key]\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

printf "\n[Docker: install]\n"
sudo apt update -y && sudo apt install docker-ce docker-ce-cli containerd.io -y

printf "\n[Docker: adding user $USER in docker group]\n"
sudo usermod -aG docker $USER

printf "\n[Docker: install docker-compose]\n"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose