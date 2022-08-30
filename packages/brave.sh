#!/bin/bash

if ! command -v curl &> /dev/null
then
  printf "\n[Brave: install cURL]\n"
  sudo apt install curl -y
fi

printf "\n[Brave: install apt-transport-https]\n"
sudo apt install apt-transport-https -y

printf "\n[Brave: add GPG Key]\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

printf "\n[Brave: add source list]\n"
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

printf "\n[Brave: install brave-browser]\n"
sudo apt install brave-browser