alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias st='open -a "Sublime Text"'

# thefuck — corrects the previous console command. Loaded lazily so it
# doesn't slow shell startup; the first `fuck` swaps in the real alias.
fuck() {
  unfunction fuck
  eval $(thefuck --alias)
  fuck "$@"
}
