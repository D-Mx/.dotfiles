# asdf shell completions. This fpath must be set before the loader runs
# compinit (see zsh/zshrc.symlink); regular *.zsh files load before that.
# The asdf shims dir is added to PATH in zsh/path.zsh.
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
