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
    6 'Brave' $onoff
    7 'Git' $onoff
    8 'KeePassXC' $onoff
    9 'Make' $onoff
    10 'mkcert' $onoff
    11 'ZSH' $onoff
    12 'Python' $onoff
    13 'Peek' $onoff
    14 'Signal' $onoff
    15 'Tilix' $onoff
    16 'VSCode' $onoff
    17 'NVM' $onoff
    18 'Minikube' $onoff
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
    1) ./packages/curl.sh;;
    2) ./packages/discord.sh;;
    3) ./packages/docker.sh;;
    4) ./packages/ffmpeg.sh;;
    5) ./packages/firefox.sh;;
    6) ./packages/brave.sh;;
    7) ./packages/git.sh;;
    8) ./packages/keepassxc.sh;;
    9) ./packages/make.sh;;
    10) ./packages/mkcert.sh;;
    11) ./packages/zsh.sh;;
    12) ./packages/python.sh;;
    13) ./packages/peek.sh;;
    14) ./packages/signal.sh;;
    15) ./packages/tilix.sh;;
    16) ./packages/vscode.sh;;
    17) ./packages/nvm.sh;;
    18) ./packages/minikube.sh;;
  esac
done

sudo apt remove dialog -yqq
sudo apt remove --auto-remove dialog -yqq
sudo apt purge dialog -yqq
sudo apt purge --auto-remove dialog -yqq

sudo apt update -yqq
sudo apt autoremove -yqq
sudo apt autoclean -yqq