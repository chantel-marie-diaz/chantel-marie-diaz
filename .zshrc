# Zsh Autocomplete
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Staging File
export DBT_KEYFILE="/home/chantel/servicekeys/staging.json"
export GOOGLE_APPLICATION_CREDENTIALS="/home/chantel/servicekeys/staging.json"

# Zsh Git and Fzf
source ~/.zsh/zsh-git-prompt/zshrc.sh
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

#source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
#source $HOME/fzf-tab/fzf-tab.plugin.zsh

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

# Git Super Status to Show Branch State in Terminal
PROMPT='%B%m%~%b$(git_super_status) %# '

# Cargo
. "$HOME/.cargo/env"
source $HOME/.cargo/env

# Some Alias Commands
alias ls="exa"
alias dk="sudo docker"
alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias fd="fdfind"
alias make="sudo make"
alias safegit="sudo git config --system --add safe.directory"
alias g="git"
alias l="exa"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -al"
alias ipy="ipython"
alias pg="pgcli"
alias v="vim"
alias gohome="cd /home/chantel/"
alias gowork="cd /home/chantel/werk/git"
alias create="python -m venv venv"
alias activate="source ./venv/bin/activate"

# Projects
alias apollo_uk="cd /home/chantel/werk/git/apollo_uk"
alias de_utils="cd /home/chantel/werk/git/de_utils"
alias scanner="cd /home/chantel/werk/git/scanner"
alias pipeline_tools="cd /home/chantel/werk/git/pipeline-tools"
alias reporter="cd /home/chantel/werk/git/reporter"
alias apollo="cd /home/chantel/werk/git/apollo"
alias de_shared="cd /home/chantel/werk/git/de_shared"
alias de_webdata="cd /home/chantel/werk/git/de_webdata"
alias hera="cd /home/chantel/werk/git/hera"
alias artemis="cd /home/chantel/werk/git/artemis"
alias forecast="cd /home/chantel/werk/git/forecast"
alias groundtruth="cd /home/chantel/werk/git/ground-truth-ce"
alias weather="cd /home/chantel/werk/git/ce-weather"
alias de_data_quality="cd /home/chantel/werk/git/de_data_quality"

# Bat with Nord
export BAT_THEME="Nord"

# Vgrep and Fzf
vgrep() {
  INITIAL_QUERY="$1"
  VGREP_PREFIX="vgrep --no-header "
  FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" \
  | awk '{print $1}' | xargs -I{} -o vgrep --show {}
}

# Zsh Autosuggestions and Syntax Highlighting
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/chantel/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
