# Zsh Autocomplete
source /home/chantel/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Staging File
export PATH=$PATH:/usr/local/go/bin
export DBT_KEYFILE="/home/chantel/servicekeys/staging.json"
export DEV_KEYFILE="/home/chantel/servicekeys/dev.json"
export GOOGLE_APPLICATION_CREDENTIALS="/home/chantel/servicekeys/staging.json"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export PULUMI_CONFIG_PASSPHRASE=""

# Zsh Git Super Status to Show Branch State in Terminal
source ~/.zsh/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Do not remove slash from dir
setopt no_auto_remove_slash

# Fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
source /home/chantel/.zsh/fzf-tab/fzf-tab.plugin.zsh

# load library functions
source /home/chantel/.zsh/zsh-ls-colors/ls-colors.zsh '' fmt

# Same as :completion:* list-colors
# Uses LS_COLORS format
#zstyle $pattern list-colors ${(s[:])LS_COLORS} '*.ext=1'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Same as :completion:* list-colors
zstyle '*' list-colors "${(@s[:])LS_COLORS}" '*.md=35'

# emable extendedglob under certain contexts:
zstyle ':demo:other-context' list-colors-extended true

# set extra definitions in certain contexts:
zstyle ':demo:other-context' list-colors "${(@s[:])LS_COLORS}" '*.md=35' '(#i)(*/|)license(|.*)=04'
# (underline LICENSE, or license.txt, or similar)

# set custom format in certain contexts:
zstyle ':demo:other-context' list-format '%F%P%r%(h.%I%i. ➤ %L%l%r)'
zstyle ':demo:other-context:yet-another-context' list-format $'%F\e[7m\ue0b0%P\e[0m%F\ue0b0%r%(h.. (%L%l%r%))'
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
alias v="nvim"
alias gohome="cd /home/chantel/"
alias gowork="cd /home/chantel/werk/"
alias gonvim="cd /home/chantel/.config/nvim/"
alias create="python3.9 -m venv venv"
alias activate="source ./venv/bin/activate"

# Projects
alias myrepo="cd /home/chantel/werk/chantel-marie-diaz"
alias apollo_uk="cd /home/chantel/werk/products/apollo_uk"
alias de_utils="cd /home/chantel/werk/de_utils"
alias scanner="cd /home/chantel/werk/products/scanner"
alias products="cd /home/chantel/werk/products"
alias alerter="cd /home/chantel/werk/alerter"
alias myrepo="cd /home/chantel/werk/chantel-marie-diaz"
alias pipeline_tools="cd /home/chantel/werk/pipeline-tools"
alias reporter="cd /home/chantel/werk/reporter"
alias apollo="cd /home/chantel/werk/products/apollo"
alias de_shared="cd /home/chantel/werk/de_shared"
alias de_webdata="cd /home/chantel/werk/git/de_webdata"
alias hera="cd /home/chantel/werk/products/hera"
alias artemis="cd /home/chantel/werk/products/artemis"
alias forecast="cd /home/chantel/werk/products/forecast"
alias groundtruth="cd /home/chantel/werk/products/ground_truth"
alias weather="cd /home/chantel/werk/products/weather"
alias airflow_utils="cd /home/chantel/werk/products/ce_airflow_utils"
alias combined="cd /home/chantel/werk/products/combined"


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

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
