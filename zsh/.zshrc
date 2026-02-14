export GEM_HOME="$HOME/.gem"

path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.dotfiles/bin"
  "/usr/local/bin"
  "$(brew --prefix)/bin"
  "$GEM_HOME/bin"
  $path
)

export PATH

# ---- FUCK! ----

eval $(thefuck --alias)

# ---- FZF ----

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

source <(fzf --zsh)

# ---- Zoxide (better cd) ----

eval "$(zoxide init zsh)"

# ---- Starship (prompt) ----

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# ---- zsh "plugins" ----

ZSH_AUTOSUGGEST_USE_ASYNC=true
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
