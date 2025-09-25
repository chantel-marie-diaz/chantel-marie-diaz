# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export EDITOR="nvim"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws docker docker-compose fzf-tab kubectl minikube zsh-autosuggestions fast-syntax-highlighting zsh-interactive-cd zsh-system-clipboard pulumi )

source $ZSH/oh-my-zsh.sh

# Staging File
export PATH=$PATH:/usr/local/go/bin
export DBT_KEYFILE="/home/chantel/servicekeys/staging.json"
export DEV_KEYFILE="/home/chantel/servicekeys/dev.json"
export GOOGLE_APPLICATION_CREDENTIALS="/home/chantel/servicekeys/staging.json"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Zsh Git Super Status to Show Branch State in Terminal
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Do not remove slash from dir
setopt no_auto_remove_slash

# Autojump
. /usr/share/autojump/autojump.sh

# source all shell files
DIRS=(werk)
for d in $DIRS; do
  for f in ~/."$d"/*; do
    if [[ "${f: -3}" == ".sh" ]]; then
      source $f;
    fi
  done
done

# Change Terminal Title in Terminator to Directory
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
      ;;
    *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
      ;;
  esac
}

# Use ipdb when python comes across breakpoint()
# in a file
export PYTHONBREAKPOINT=ipdb.set_trace

# Some Alias Commands
alias ls="exa"
alias b="bat"
alias dk="docker"
alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fd="fdfind"
alias safegit="git config --system --add safe.directory"
alias g="git"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias ipy="ipython"
alias pg="pgcli"
alias pu="pulumi"
alias v="nvim"
alias gohome="cd /home/chantel/"
alias gowork="cd /home/chantel/.werk/"
alias gonvim="cd /home/chantel/.config/nvim/"
alias create="python3.9 -m venv venv"
alias activate="source ./venv/bin/activate"

# Projects
alias myrepo="cd /home/chantel/.werk/chantel-marie-diaz"
alias apollo_uk="cd /home/chantel/.werk/products/apollo_uk"
alias de_utils="cd /home/chantel/.werk/de_utils"
alias scanner="cd /home/chantel/.werk/products/scanner"
alias products="cd /home/chantel/.werk/products"
# alias alerter="cd /home/chantel/.werk/alerter"
#alias pipeline_tools="cd /home/chantel/.werk/pipeline-tools"
alias reporter="cd /home/chantel/.werk/reporter"
alias apollo="cd /home/chantel/.werk/products/apollo"
alias de_shared="cd /home/chantel/.werk/de_shared"
#alias de_webdata="cd /home/chantel/.werk/git/de_webdata"
alias artemis="cd /home/chantel/.werk/products/artemis"
alias forecast="cd /home/chantel/.werk/products/forecast"
alias groundtruth="cd /home/chantel/.werk/products/ground_truth"
alias weather="cd /home/chantel/.werk/products/weather"
alias airflow_utils="cd /home/chantel/.werk/ce_airflow_utils"
alias combined="cd /home/chantel/.werk/products/combined"
alias hydrus="cd /home/chantel/.werk/dset-healthcare387"
alias phoenix="cd /home/chantel/.werk/dset-healthcare280"
alias leo="cd /home/chantel/.werk/dset-healthcare674"
alias hc="cd /home/chantel/.werk/healthcare-central"

# Bat with Nord
export BAT_THEME="Nord"

# Bat and Git
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Vgrep and Fzf
vgrep() {
  INITIAL_QUERY="$1"
  VGREP_PREFIX="vgrep --no-header "
  FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" \
  | awk '{print $1}' | xargs -I{} -o vgrep --show {}
}

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# Shortcut to copy entire zsh register into clipboard
bindkey -M vicmd 'yy' zsh-system-clipboard-vicmd-vi-yank-whole-line
