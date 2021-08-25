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
    11 'Python' $onoff
    12 'Peek' $onoff
    13 'Signal' $onoff
    14 'Tilix' $onoff
    15 'VSCode' $onoff
    16 'ZSH' $onoff
    17 'Albert' $onoff
    18 'Tweaks' $onoff
    19 'Minikube' $onoff
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
    6) ./packages/git.sh;;
    7) ./packages/keepassxc.sh;;
    8) ./packages/make.sh;;
    9) ./packages/mkcert.sh;;
    10) ./packages/nvm.sh;;
    11) ./packages/python.sh;;
    12) ./packages/peek.sh;;
    13) ./packages/signal.sh;;
    14) ./packages/tilix.sh;;
    15) ./packages/vscode.sh;;
    16) ./packages/zsh.sh;;
    17) ./packages/albert.sh;;
    18) ./packages/tweaks.sh;;
    19) ./packages/minikube.sh;;
  esac
done

sudo apt remove dialog -yqq
sudo apt remove --auto-remove dialog -yqq
sudo apt purge dialog -yqq
sudo apt purge --auto-remove dialog -yqq

sudo apt update -yqq
sudo apt autoremove -yqq
sudo apt autoclean -yqq