#!/bin/bash

onoff=on

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose the tools to install:' 0 0 0)

loadDialog () {
  options=(
    1 'cURL' $onoff
    2 'Discord' $onoff
    3 'Docker' $onoff
    4 'ffmpeg' $onoff
    5 'FireFox (extensions)' $onoff
    6 'Git' $onoff
    7 'KeePassXC' $onoff
    8 'Make' $onoff
    9 'mkcert' $onoff
    10 'nvm' $onoff
    11 'Peek' $onoff
    12 'Signal' $onoff
    13 'Tilix' $onoff
    14 'VSCode' $onoff
    15 'ZSH' $onoff
  )
  choices=$("${cmd[@]}" "${options[@]}")
}

sudo apt update -yqq
sudo apt full-upgrade -yqq
sudo apt install dialog -yqq

loadDialog

exitCode="$?"

while [[ $exitCode -ne 0 ]]; do
  case $exitCode in
    1) clear; onoff=off; loadDialog;;
    3) clear; onoff=on; loadDialog;;
  esac
  exitCode="$?"
done

clear

for choice in $choices
do
  case $choice in
    1) ./addons/$choice.sh;;
    2) ./addons/$choice.sh;;
    3) ./addons/$choice.sh;;
    4) ./addons/$choice.sh;;
    5) ./addons/$choice.sh;;
    6) ./addons/$choice.sh;;
    7) ./addons/$choice.sh;;
    8) ./addons/$choice.sh;;
    9) ./addons/$choice.sh;;
    10) ./addons/$choice.sh;;
    11) ./addons/$choice.sh;;
    12) ./addons/$choice.sh;;
    13) ./addons/$choice.sh;;
    14) ./addons/$choice.sh;;
    15) ./addons/$choice.sh;;
  esac
done

sudo apt remove dialog -yqq
sudo apt remove --auto-remove dialog -yqq
sudo apt purge dialog -yqq
sudo apt purge --auto-remove dialog -yqq

sudo apt update -yqq
sudo apt autoremove -yqq
sudo apt autoclean -yqq