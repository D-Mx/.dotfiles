# fzf shell integration: completion + key bindings (^R, ^T, ⌥C).
# The git widgets in fzf/fzf.git.zsh are auto-loaded separately by the loader.

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

source <(fzf --zsh)

# ⌥C on macOS emits "ç"; bind it to fzf's cd widget.
bindkey "ç" fzf-cd-widget
