# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Git aliases
alias gs='git status -sb'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpl='git pull --prune'
alias gp='git push origin HEAD'
alias gpf='git push origin HEAD --force-with-lease'

alias gd='git diff'
alias gds='git diff --staged'

alias ga='git add'
alias gaa='git add --all'
alias gac='git add -A && git commit -m'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'

alias gco='git checkout'
alias gsw='git switch'
alias gswc='git switch -c'

alias gb='git branch'
alias gba='git branch -a'

alias gst='git stash'
alias gstp='git stash pop'

alias grb='git rebase'
alias grbi='git rebase -i'

alias gcb='git copy-branch-name'
alias ge='git-edit-new'

ghelp() {
  grep "^alias g" ~/.dotfiles/git/aliases.zsh \
    | sed 's/^alias \([^=]*\)=\(.*\)/\1\t\2/' \
    | column -t -s $'\t'
}
