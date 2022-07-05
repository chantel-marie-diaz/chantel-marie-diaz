# Install zsh

```
echo > .zshrc
sudo apt-get install zsh -y
chsh -s $(which zsh)
# zsh

#Python 3.9 https://linuxhint.com/install-python-3-9-linux-mint/



sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.9
# python3.9 --version


#switch to default python 3.9 https://stackoverflow.com/questions/62902303/configure-python3-pointing-to-usr-bin-python3-8-in-linux-mint-after-installing

sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1

#https://cloud.google.com/sdk/docs/install#deb gcloud debian  ubuntu stuff

# https://www.atlassian.com/git/tutorials/install-git#linux

sudo apt-get update
sudo apt-get install git
# git --version
git config --global user.name "Emma Paris" 
git config --global user.email "eparis@atlassian.com"

cd ./zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Note the source command must be at the end of ~/.zshrc. from INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
#add to .zshrc: source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/marlonrichert/zsh-autocomplete

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
#add to zshrc source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# to update % git -C ~zsh-autocomplete pull

sudo apt-get install terminator
# https://snapcraft.io/install/snapd/mint


sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update

#To install snap from the Software Manager application, search for snapd and click Install.
#Alternatively, snapd can be installed from the command line:

sudo apt update
sudo apt install snapd

#Either restart your machine, or log out and in again, to complete the installation.
# Install snapd

To install snapd, simply use the following command:

sudo snap install snapd
snap install pycharm-community --classic.

# https://linuxhint.com/install_docker_linux_mint/
sudo apt install docker*
sudo snap install dbeaver-ce
curl https://rclone.org/install.sh | sudo bash

# Install py dev env
apt-get install python-dev-is-python3

sudo apt install python3-pip
https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# download get_pip.py

#gawk is installed 

# Install filezilla
apt-get install filezilla
# look a+ alternative maybe to nmap

# Install traceroute
apt-get install traceroute

# Install vim-gtk
apt-get install vim-gtk -y


# Install figlet
apt-get install figlet

# Install fd
apt-get install fd-find -y

ln -s $(which fdfind) ~/.local/bin/fd


apt-get install fzf -y
# Install jq
apt-get install jq -y

# Install copyq
apt-get install copyq

# Install autojump
apt-get install autojump -y

# Install tree
apt-get install tree -y

# Install tree
apt-get install unzip -y we have it

apt-get install htop -y

# Install tmux
apt-get install tmux


# Install postgresl
apt-get install postgresql-12

apt-get install pgcli

apt-get install xclip already there 

# Install tasking tool
apt-get install taskwarrior


# Install java
apt-get install default-jre -y already installed 


# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim


Manually

Clone this repository somewhere ($HOME/.zsh-vi-mode for example)

git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh-vi-mode

Then source it in your .zshrc (or .bashrc)

source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh


# Clone jedi for vim
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim



# Install graphviz
apt-get install graphviz -y

git clone https://github.com/Aloxaf/fzf-tab ~/somewhere

Then add the following line to your ~/.zshrc.

source ~/somewhere/fzf-tab.plugin.zsh

# Install sd
cargo install sd

# Install tree alternative
cargo install tre-command

# Install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update
apt install gh

# Install delta manually # installed differently
wget $DELTA -O $HOME/Downloads/delta.deb
dpkg -i $HOME/Downloads/delta.deb
rm $HOME/Downloads/delta.deb

wget $GO -O $HOME/Downloads/go.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf $HOME/Downloads/go.tar.gz
export PATH=$PATH:/usr/local/go/bin

apt-get install go-md2man -y

git clone https://github.com/vrothberg/vgrep.git
cd vgrep
make build GO=/usr/local/go/bin/go
make install GO=/usr/local/go/bin/go
cd ..



# Install nmap
apt-get install nmap .. we'll see 


sudo apt install python3.9-venv


https://github.com/EliverLara/terminator-themes/blob/master/schemes/Gruvbox%20Dark.config
https://github.com/morhetz/gruvbox




```
