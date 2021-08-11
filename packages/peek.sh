#!/bin/bash

printf "\n[peek: add ppa]\n"
sudo add-apt-repository ppa:peek-developers/stable -y

printf "\n[peek: install]\n"
sudo apt update -y && sudo apt install peek -y

printf "\n[peek: fetch version]\n"
peek --version