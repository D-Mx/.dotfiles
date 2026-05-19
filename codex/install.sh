#!/bin/sh
#
# codex: symlink ~/.codex/config.toml to the tracked version.
#
# Plan deviation: dropped the codex/config.local.toml.example pattern because
# Codex doesn't natively support include-files, and concatenating on install
# would break round-tripping. If Codex starts atomically rewriting config.toml
# (which would break the symlink), switch to a snapshot+sync model.
#
# Stripped from the tracked file vs. the live one:
#   - [marketplaces.*] — contains local cache paths, auto-regenerated.
#   - [tui.model_availability_nux] — ephemeral UI nudge state.
#   - [projects.*] — per-path trust grants. Stripped because the path strings
#     leak machine layout and past Codex session titles. Codex will re-prompt
#     for trust on first launch after install; just re-approve.

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

_link "$TOPIC_DIR/config.toml" "$HOME/.codex/config.toml"
