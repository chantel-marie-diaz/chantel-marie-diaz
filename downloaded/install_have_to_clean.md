# to be dated...maybe

# Install zsh
```
echo > .zshrc
sudo apt-get install zsh -y
chsh -s $(which zsh)
```

# Install terminator
```
sudo apt-get install terminator
```

# Install python3.9
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9
```

# Install python virtual environments
```
sudo apt install python3.10-venv
sudo apt install python3.9-venv
```

# Install git
```
sudo apt-get update
sudo apt-get install git
git config --global user.name "Chantel Diaz"
git config --global user.email "cdiaz@consumer-edge.com"
```

# Clone zsh plugins
```
mkdir zsh
cd ./zsh
```

## zsh syntax highlighting
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## zsh autosuggestions
```
# Note the source command must be at the end of ~/.zshrc. from INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# add to .zshrc: source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

## zsh autocomplete
```
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
# add to zshrc source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# to update % git -C ~zsh-autocomplete pull
```

# Install Docker for ubuntu or debain
## Uninstall old docker versions
```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

## Install the apt repo for docker
```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```
```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
  
# Install docker engine
```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
```

# Install rclone
```
curl https://rclone.org/install.sh | sudo bash
```

# Install py dev env
```
sudo apt-get install python-dev-is-python3
```

# Install filezilla
```
apt-get install filezilla
```

# Install traceroute
```
apt-get install traceroute
```

# Install vim-gtk and vim
```
apt-get install vim-gtk -y
sudo add-apt-repository ppa:/jonathonf/vim
apt-get update
apt install vim
```

# Install figlet
```
apt-get install figlet
```

# Install fd
```
apt-get install fd-find -y
```

# Install fzf
```
apt-get install fzf -y
```

# Install fzf-tab
```
cd /.zsh
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh
```

# Install jq
```
apt-get install jq -y
```

# Install copyq
```
apt-get install copyq
```

# Install autojump
```
apt-get install autojump -y
```

# Install tree
```
apt-get install tree -y
```

# Install unzip
```
apt-get install unzip -y
```

# Install htop
```
apt-get install htop -y
```

# Install tmux
```
apt-get install tmux
```

# Install postgres and related tooling
```
# Do not forget, `sudo systemctl disable postgresql`
sudo apt-get install -y \
  postgresql-12 \
  pgcli
```
 
# Install tasking tool
```
apt-get install taskwarrior
```

# Install java
```
apt-get install default-jre -y
```

# Install graphviz
```
apt-get install graphviz -y
```

# Install vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim
```

# Install bat
```
sudo apt-get install bat -y
```
# Download exa, delta manually

