#dotfile
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
