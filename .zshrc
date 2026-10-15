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
plugins=(git aws docker docker-compose kubectl minikube zsh-interactive-cd zsh-autosuggestions fast-syntax-highlighting)

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
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

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
export GITHUB_PAT="$(security find-generic-password -a "$USER" -s github_pat -w 2>/dev/null)"
export ATLASSIAN_API_TOKEN="$(security find-generic-password -a "$USER" -s atlassian_api_token -w 2>/dev/null)"
alias ls="eza"
alias dk="docker"
alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fd="fdfind"
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
alias create="python3.9 -m venv venv"
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
export BAT_THEME="Nord"

# Bat and Git
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

# Rgrep and Fzf

rgrep() { rg --line-number --with-filename . --color=always --field-match-separator ' ' \
| fzf --ansi --preview "bat --color=always {1} --highlight-line {2}" \
      --preview-window ~8,+{2}-5
    }
# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# Shortcut to copy entire zsh register into clipboard
bindkey -M vicmd 'yy' zsh-system-clipboard-vicmd-vi-yank-whole-line

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cdiaz/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cdiaz/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cdiaz/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cdiaz/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

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
export MISE_SHELL=zsh
if [ -z "${__MISE_ORIG_PATH:-}" ]; then
  export __MISE_ORIG_PATH="$PATH"
fi
export __MISE_ZSH_PRECMD_RUN=0
export __MISE_ZSH_CHPWD_RAN=0

mise() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command /opt/homebrew/bin/mise
    return
  fi
  shift

  case "$command" in
  deactivate|shell|sh)
    # if argv doesn't contains -h,--help
    if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
      eval "$(command /opt/homebrew/bin/mise "$command" "$@")"
      return $?
    fi
    ;;
  esac
  command /opt/homebrew/bin/mise "$command" "$@"
}

autoload -Uz add-zsh-hook
_mise_hook() {
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh)";
}
_mise_hook_precmd() {
  if [[ "${__MISE_ZSH_CHPWD_RAN:-0}" == "1" ]]; then
    export __MISE_ZSH_CHPWD_RAN=0
    return
  fi
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh --reason precmd)";
}
_mise_hook_chpwd() {
  export __MISE_ZSH_CHPWD_RAN=1
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh --reason chpwd)";
}
add-zsh-hook precmd _mise_hook_precmd
add-zsh-hook chpwd _mise_hook_chpwd

_mise_hook
if [ -z "${_mise_cmd_not_found:-}" ]; then
    _mise_cmd_not_found=1
    [ -n "$(declare -f command_not_found_handler)" ] && eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

    function command_not_found_handler() {
        if [[ "$1" != "mise" && "$1" != "mise-"* ]] && /opt/homebrew/bin/mise hook-not-found -s zsh -- "$1"; then
          _mise_hook
          "$@"
        elif [ -n "$(declare -f _command_not_found_handler)" ]; then
            _command_not_found_handler "$@"
        else
            echo "zsh: command not found: $1" >&2
            return 127
        fi
    }
fi
export PULUMI_BACKEND_URL='gs://er-pulumi'
unset PULUMI_CONFIG_PASSPHRASE
export PATH='/Users/cdiaz/.amp/bin:/Users/cdiaz/Downloads/google-cloud-sdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/Users/cdiaz/.nvm/versions/node/v24.12.0/bin:/Users/cdiaz/.amp/bin:/Users/cdiaz/Downloads/google-cloud-sdk/bin:/Users/cdiaz/Library/Application Support/Code/User/globalStorage/github.copilot-chat/debugCommand:/Users/cdiaz/Library/Application Support/Code/User/globalStorage/github.copilot-chat/copilotCli:/Users/cdiaz/.tfenv/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/pkg/env/active/bin:/opt/pmk/env/global/bin:/Library/Apple/usr/bin:/Users/cdiaz/.local/bin:/usr/local/go/bin:/Users/cdiaz/.pulumi/bin:/Users/cdiaz/.pulumi/bin:/Users/cdiaz/.local/bin'
autoload -Uz add-zsh-hook
add-zsh-hook -d precmd _mise_hook_precmd 2>/dev/null
add-zsh-hook -d chpwd _mise_hook_chpwd 2>/dev/null
(( $+functions[_mise_hook_precmd] )) && unset -f _mise_hook_precmd
(( $+functions[_mise_hook_chpwd] )) && unset -f _mise_hook_chpwd
(( $+functions[_mise_hook] )) && unset -f _mise_hook
(( $+functions[mise] )) && unset -f mise
unset MISE_SHELL
unset __MISE_DIFF
unset __MISE_SESSION
unset __MISE_ZSH_PRECMD_RUN
unset __MISE_ZSH_CHPWD_RAN
export MISE_SHELL=zsh
if [ -z "${__MISE_ORIG_PATH:-}" ]; then
  export __MISE_ORIG_PATH="$PATH"
fi
export __MISE_ZSH_PRECMD_RUN=0
export __MISE_ZSH_CHPWD_RAN=0

mise() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command /opt/homebrew/bin/mise
    return
  fi
  shift

  case "$command" in
  deactivate|shell|sh)
    # if argv doesn't contains -h,--help
    if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
      eval "$(command /opt/homebrew/bin/mise "$command" "$@")"
      return $?
    fi
    ;;
  esac
  command /opt/homebrew/bin/mise "$command" "$@"
}

autoload -Uz add-zsh-hook
_mise_hook() {
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh)";
}
_mise_hook_precmd() {
  if [[ "${__MISE_ZSH_CHPWD_RAN:-0}" == "1" ]]; then
    export __MISE_ZSH_CHPWD_RAN=0
    return
  fi
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh --reason precmd)";
}
_mise_hook_chpwd() {
  export __MISE_ZSH_CHPWD_RAN=1
  eval "$(/opt/homebrew/bin/mise hook-env -s zsh --reason chpwd)";
}
add-zsh-hook precmd _mise_hook_precmd
add-zsh-hook chpwd _mise_hook_chpwd

_mise_hook
if [ -z "${_mise_cmd_not_found:-}" ]; then
    _mise_cmd_not_found=1
    [ -n "$(declare -f command_not_found_handler)" ] && eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

    function command_not_found_handler() {
        if [[ "$1" != "mise" && "$1" != "mise-"* ]] && /opt/homebrew/bin/mise hook-not-found -s zsh -- "$1"; then
          _mise_hook
          "$@"
        elif [ -n "$(declare -f _command_not_found_handler)" ]; then
            _command_not_found_handler "$@"
        else
            echo "zsh: command not found: $1" >&2
            return 127
        fi
    }
fi
