#!/bin/bash

printf "\n[VSCode: get public key]\n"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

printf "\n[VSCode: add ppa]\n"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y

printf "\n[VSCode: install]\n"
sudo apt update -y && sudo apt install code -y

printf "\n[VSCode: fetch version]\n"
code --version

onoff=on

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose extension to install:' 0 0 0)

loadDialog () {
  options=(
    1 'ESlint' $onoff
    2 'GitLens' $onoff
    3 'Docker' $onoff
    4 'Kubernetes' $onoff
    5 'LiveShare' $onoff
    6 'RemoteSSH' $onoff
    7 'RainbowCSV' $onoff
    8 'DataPreview' $onoff
    9 'YAML' $onoff
    10 'Vetur' $onoff
    11 'Todo Tree' $onoff
    12 'Conventional Commits' $onoff
  )
  choices=$("${cmd[@]}" "${options[@]}")
}

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

eslint () {
  printf "\n[VSCode: install ESLint extension]\n"
  code --install-extension dbaeumer.vscode-eslint
}

gitLens () {
  printf "\n[VSCode: install GitLens extension]\n"
  code --install-extension eamodio.gitlens
}

docker () {
  printf "\n[VSCode: install Docker extension]\n"
  code --install-extension ms-azuretools.vscode-docker
}

kubernetes () {
  printf "\n[VSCode: install Kubernetes extension]\n"
  code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
  code --install-extension mindaro.mindaro
}

liveShare () {
  printf "\n[VSCode: install LiveShare extension]\n"
  code --install-extension ms-vsliveshare.vsliveshare
}

remoteSSH () {
  printf "\n[VSCode: install RemoteSSH extension]\n"
  code --install-extension ms-vscode-remote.remote-ssh
  code --install-extension  ms-vscode-remote.remote-ssh-edit
}

rainbowCSV () {
  printf "\n[VSCode: install Rainbow CSV extension]\n"
  code --install-extension mechatroner.rainbow-csv
}

dataPreview () {
  printf "\n[VSCode: install Data Preview extension]\n"
  code --install-extension RandomFractalsInc.vscode-data-preview
}

yaml () {
  printf "\n[VSCode: install YAML extension]\n"
  code --install-extension redhat.vscode-yaml
}

vetur () {
  printf "\n[VSCode: install Vetur extension]\n"
  code --install-extension octref.vetur
}

todoTree () {
  printf "\n[VSCode: install Todo Tree extension]\n"
  code --install-extension Gruntfuggly.todo-tree
}

conventionalCommits () {
  printf "\n[VSCode: install Conventional Commits extension]\n"
  code --install-extension vivaxy.vscode-conventional-commits
}

for choice in $choices
do
  case $choice in
    1) eslint;;
    2) gitLens;;
    3) docker;;
    4) kubernetes;;
    5) liveShare;;
    6) remoteSSH;;
    7) rainbowCSV;;
    8) dataPreview;;
    9) yaml;;
    10) vetur;;
    11) todoTree;;
    12) conventionalCommits;;
  esac
done
