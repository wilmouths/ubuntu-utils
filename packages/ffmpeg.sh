#!/bin/bash

printf "\n[ffmpeg: install]\n"
sudo apt install ffmpeg -y

printf "\n[ffmpeg: fetch version]\n"
ffmpeg -version