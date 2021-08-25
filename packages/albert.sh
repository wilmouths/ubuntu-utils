#!/bin/bash

printf "\n[Albert: install]\n"
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt update -y
sudo apt upgrade -y
sudo apt install albert -y