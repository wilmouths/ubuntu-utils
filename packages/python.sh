#!/bin/bash

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose python version:' 0 0 0)

loadDialog () {
  options=(
    1 'Python2' on
    2 'Python3' off
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

python2 () {
  printf "\n[Python2: install]\n"
  sudo apt install python2 -y

  python2Path=$(which python2)

  if [[ -f ~/.zshrc ]]; then
    echo "export PYTHONPATH=$python2Path" >> ~/.zshrc
    source ~/.zshrc
    printf "add in ~/.zshrc\n"
  else
    echo "export PYTHONPATH=$python2Path" >> ~/.bashrc
    source ~/.bashrc
    printf "add in ~/.bashrc\n"
  fi
}

python3 () {
  printf "\n[Python3: install]\n"
  sudo apt install python3-dev python3-pip python3-setuptools -y

  python3Path=$(which python3)
  if [[ -f ~/.zshrc ]]; then
    echo "export PYTHONPATH=$python3Path" >> ~/.zshrc
    source ~/.zshrc
    printf "add in ~/.zshrc\n"
  else
    echo "export PYTHONPATH=$python3Path" >> ~/.bashrc
    source ~/.bashrc
    printf "add in ~/.bashrc\n"
  fi
}

for choice in $choices
do
  case $choice in
    1) python2;;
    2) python3;;
  esac
done
