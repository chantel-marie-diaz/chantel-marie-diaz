source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export DBT_KEYFILE="/home/chantel/servicekeys/staging.json"

export GOOGLE_APPLICATION_CREDENTIALS="/home/chantel/servicekeys/staging.json"

source ~/.zsh/zsh-git-prompt/zshrc.sh

# source /home/chantel/gruvbox-zsh/gruvbox.zsh

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
#source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
#source $HOME/fzf-tab/fzf-tab.plugin.zsh

# an example prompt
PROMPT='%B%m%~%b$(git_super_status) %# '

. "$HOME/.cargo/env"

source $HOME/.cargo/env

#Some Commads
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

#Projects
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


export BAT_THEME="Nord"

#vgrep and fzf
vgrep() {
  INITIAL_QUERY="$1"
  VGREP_PREFIX="vgrep --no-header "
  FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" \
  fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" \
  | awk '{print $1}' | xargs -I{} -o vgrep --show {}
}




source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/chantel/.zsh/zsh-syntax-highlighting/zsh
