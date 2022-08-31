#!/bin/bash

printf "\n[nvm: install]\n"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

printf "\n[nvm: add nvm in shell]\n"
if [[ $SHELL == $(which zsh) ]]
then
  echo 'NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
  source ~/.zshrc
  printf "add in ~/.zshrc\n"
else
  echo 'NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"' >> ~/.bashrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.bashrc
  source ~/.bashrc
  printf "add in ~/.bashrc\n"
fi

printf "\n[nvm: Verify Installation]\n"
command -v nvm

printf "\n[nvm: install default node version]\n"
nvm install node

printf "\n[nvm: use default node version]\n"
nvm alias default node
