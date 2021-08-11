#!/bin/bash

printf "\n[GIT: install]\n"
sudo apt install git -y

printf "\n[GIT: configuration]\n"
username=$(dialog --inputbox "GIT: Username" 0 0 2>&1 1>/dev/tty)
email=$(dialog --inputbox "GIT: Email" 0 0 2>&1 1>/dev/tty)

git config --global user.name $username
git config --global user.email $email
git config --global credential.helper 'cache --timeout 36000'