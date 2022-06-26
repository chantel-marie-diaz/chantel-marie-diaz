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

```
