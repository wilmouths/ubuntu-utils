#!/bin/bash

printf "\n[nvm: install]\n"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

printf "\n[nvm: add nvm in shell]\n"
if [ $SHELL = $(which zsh) ]; then
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" >> ~/.zshrc
  source ~/.zshrc
  printf "add in ~/.zshrc\n"
else
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" >> ~/.bashrc
  source ~/.bashrc
  printf "add in ~/.bashrc\n"
fi

printf "\n[nvm: Verify Installation]\n"
command -v nvm

printf "\n[nvm: install default node version]\n"
nvm install node

printf "\n[nvm: use default node version]\n"
nvm alias default node
