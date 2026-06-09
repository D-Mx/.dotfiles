# zsh plugins (installed via Homebrew). HOMEBREW_PREFIX is exported by
# homebrew/path.zsh, which the loader sources before any regular *.zsh file.
# Order matters: syntax-highlighting then history-substring-search load last.

ZSH_AUTOSUGGEST_USE_ASYNC=true
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Bind up/down arrows for substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
