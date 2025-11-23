
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ---- Better clear ----
alias clear='command clear; command clear'
# ---- Nushell ls function ----
ls() {
    nu -c "ls $*"
}
# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"
export PATH=$PATH:/Users/kennynguyen/.spicetify

function brew() {
  command brew "$@" 

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kennynguyen/.lmstudio/bin"

bindkey -v
bindkey -v
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# bun completions
[ -s "/Users/kennynguyen/.bun/_bun" ] && source "/Users/kennynguyen/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

source ~/.config/envman/PATH.env
fpath=(~/.zsh_completions $fpath)
autoload -U compinit && compinit

# opencode
export PATH=/Users/kennynguyen/.opencode/bin:$PATH

# GDK
export PATH=/Users/kennynguyen/repos/gdk/bin:$PATH
