alias g='git'

# add
alias ga=' git add'
alias gap='git add --patch'
alias gau='git add --update'

alias gb=' git branch'
alias gbd='git branch --delete '
alias gbr='git branch --remotes '

# clean
alias gcl='git clean -dx --dry-run .'

# commit
alias gc=' git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'

# checkout
alias gco='git checkout'

# diff
alias gd='git diff'
alias gdc='git diff --cached'

# fetch
alias gf=' git fetch --tags'
alias gfp='git fetch --prune'

# log
alias gl=' git log'
alias gll='git log --abbrev-commit --decorate --pretty=oneline --graph'
alias gla='git log --abbrev-commit --decorate --pretty=oneline --graph --all'

# pull
alias gp=' git pull'
alias gpr='git pull --rebase'

# rebase
alias gr='git rebase'

# status
alias gs=' git status'
alias gss='git status --short'

# show
alias gsh=' git show'
alias gshc='git show --pretty="format:" --name-only'

# stash
alias gst=' git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
