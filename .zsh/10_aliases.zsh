#dotfile
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Wifi
alias airportcycle='networksetup -setairportpower en0 off; networksetup -setairportpower en0 on'

# ZSH 
alias zshconfig="nvim ~/.zshrc"
alias zshload="source ~/.zshrc"

# Directory
alias cdsrc="cd ~/src"
alias cdpmm="cd ~/src/packmanager/master"
alias cdpmr="cd ~/src/packmanager/release"
alias cdpmp="cd ~/src/packmanager/production"

# Rails
alias be="bundle exec"

#buildkite
alias bk="buildkite"

# Foreman
alias ff="lsof -i:3000,5555 | grep -v Google | tail -n+2 | awk '{ print \$2 }' | xargs kill"
alias fsl="ff && foreman start -f Procfile.lite"
alias fsa="ff && foreman start -f Procfile.all"

# git
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gap='git add -N . && git add -p'

alias gb='git branch'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'

alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gco='git checkout'

alias gd='git diff'
alias gdc='git diff --cached'

alias gf='git fetch'
alias gfa='git fetch --all --prune'

alias gl='git pull'

alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'

alias gr="git rebase"
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grs='git rebase --skip'

alias gss='git status -s'
alias gst='git status'

alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
