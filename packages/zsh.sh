#!/bin/bash

if ! command -v curl &> /dev/null
then
  printf "\n[ZSH: install cURL]\n"
  sudo apt install curl -y
fi

printf "\n[ZSH: installation]\n"
sudo apt install zsh -y 

printf "\n[ZSH: Install oh-my-zsh]\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

onoff=on

cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose an option:' 0 0 0)

loadDialog () {
  options=(
    1 'Make ZSH default terminal' $onoff
    2 'Install PowerLine fonts' $onoff
    3 'Use Agnoster in default theme' $onoff
    4 'Hide prompt context' $onoff
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
  printf "\n[ZSH: make default shell]\n"
  sudo chsh -s $(which zsh)
}

powerLineFonts () {
  printf "\n[ZSH: install fonts-powerline]\n"
  sudo apt-get install fonts-powerline -y
}

agnoster () {
  printf "\n[ZSH: use agnoster theme]\n"
  sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/g' ~/.zshrc
}

context () {
  printf "\n[ZSH: hide user in prompt context]\n"
  echo "prompt_context() {}" >> ~/.zshrc
}

for choice in $choices
do
  case $choice in
    1) makeDefault;;
    2) powerLineFonts;;
    3) agnoster;;
    4) context;;
  esac
done