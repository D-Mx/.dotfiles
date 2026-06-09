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
