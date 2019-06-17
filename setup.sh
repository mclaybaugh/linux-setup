#!/bin/bash
# Author: Michael Claybaugh
# Date created: Friday, Apr 13, 2018
# Description: Bash shell script for automating the setup of my prefered linux
#              programs and settings
#**************************************************************
# Section 1: Installation of software
#**************************************************************

read -p "Apt Install norms for Ubuntu? [y/N]: " wantsUbuntuNorms
if [ "$wantsUbuntuNorms" == "y" ]; then
  sudo apt install build-essential curl git npm nodejs ranger docker docker-compose php
  sudo systemctl start docker
  sudo systemctl enable docker
fi

$t="MCSetup:"
$repoHome=$HOME/remote-repositories/

read -p "Install discord deb? [y/N]: " wantsDiscord
if [ "$wantsDiscord" == "y" ]; then
  echo "$t Downloading release from discord..."
  curl -Lo discord.deb https://discordapp.com/api/download?platform=linux&format=deb
  echo "$t Installing"
  sudo dpkg -i discord.deb
  echo "$t Removing installation file"
  rm -v discord.deb
fi

read -p "Install vscodium 1.35.1 from github? [y/N]: " wantsVscodium
if [ "$wantsVscodium" == "y" ]; then
  echo "$t Downloading release from Github..."
  curl -Lo vscodium.deb https://github.com/VSCodium/vscodium/releases/download/1.35.1/codium_1.35.1-1560422401_amd64.deb
  echo "$t Installing"
  sudo dpkg -i vscodium.deb
  echo "$t Removing installation file"
  rm -v vscodium.deb
fi

read -p "Install ripgrep 11.0.1 from github? [y/N]: " wantsRipgrep
if [ "$wantsRipgrep" == "y" ]; then
  echo "$t Downloading release from Github..."
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
  echo "$t Installing"
  sudo dpkg -i ripgrep_11.0.1_amd64.deb
  echo "$t Removing installation file"
  rm -v ripgrep_11.0.1_amd64.deb
fi

read -p "Clone and build neovim? [y/N]: " wantsNeovim
if [ "$wantsNeovim" == "y" ]; then
    echo "$t Install prerequisites..."
    sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
    echo "$t Clone repository..."
    git clone https://github.com/neovim/neovim $repoHome/neovim
    echo "$t Build and install..."
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=Release
    make install
fi

# clone standard repos
read -p "git clone the normal repos? [y/N]: " wantsGitClone
if [ "$wantsGitClone" == "y" ]; then
    git clone https://github.com/magicmonty/bash-git-prompt $repoHome/bash-git-prompt
fi

read -p "Install Vim-Plug? [y/N]: " wantsVimPlug
if [ "$wantsVimPlug" == "y" ]; then
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "After this setup, open Vim and type :PlugInstall"
fi

read -p "Install eslint from npm? [y/N]: " wantsEslint
if [ "$wantsEslint" == "y" ]; then
  sudo npm install --global eslint
fi

#read -p "Install python? [y/N]: " wantsPython
#if [ "$wantsPython" == "y" ]; then
#  sudo apt install python python-dev python-pip python3 python3-dev python3-pip
#fi

#read -p "Pacman -Syu norms for Manjaro? [y/N]: " installManjaroNorms
#if [ "$installManjaroNorms" == "y" ]; then
#  installManjaroNorms
#  sudo pacman -Syu fzf ripgrep ranger fish snapd docker docker-compose
#fi

# To connect to SQL Server
#sudo apt install freetds unixodbc unixodbc-dev

#*************************************************************
# Section 3: Updating config files in home directory
#**************************************************************

VIM_CONFIG_DIR=~/.config/nvim
read -p "Copy vimrc to ~/.config/nvim/init.vim? [y/N]: " wantsInitVim
if [ "$wantsInitVim" ]; then
  if [ ! -d "$VIM_CONFIG_DIR" ]; then
    mkdir $VIM_CONFIG_DIR
  fi
  cp -v vimrc $VIM_CONFIG_DIR/init.vim
fi

read -p "Setup git config name and email? [y/N]: " wantsSetupGit
if [ "$wantsSetupGit" == "y" ]; then
  git config --global user.name "Michael Claybaugh"
  git config --global user.email "mclaybaugh2@liberty.edu"
fi

read -p "Set permissions of ssh folder? [y/N]: " wantsSshPerms
if [ "$wantsSshPerms" == "y" ]; then
  sudo chmod -v 700 ~/.ssh
  sudo chmod -v 644 ~/.ssh/id_rsa.pub
  sudo chmod -v 600 ~/.ssh/id_rsa
  sudo chmod -v 600 ~/.ssh/config
fi

read -p "Set Bash to be case insensitive? [y/N]: " wantsBashCaseFix
if [ "$wantsBashCaseFix" == "y" ]; then
  # If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
  # so it won't get overriden
  if [ ! -a ~/.inputrc ]; then echo 'source /etc/inputrc' > ~/.inputrc; fi

  # Add shell-option to ~/.inputrc to enable case-insensitive tab completion
  echo 'set completion-ignore-case On' >> ~/.inputrc
fi

# Getting nvm to work with fish
# 1. install fisher
#curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
# 2. install bass
#fisher add edc/bass
# 3. add function to ~/.config/fish/functions/nvm.fish
#function nvm
#  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
#end
