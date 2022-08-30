#!/bin/bash

if ! command -v curl &> /dev/null
then
  printf "\n[ZSH: install cURL]\n"
  sudo apt install curl -y
fi

printf "\n[Discord: install]\n"
sh -c "$(curl -o discord.deb -L https://discord.com/api/download?platform=linux&format=deb)"
sudo dpkg -i ./discord.deb &>/dev/null
