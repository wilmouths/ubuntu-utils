#!/bin/bash

printf "\n[Tilix: install]\n"
sudo apt install tilix -y

onoff=on

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose an option:' 0 0 0)

loadDialog () {
  options=(
    1 'Make Tilix default terminal' $onoff
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

makeDefault () {
  printf "\n[Tilix: make default term]\n"
  sudo update-alternatives --config x-terminal-emulator
}

for choice in $choices
do
  case $choice in
    1) makeDefault;;
  esac
done
