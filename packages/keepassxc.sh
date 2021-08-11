#!/bin/bash

printf "\n[KeePassXC: install]\n"
sudo snap install keepassxc
wget -qO- https://raw.githubusercontent.com/keepassxreboot/keepassxc/master/utils/keepassxc-snap-helper.sh | bash