#!/bin/sh
#
# cursor:
#   - symlinks ~/.cursor/cli-config.json to the tracked version.
#   - symlinks ~/Library/Application Support/Cursor/User/{settings,keybindings}.json
#     to the tracked versions under cursor/ide/.
#
# AI agent/skill/rule content for Cursor lives under agents/ (Cursor reads
# ~/.agents natively).

set -e

TOPIC_DIR="$(cd "$(dirname "$0")" && pwd -P)"
CURSOR_USER_DIR="$HOME/Library/Application Support/Cursor/User"

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

_link "$TOPIC_DIR/cli-config.json" "$HOME/.cursor/cli-config.json"

if [ -d "$CURSOR_USER_DIR" ]; then
  _link "$TOPIC_DIR/ide/settings.json"    "$CURSOR_USER_DIR/settings.json"
  _link "$TOPIC_DIR/ide/keybindings.json" "$CURSOR_USER_DIR/keybindings.json"
else
  echo "  skip: cursor IDE not installed (no $CURSOR_USER_DIR)"
fi
