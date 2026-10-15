#!/usr/bin/env zsh
# Mac setup. Safe to re-run: every step skips work that is already done.
#
# Before this script:
#   xcode-select --install
#   See https://consumer-edge.atlassian.net/wiki/spaces/DENG/pages/640581679/Data+Eng+Setup+Guide
# After this script:
#   SSH key: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
#   GPG key: gpg --default-new-key-algo rsa4096 --gen-key
#            home/.gitconfig already signs with key 1C9539D93608875B
#   gcloud init          (opens a browser)
#   Docker Desktop       first launch asks for a password

set -euo pipefail

DOTFILES=${0:A:h}

# --- Homebrew, and everything it installs ------------------------------------
if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Formulae, casks, uv tools and npm globals all live in the Brewfile.
brew bundle --file="$DOTFILES/Brewfile"

# --- Shell -------------------------------------------------------------------
# --unattended keeps the installer from replacing this shell mid-script and from
# running chsh. The login shell is already /bin/zsh.
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  # The installer leaves its own template at ~/.zshrc. This repository's copy
  # replaces it. It is a copy and not a link; see home/.stow-local-ignore.
  cp "$DOTFILES/home/.zshrc" ~/.zshrc
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
clone_plugin() {  # $1 = repository, $2 = plugin name
  [[ -d "$ZSH_CUSTOM/plugins/$2" ]] || git clone --depth 1 "$1" "$ZSH_CUSTOM/plugins/$2"
}
clone_plugin https://github.com/Aloxaf/fzf-tab fzf-tab
clone_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
clone_plugin https://github.com/zdharma-continuum/fast-syntax-highlighting fast-syntax-highlighting
clone_plugin https://github.com/kutsan/zsh-system-clipboard zsh-system-clipboard

# --- Dotfiles ----------------------------------------------------------------
# Stow symlinks everything under home/ into $HOME, so the repository holds the
# only copy of each file and the two cannot drift apart.
mkdir -p ~/.config/nvim
stow -d "$DOTFILES" -t "$HOME" home

# Git needs no setup here: identity, signing key and aliases are all in the
# stowed home/.gitconfig.

# --- Editors -----------------------------------------------------------------
[[ -d ~/.vim/bundle/Vundle.vim ]] ||
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall

# Python provider for Neovim, needed by UltiSnips. init.vim points
# g:python3_host_prog at this venv. uv's own Python keeps it working across
# Homebrew Python upgrades.
if [[ ! -d ~/.local/share/nvim/venv ]]; then
  uv python install 3.12
  uv venv --python-preference only-managed --python 3.12 ~/.local/share/nvim/venv
  uv pip install --python ~/.local/share/nvim/venv/bin/python pynvim
fi

# --- Cloud tooling -----------------------------------------------------------
# .zshrc sources path.zsh.inc and completion.zsh.inc from this directory.
if [[ ! -d ~/.local/share/google-cloud-sdk ]]; then
  mkdir -p ~/.local/share
  curl -fsSL -o "$TMPDIR/gcloud.tar.gz" \
    https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-arm.tar.gz
  tar -xf "$TMPDIR/gcloud.tar.gz" -C ~/.local/share
  # .zshrc already sources path.zsh.inc and completion.zsh.inc, so the
  # installer must not append its own copies of those lines.
  ~/.local/share/google-cloud-sdk/install.sh --quiet --path-update false --command-completion false
fi

command -v rclone >/dev/null || { sudo -v; curl https://rclone.org/install.sh | sudo bash; }

# composer-local-dev. Homebrew's Python refuses `pip install .` because it marks
# itself externally managed, so install it as a standalone tool.
if ! command -v composer-dev >/dev/null; then
  [[ -d ~/.werk/composer-local-dev ]] ||
    git clone git@github.com:GoogleCloudPlatform/composer-local-dev.git ~/.werk/composer-local-dev
  uv tool install ~/.werk/composer-local-dev
fi

# --- Work repositories -------------------------------------------------------
mkdir -p ~/.werk
clone_repo() {  # $1 = clone URL
  local name=${${1##*/}%.git}
  [[ -d ~/.werk/$name ]] || git clone "$1" ~/.werk/$name
}
clone_repo git@github.com:chantel-marie-diaz/chantel-marie-diaz.git
clone_repo org-42072952@github.com:EarnestResearch/healthcare-central.git
clone_repo git@github.com:consumer-edge/ce_airflow_utils.git
clone_repo git@github.com:consumer-edge/products.git
clone_repo git@github.com:consumer-edge/de_shared.git
clone_repo git@github.com:consumer-edge/de_utils.git
clone_repo git@github.com:consumer-edge/reporter.git

# --- Machine -----------------------------------------------------------------
[[ $(scutil --get HostName 2>/dev/null) == chanteldiaz ]] || sudo scutil --set HostName chanteldiaz
