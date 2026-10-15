# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

PROMPT='chanteldiaz@%m %1~ %#'
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
# ezample format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git aws docker docker-compose kubectl minikube zsh-interactive-cd fzf-tab zsh-system-clipboard zsh-autosuggestions fast-syntax-highlighting)

pulumi-hc() {
    PULUMI_BACKEND_URL="gs://er-pulumi" \
    PULUMI_SELF_MANAGED_STATE_GZIP="true" \
    PULUMI_SKIP_UPDATE_CHECK="true" \
    pulumi "$@"
  }

source $ZSH/oh-my-zsh.sh

# Staging File
export PATH=$PATH:/usr/local/go/bin

export PULUMI_BACKEND_URL=gs://er-pulumi
export PULUMI_SELF_MANAGED_STATE_GZIP=true

#export PULUMI_CONFIG_PASSPHRASE=~ceiac~

#export DBT_KEYFILE="/home/chanteldiaz/servicekeys/staging.json"
#export DEV_KEYFILE="/home/chanteldiaz/servicekeys/dev.json"
#export GOOGLE_APPLICATION_CREDENTIALS="/home/chanteldiaz/servicekeys/staging.json"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Zsh Git Super Status to Show Branch State in Terminal
# Git branch and status in the prompt, from oh-my-zsh's git library.
# zsh-git-prompt needed `python`, which macOS does not have.
ZSH_THEME_GIT_PROMPT_PREFIX="%F{cyan}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{cyan})%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}✚"
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{red}✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{red}…"
ZSH_THEME_GIT_PROMPT_STASHED="%F{blue}⚑"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}↑"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{cyan}↓"
ZSH_THEME_GIT_PROMPT_DIVERGED="%F{magenta}↕"
PROMPT='%B%m%~%b$(git_prompt_info)$(git_prompt_status)%f %# '

export GPG_TTY=$(tty)

# Do not remove slash from dir
setopt no_auto_remove_slash

# Autojump
#. /usr/share/autojump/autojump.sh

# source all shell files
# DIRS=(werk)
# for d in $DIRS; do
#   for f in ~/."$d"/*; do
#     if [[ "${f: -3}" == ".sh" ]]; then
#       source $f;
#     fi
#   done
# done

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
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
fpath[1,0]="/opt/homebrew/share/zsh/site-functions";
eval "$(/usr/bin/env PATH_HELPER_ROOT="/opt/homebrew" /usr/libexec/path_helper -s)"
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
# Tokens. The public dotfiles repo reads these from the macOS Keychain, not inline.
# Add one with: security add-generic-password -a "$USER" -s github_pat -w
export GITHUB_PAT="$(security find-generic-password -a "$USER" -s github_pat -w 2>/dev/null)"
export ATLASSIAN_API_TOKEN="$(security find-generic-password -a "$USER" -s atlassian_api_token -w 2>/dev/null)"
alias ls="eza"
alias dk="docker"
alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias safegit="git config --system --add safe.directory"
alias g="git"
alias l="eza"
alias la="eza -a"
alias ll="eza -l"
alias lla="eza -al"
alias ipy="ipython"
alias pg="pgcli"
alias pu="pulumi"
alias v="nvim"
alias gohome="cd ~/"
alias gowork="cd ~/.werk/"
alias gonvim="cd ~/.config/nvim/"
alias create="uv venv -p 3.9 --seed venv"
alias activate="source ./venv/bin/activate"

# Projects
alias myrepo="cd ~/.werk/chantel-marie-diaz"
alias apollo_uk="cd ~.werk/products/apollo_uk"
alias de_utils="cd ~/.werk/de_utils"
alias scanner="cd ~/.werk/products/scanner"
alias products="cd ~/.werk/products"
alias alerter="cd ~/.werk/alerter"
alias myrepo="cd ~/.werk/chantel-marie-diaz"
alias pipeline_tools="cd ~/.werk/pipeline-tools"
alias reporter="cd ~/.werk/reporter"
alias apollo="cd ~/.werk/products/apollo"
alias de_shared="cd ~/.werk/de_shared"
alias de_webdata="cd ~/.werk/git/de_webdata"
alias artemis="cd ~/.werk/products/artemis"
alias forecast="cd ~/.werk/products/forecast"
alias groundtruth="cd ~/.werk/products/ground_truth"
alias weather="cd ~/.werk/products/weather"
alias airflow_utils="cd ~/.werk/ce_airflow_utils"
alias combined="cd ~/.werk/products/combined"
alias hydrus="cd ~/.werk/healthcare-central/dbt/hc_387"
alias phoenix="cd ~/.werk/healthcare-central/dbt/hc_280"
alias leo="cd ~/.werk/healthcare-central/dbt/hc_674"
alias hc="cd ~/.werk/healthcare-central"
# Bat with Nord
export BAT_THEME="ansi"

# Bat and Git
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Rgrep and Fzf

# Fuzzy-search every line under the current directory, including dotfiles, with a bat preview.
# An optional argument narrows the search to lines that match that regex first.
# The preview highlights every match; with no argument it underlines the selected line.
# Enter opens the selected line in nvim.
vgrep() {
  local match preview
  local -x pattern="${1:-.}"
  if [[ -n "$1" ]]; then
    preview='bat --color=always {1} | rg --passthru --color=always --colors "match:bg:yellow" --colors "match:fg:black" --colors "match:style:nobold" -e "$pattern"'
  else
    preview='bat --color=always {1} --highlight-line {2}'
  fi
  match=$(rg --hidden --glob '!.git/' --line-number --with-filename --color=always --field-match-separator ' ' "$pattern" \
    | fzf --ansi --preview "$preview" \
          --preview-window '~8,+{2}-5') || return
  nvim "+${${match#* }%% *}" "${match%% *}"
}
alias rgrep=vgrep
# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# Shortcut to copy entire zsh register into clipboard
bindkey -M vicmd 'yy' zsh-system-clipboard-vicmd-vi-yank-whole-line

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cdiaz/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cdiaz/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cdiaz/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cdiaz/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

# Created by `pipx` on 2025-12-01 16:07:36
export PATH="$PATH:/Users/cdiaz/.local/bin"

# Amp CLI
export PATH="/Users/cdiaz/.amp/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Work docs
export WERK_DOCS="$HOME/.werk/docs"
wdoc() {
  if [ -z "$1" ]; then
    find "$WERK_DOCS" -name "*.md" | sed "s|$WERK_DOCS/||"
  else
    find "$WERK_DOCS" -name "*${1}*.md" | sed "s|$WERK_DOCS/||"
  fi
}

# mise: tool versions and per-directory env. It generates its hooks at shell start.
eval "$(mise activate zsh)"
