export GEM_HOME="$HOME/.gem"

path=(
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.dotfiles/bin"
  "$HOME/Library/pnpm/bin"
  "$GEM_HOME/bin"
  $path
)

export PATH

# ---- zsh config ----

setopt INC_APPEND_HISTORY      # Write to history file immediately, not on exit
setopt SHARE_HISTORY           # Share history across all sessions in real time

# ---- asdf ----

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

# ---- FUCK! ----

fuck() {
  unfunction fuck
  eval $(thefuck --alias)
  fuck "$@"
}

# ---- FZF ----

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

source <(fzf --zsh)
source ~/.dotfiles/fzf/fzf.git.zsh

bindkey "ç" fzf-cd-widget

# ---- Zoxide (better cd) ----

eval "$(zoxide init zsh)"

# ---- Starship (prompt) ----

export STARSHIP_CONFIG=~/.dotfiles/starship/starship.toml
eval "$(starship init zsh)"

# ---- zsh "plugins" ----

ZSH_AUTOSUGGEST_USE_ASYNC=true
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Bind up/down arrows for substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ---- Aliases ----
alias st='open -a "Sublime Text"'
