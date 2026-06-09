export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

# ---- history ----
# SHARE_HISTORY already appends each command incrementally and imports it
# across sessions, so APPEND_HISTORY / INC_APPEND_HISTORY are redundant.
setopt SHARE_HISTORY         # share history across sessions in real time
setopt EXTENDED_HISTORY      # record timestamps
setopt HIST_VERIFY           # edit a history-expansion result before running it
setopt HIST_IGNORE_ALL_DUPS  # drop older duplicate commands
setopt HIST_REDUCE_BLANKS    # trim superfluous whitespace

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# ---- key bindings ----
# Word navigation: Ctrl+Left / Ctrl+Right (Ghostty sends ^[[1;5D / ^[[1;5C).
# Option-arrow is intentionally unbound: Option composes characters here
# (macos-option-as-alt is off, which is what makes the fzf "ç" binding work).
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Home / End -> start / end of line (Ctrl+A / Ctrl+E also work by default).
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char           # Delete
bindkey '^?'    backward-delete-char  # Backspace

# ---- AI tools ----

export XCODEBUILDMCP_STARTUP_TIMEOUT_MS=10000
