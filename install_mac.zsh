#!/bin/bash
# Take a look at https://consumer-edge.atlassian.net/wiki/spaces/DENG/pages/640581679/Data+Eng+Setup+Guide for any manual stuff needed before or after this
# git config --global commit.gpgsign true make default commit git config --global user.signingkey EEC01C4F739029BA
# MAKE SURE INSTALL XCODE xcode-select --install
# download brew

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install zsh
brew install zsh

# Switch default shell to zsh
chsh -s $(which zsh)

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Manually correct slashes in ~/.zprofile if needed then source
eval "$(/opt/homebrew/bin/brew shellenv)"

# Source zprofile
source ~/.zprofile

# Additional zsh plugins
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/kutsan/zsh-system-clipboard ${ZSH_CUSTOM:-~/.zsh}/plugins/zsh-system-clipboard

# Other terminals
brew install --cask ghostty
brew install terminator

#Install python envs
brew install python3
brew install python@3.9
brew install python@3.10
brew install python@3.11

# Install git
brew install git
git config --global user.name "Chantel Diaz"
git config --global user.email "cdiaz@consumer-edge.com"

# Make zsh directory for plugins
mkdir ~/zsh

# Install docker manually, https://docs.docker.com/desktop/setup/install/mac-install/ then
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker
#docker engine not needed for MAC

# Install rclone
sudo -v ; curl https://rclone.org/install.sh | sudo bash

# Install py dev env
sudo apt-get install python-dev-is-python3 -y

# Install fd
brew install fd

# Download filezilla manually
https://filezilla-project.org/download.php?platform=macos-arm64#close

# Install fzf
brew install fzf

# Install autojump
brew install autojump

# Install tree
brew install tree

# Install unzip
brew install unzip

# Install tmux
brew install tmux

# Install postgres
brew install postgresql

# Install graphviz
# brew install graphviz

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Install bat
brew install bat

# Install eza instead of exa
# brew install exa
brew install eza

# Install git delta
brew install git-delta

# Install go
brew install go

# Install vgrep
brew install vgrep

# Install hasklig
brew install --cask font-hasklig

# Install neovim, add init.vim before starting
# TODO: clone repo and grab init.vim beforehand
brew install neovim
mkdir ./.config/nvim/
nvim +PluginInstall +qall
brew install pynvim

# Install git super status
git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh

# Gcloud CLI
# get tar file, programtically
tar -xf google-cloud-cli-darwin-arm.tar.gz
./google-cloud-sdk/install.sh
./google-cloud-sdk/install.sh

# Install pulumi
brew install pulumi

# Install helm
brew install helm

# Install terraform
brew tap hashicorp/tap 
brew install tfenv

# Install pipx
brew install pipx

# Install poetry
# pipx install poetry
brew install poetry

#new ssh key
#ssh-keygen -t ed25519 -C "cdiaz@consumer-edge.com"
#$ eval "$(ssh-agent -s)"
#touch ~/.ssh/config
#https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#Host github.com
#  AddKeysToAgent yes
#  UseKeychain yes
#  IdentityFile ~/.ssh/id_ed25519
# ssh-add  ~/.ssh/id_ed25519
# $ pbcopy < ~/.ssh/id_ed25519.pub
# Copies the contents of the id_ed25519.pub file to your clipboard

# Install work git repositories, configure
mkdir .werk
cd .werk
# git config --system --add safe.directory insert/name/of/directory
git clone git@github.com:chantel-marie-diaz/chantel-marie-diaz.git
# healthcare
git clone org-42072952@github.com:EarnestResearch/dset-healthcare387.git
git clone org-42072952@github.com:EarnestResearch/dset-healthcare674.git
git clone org-42072952@github.com:EarnestResearch/dset-healthcare280.git
git clone org-42072952@github.com:EarnestResearch/healthcare-central.git
# legacy CE products
git clone git@github.com:consumer-edge/products.git
git clone git@github.com:consumer-edge/de_shared.git
git clone git@github.com:consumer-edge/ce_airflow_utils.git
git clone git@github.com:consumer-edge/reporter.git
git clone git@github.com:consumer-edge/de_utils.git
cd ..

# Generate gpg keys
#gpg --default-new-key-algo rsa4096 --gen-key
#git config --global commit.gpgsign true
brew install gnupg

# Install composer-local-dev
git clone git@github.com:GoogleCloudPlatform/composer-local-dev.git
cd composer-local-dev/
pip install .
cd ..

sudo scutil --set HostName chanteldiaz
