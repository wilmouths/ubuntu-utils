#!/bin/bash

printf "\n[KeePassXC: add ppa]\n"
sudo add-apt-repository ppa:phoerious/keepassxc
sudo apt update -y

printf "\n[KeePassXC: install]\n"
sudo apt install keepassxc