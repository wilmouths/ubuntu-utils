#!/bin/bash

printf "\n[mkcert: install libnss3-tools]\n"
sudo apt install libnss3-tools -y

printf "\n[mkcert: download mkcert-v1.4.3-linux-amd64]\n"
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64

printf "\n[mkcert: move mkcert-v1.4.3-linux-amd64 to /usr/local/bin/mkcert]\n"
sudo mv mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert

printf "\n[mkcert: update rights]\n"
sudo chmod +x /usr/local/bin/mkcert

printf "\n[mkcert: generate local CA]\n"
mkcert -install