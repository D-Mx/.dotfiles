#!/bin/sh
#
# agents: unified ~/.agents folder shared across AI tools.
#   ~/.agents          -> $DOTFILES/agents
#   ~/.claude/agents   -> ~/.agents  (Claude Code doesn't natively read ~/.agents)
#
# Tools that natively read ~/.agents (Cursor, Codex) need no extra wiring.

set -e

TOPIC_DIR="$(cd "$(dirname "$0")" && pwd -P)"

_link() {
  src="$1"
  dst="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "  ok: $dst"
    return 0
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    backup="${dst}.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "  backed up $dst -> $backup"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "  linked $src -> $dst"
}

_link "$TOPIC_DIR" "$HOME/.agents"

mkdir -p "$HOME/.claude"
_link "$HOME/.agents" "$HOME/.claude/agents"
