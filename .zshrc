# Zsh Autocomplete
source /home/chantel/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Staging File
export DBT_KEYFILE="/home/chantel/servicekeys/staging.json"
export GOOGLE_APPLICATION_CREDENTIALS="/home/chantel/servicekeys/staging.json"

# Zsh Git Super Status to Show Branch State in Terminal
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /home/chantel/.zsh/fzf-tab/fzf-tab.plugin.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

#source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Autojump
. /usr/share/autojump/autojump.sh

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
alias bat="batcat"
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
alias gowork="cd /home/chantel/werk/"
alias create="python -m venv venv"
alias activate="source ./venv/bin/activate"

# Projects
alias apollo_uk="cd /home/chantel/werk/apollo_uk"
alias de_utils="cd /home/chantel/werk/de_utils"
alias scanner="cd /home/chantel/werk/scanner"
alias pipeline_tools="cd /home/chantel/werk/pipeline-tools"
alias reporter="cd /home/chantel/werk/reporter"
alias apollo="cd /home/chantel/werk/apollo"
alias de_shared="cd /home/chantel/werk/de_shared"
alias de_webdata="cd /home/chantel/werk/git/de_webdata"
alias hera="cd /home/chantel/werk/hera"
alias artemis="cd /home/chantel/werk/artemis"
alias forecast="cd /home/chantel/werk/forecast"
alias groundtruth="cd /home/chantel/werk/ground-truth-ce"
alias weather="cd /home/chantel/werk/ce-weather"

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

# Zsh Autosuggestions and Syntax Highlighting
source /home/chantel/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/chantel/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
