# Everything installed from Homebrew, in one place.
#   brew bundle --file=Brewfile          install everything listed here
#   brew bundle check --file=Brewfile    list what is missing on this machine
#   brew bundle dump --force --file=Brewfile   rewrite this file from what is installed
#
# Not covered here, because Homebrew does not manage them:
#   gcloud (tarball under ~/Downloads, see install_mac.zsh), rclone (rclone.org installer),
#   poetry (pipx), composer-dev (uv tool), Neovim's Python venv (uv).

tap "hashicorp/tap"

# Run your GitHub Actions locally
brew "act"
# Official Amazon AWS command-line interface
brew "awscli"
# Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
# Modern, maintained replacement for ls
brew "eza"
# Simple, fast and user-friendly alternative to find
brew "fd"
# Command-line fuzzy finder written in Go
brew "fzf"
# GitHub command-line tool
brew "gh"
# Distributed revision control system
brew "git"
# Syntax-highlighting pager for git and diff output
brew "git-delta"
# GNU Privacy Guard (OpenPGP)
brew "gnupg"
# Open source programming language to build simple/reliable/efficient software
brew "go"
# Graph visualization software from AT&T and Bell Labs
brew "graphviz"
# Polyglot runtime manager (asdf rust clone)
brew "mise"
# Ambitious Vim-fork focused on extensibility and agility
brew "neovim"
# Pinentry for GPG on Mac
brew "pinentry-mac"
# Execute binaries from Python packages in isolated environments
brew "pipx"
# PDF rendering library (based on the xpdf-3.0 code base)
brew "poppler"
# Object-relational database system
brew "postgresql@14"
# Cloud native development platform
brew "pulumi"
# Interpreted, interactive, object-oriented programming language
brew "python@3.11"
brew "python@3.12"
brew "python@3.14"
# Search tool like grep and The Silver Searcher
brew "ripgrep"
# Multiple GNOME terminals in one window
brew "terminator"
# Terraform version manager inspired by rbenv
brew "tfenv"
# Display directories as trees (with optional color/HTML output)
brew "tree"
# Extremely fast Python package installer and resolver, written in Rust
brew "uv"
# UNIX shell (command interpreter)
brew "zsh"

cask "font-hasklig"
cask "font-hasklug-nerd-font"
# Terminal emulator that uses platform-native UI and GPU acceleration
cask "ghostty"
# Terminal emulator as alternative to Apple's Terminal app
cask "iterm2"

uv "dbt-oss"
uv "keyring", with: ["keyrings-google-artifactregistry-auth"]

npm "@google/gemini-cli"
npm "corepack"

# Apps installed by hand on this machine. Uncomment on a new machine to let
# Homebrew install and update them instead.
# cask "cursor"
# cask "docker-desktop"
# cask "firefox"
# cask "notion"
# cask "nordvpn"
# cask "slack"
# cask "spotify"
# cask "warp"
# cask "zed"
# cask "zoom"
