#!/bin/bash

printf "\n[Discord: install]\n"
wget -o discord.deb https://discord.com/api/download?platform=linux&format=deb
sudo dpkg -i ./discord.deb
rm -r ./discord.deb