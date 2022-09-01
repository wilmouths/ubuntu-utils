#!/bin/bash

printf "\n[Mattermost: install]\n"
curl -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash
sudo apt install mattermost-desktop -y
sudo apt upgrade mattermost-desktop -y
