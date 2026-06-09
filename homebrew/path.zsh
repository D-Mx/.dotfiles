# Homebrew (Apple Silicon). `brew shellenv` exports HOMEBREW_PREFIX,
# PATH, MANPATH, etc. — HOMEBREW_PREFIX is needed by zsh/plugins.zsh.
eval "$(/opt/homebrew/bin/brew shellenv)"
