#!/bin/bash

# Install zsh
sudo apt-get install zsh -y

# Switch default shell to zsh
chsh -s $(which zsh)

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install terminator
sudo apt-get install terminator -y

# Install python3.9
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9 -y

# Install python virtual environments
sudo apt install python3.10-venv -y
sudo apt install python3.9-venv -y

# Install git
sudo apt-get update
sudo apt-get install git -y
git config --global user.name "Chantel Diaz"
git config --global user.email "cdiaz@consumer-edge.com"

# Make zsh directory for plugins
mkdir ~./zsh

# Install docker for ubuntu or debian
## Remove any old version first
sudo apt-get remove docker docker-engine docker.io containerd runc

## Install apt repo for docker
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## Install docker engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
### sudo docker run hello-world

# Install rclone
curl https://rclone.org/install.sh | sudo bash -y

# Install py dev env
sudo apt-get install python-dev-is-python3 -y

# Install filezilla
sudo apt-get install filezilla -y

# Install traceroute
sudo apt-get install traceroute -y

# Install figlet
sudo apt-get install figlet

# Install fd
sudo apt-get install fd-find -y

# Install fzf
sudo apt-get install fzf -y

# Install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh

# Install jq
sudo apt-get install jq -y

# Install copyq
sudo apt-get install copyq

# Install autojump
sudo apt-get install autojump -y

# Install tree
sudo apt-get install tree -y

# Install unzip
sudo apt-get install unzip -y

# Install htop
sudo apt-get install htop -y

# Install tmux
sudo apt-get install tmux -y

# Install postgres and tooling
## Do not forget, `sudo systemctl disable postgresql`
sudo apt-get install -y \
  postgresql-12 \
  pgcli

# Install tasking tool
sudo apt-get install taskwarrior -y

# Install java
sudo apt-get install default-jre -y

# Install graphviz
sudo apt-get install graphviz -y

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Install bat
sudo apt-get install bat -y

# Install exa manually
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O $HOME/Downloads/exa.zip
mkdir $HOME/Downloads/exa
unzip $HOME/Downloads/exa.zip -d $HOME/Downloads/exa
sudo cp -r $HOME/Downloads/exa/bin/. /usr/local/bin/
sudo cp -r Downloads/exa/man/. /usr/share/man/man1/
sudo cp $HOME/Downloads/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/exa.zsh
rm -rf $HOME/Downloads/exa
rm $HOME/Downloads/exa.zip

# Install delta manually
wget https://github.com/dandavison/delta/releases/download/0.14.0/git-delta_0.14.0_amd64.deb -O $HOME/Downloads/delta.deb
sudo dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

# Install md2man
sudo apt-get install go-md2man -y

# Install go
wget https://golang.org/dl/go1.20.3.linux-amd64.tar.gz -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install vgrep
git clone git@github.com:vrothberg/vgrep.git
cd vgrep
make build GO=/usr/local/go/bin/go
sudo make install GO=/usr/local/go/bin
cd ..

# Install Hacklig font
# In Debian-based systems like Ubuntu and its derivatives, copy the font files to /usr/share/fonts/ or /usr/local/share/fonts/ location to install fonts for all users i.e. system-wide.
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/Hasklig.zip -O $HOME/Downloads/Hasklig.zip
# mkdir ~/.local/share/fonts
sudo unzip $HOME/Downloads/Hasklig.zip -d /usr/local/share/fonts
#

# Install neovim and dependencies
sudo apt-get install neovim -y
sudo apt-get install -y \
  nodejs \
  npm
mkdir ./.config/nvim/
nvim +PluginInstall +qall

# Install git super status

git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zsh

# Service keys
mkdir servicekeys

# Install gcloud cli
#apt-key is deprecated, see other options when time comes
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
gcloud init # more of a placeholder
# pick project number for stage-boat and region 1

# Install kubectl
sudo apt-get install kubectl -y
# Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube -y

# Install pulumi
curl -fsSL https://get.pulumi.com | sh

# Install kubeseal
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.22.0/kubeseal-0.22.0-linux-amd64.tar.gz
tar xfz kubeseal-0.22.0-linux-amd64.tar.gz
sudo install -m 755 kubeseal /usr/local/bin/kubeseal -y

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Install sops
curl -LO https://github.com/getsops/sops/releases/download/v3.10.2/sops-v3.10.2.linux.amd64
sudo dpkg -i sops_3.10.2_amd64.deb
sudo apt-get install -f

# Install clickhouse
curl https://clickhouse.com/ | sh

# Install to verify HashiCorp's GPG signature
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common 
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install terraform
sudo apt update
sudo apt-get install terraform -y

# Install pipx
sudo apt update
sudo apt install pipx
pipx ensurepath

# Install poetry
pipx install poetry

# Install snap packages
sudo apt update
sudo apt install snapd -y

# Install slack
sudo snap install slack

# Install zoom, needs package downloaded first
sudo apt update
sudo apt install ~/Downloads/zoom_amd64.deb -y

# Install warp terminal, probably can use curl instead of manual download
sudo apt install ~/Downloads/warp-terminal_0.2025.09.17.08.11.stable.02_amd64.deb -y

# Changing terminal to my name
sudo hostnamectl hostname chantel
