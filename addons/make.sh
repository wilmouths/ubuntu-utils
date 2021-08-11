#!/bin/bash

printf "\n[make: install]\n"
sudo apt install libnss3-tools make -y

printf "\n[make: fetch version]\n"
make --version